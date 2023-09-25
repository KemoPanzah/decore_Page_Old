from polib import pofile
import deepl, json


auth_key = json.load(open('auth_key.json'))['deepl']
translator = deepl.Translator(auth_key)

def translate(p_file):
    t_po_file = pofile(p_file)
    for entry in t_po_file:
        if entry.msgid and not entry.msgstr:
           entry.msgstr = translator.translate_text(entry.msgid, target_lang='EN-US').text
    t_po_file.save()