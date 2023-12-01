from polib import pofile
import deepl, json

auth_key = json.load(open('auth_key.json'))['deepl']
translator = deepl.Translator(auth_key)

t_glossary = None
t_glossary_name = 'de-en'

# Create an German to English glossary with two terms:
entries = {
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

for glossary in translator.list_glossaries():
    if glossary.name == t_glossary_name:
        if translator.get_glossary_entries(glossary) != entries:
            translator.delete_glossary(glossary)
            t_glossary = None
        else:
            t_glossary = glossary
    
if not t_glossary:
    t_glossary = translator.create_glossary(
        t_glossary_name,
        source_lang='DE',
        target_lang='EN-US',
        entries=entries,
    )

def translate(p_file):
    t_po_file = pofile(p_file)
    for entry in t_po_file:
        if entry.msgid and not entry.msgstr or entry.fuzzy:
            t_text = translator.translate_text_with_glossary(entry.msgid, t_glossary, target_lang='EN-US').text
            entry.msgstr = t_text
            entry.fuzzy = False
    t_po_file.save()