from polib import pofile
import deepl, json

auth_key = json.load(open('auth_key.json'))['deepl']
translator = deepl.Translator(auth_key)

# Create an German to English glossary with two terms:
entries = {
    'Basis': 'Base',
    'Erste Schritte': 'Get started',
    'Gui': 'gui',
    'Modell': 'Model',
    'schnell': 'fast',
    }

my_glossary = translator.create_glossary(
    'My glossary',
    source_lang='DE',
    target_lang='EN-US',
    entries=entries,
)

def translate(p_file):
    t_po_file = pofile(p_file)
    for entry in t_po_file:
        if entry.msgid and not entry.msgstr or entry.fuzzy:
            t_text = translator.translate_text_with_glossary(entry.msgid, my_glossary, target_lang='EN-US').text
            entry.msgstr = t_text
            entry.fuzzy = False
    t_po_file.save()