from docutils.parsers.rst import Directive
from jinja2 import Environment, FileSystemLoader
from pathlib import Path

class Directive_base(Directive):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.language = self.state.document.settings.env.config.language
        self.argument_dict = {}
        self.parse_arguments()
        self.env = Environment(loader=FileSystemLoader(Path('source/_directives/templates').absolute()))

    def parse_arguments(self):
        t_attribute = 'arg'
        t_arg = ''
        for index, argument in enumerate(self.arguments):
            
            if ';' in argument or index == len(self.arguments) - 1:
                t_arg = t_arg + argument.replace(';', '')
                self.argument_dict[t_attribute] = self.argument_dict.get(t_attribute, []) + [t_arg]
                # if t_attribute in self.translate_args:
                #     self.argument_dict[t_attribute] = [gettext.gettext(item) for item in self.argument_dict[t_attribute]]
                t_arg = ''
                continue

            if argument.startswith(':'):
                t_arg = t_arg[:-1] 
                self.argument_dict[t_attribute] = self.argument_dict.get(t_attribute, []) + [t_arg]
                # if t_attribute in self.translate_args:
                #     self.argument_dict[t_attribute] = [gettext.gettext(item) for item in self.argument_dict[t_attribute]]
                t_attribute = argument.replace(':', '')
                t_arg = ''
                continue

            t_arg = t_arg + argument + ' '