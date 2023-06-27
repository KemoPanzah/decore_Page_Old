import os, re
from pathlib import Path
import shutil

def split_rst_file(filename:Path, output_dir:Path, exclude:list = []):
    sections = []
    with open(filename, 'r') as f:
        lines = f.readlines()

    t_section_index = 0

    for index , line in enumerate(lines):
        if '-\n' in line:
            t_title = (''.join(char for char in lines[t_section_index] if char.isalnum())).lower()
            sections.append({'title': t_title ,'content':''.join(lines[t_section_index:index-1])})
            t_section_index = index-1

    t_title = (''.join(char for char in lines[t_section_index] if char.isalnum())).lower()
    sections.append({'title': t_title ,'content':''.join(lines[t_section_index:len(lines)])})

    shutil.rmtree(output_dir, ignore_errors=True)
    output_dir.mkdir(parents=True, exist_ok=True)

    for index, section in enumerate(sections):
        if section['title'] not in exclude:
            with open(output_dir.joinpath(section['title']+'.rst'), 'w') as f:
                f.write(section['content'])
