from polib import pofile
import json
from deepl import Translator
from pathlib import Path

entries = {
    'EN-US': {
        'decore Base | UI fastly': 'decore Base | UI fastly',
        'Basis': 'Base',
        'Erste Schritte': 'Get started',
        'Gui': 'gui',
        'Modell': 'Model',
        'schnell': 'fast',
        'Ansicht': 'View',
        'Ausführung, Entwicklung und Erstellung': 'Run, development and build',
        'Ausführung': 'Run',
        'Entwicklung': 'Development',
        'Erstellung': 'Build',
    }
}


class Localizer(Translator):
    __data__ = None
    __file_data__ = {}
    file_path = Path('source/_locale').joinpath('locales.json')
    auth_key = json.load(open('../auth_key.json'))['deepl']

    def __init__(self, p_lang_code):
        Translator.__init__(self, self.auth_key)
        self.load_data()
        self.source_lang = 'DE'
        self.target_lang = self.get_lang(p_lang_code)
        self.gloss = self.get_gloss()

    @classmethod
    def load_data(cls):
        if cls.__data__ is None:
            try:
                with open(cls.file_path, 'r') as t_file:
                    cls.__data__ = json.load(t_file)
                    cls.__file_data__.update(cls.__data__)
            except FileNotFoundError:
                cls.__data__ = {}

    @classmethod
    def save_data(cls):
        if not cls.__data__ == cls.__file_data__:
            with open(cls.file_path, 'w') as t_file:
                json.dump(cls.__data__, t_file, indent=4)
                cls.__file_data__.update(cls.__data__)

    def get_lang(self, p_lang_code):
        language_map = {
            'de': 'DE',
            'en': 'EN-US',
        }
        return language_map[p_lang_code]

    def get_gloss(self):
        t_glossary = None
        if self.source_lang != self.target_lang:
            for i_glossary in self.list_glossaries():
                if i_glossary.name == self.target_lang:
                    if self.get_glossary_entries(i_glossary) != entries[self.target_lang]:
                        self.delete_glossary(i_glossary)
                        t_glossary = None
                    else:
                        t_glossary = i_glossary

            if not t_glossary:
                self.glossary = self.create_glossary(
                    self.target_lang,
                    source_lang=self.source_lang,
                    target_lang=self.target_lang,
                    entries=entries[self.target_lang],
                )

        return t_glossary

    def translate_po_file(self, p_file):
        t_po_file = pofile(p_file)
        for entry in t_po_file:
            if entry.msgid and not entry.msgstr or entry.fuzzy:
                entry.msgstr = self.translate(entry.msgid)
                entry.fuzzy = False
        t_po_file.save()

    def translate(self, p_text):
        if not p_text in self.__data__:
            self.__data__[p_text] = {}
        if not self.target_lang in self.__data__[p_text]:
            if self.source_lang != self.target_lang:
                self.__data__[p_text][self.target_lang] = self.translate_text_with_glossary(p_text, self.gloss, target_lang=self.target_lang).text
            else:
                self.__data__[p_text][self.target_lang] = p_text
            self.save_data()
        return self.__data__[p_text][self.target_lang]
