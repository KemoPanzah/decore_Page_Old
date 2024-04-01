from docutils.parsers.rst import Directive
from jinja2 import Environment, FileSystemLoader
from pathlib import Path

class Directive_base(Directive):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.language = self.state.document.settings.env.config.language
        self.argument_dict = {}
        self.env = Environment(loader=FileSystemLoader(Path('source/_directives/templates').absolute()))
        self.parse_arguments()
        self.translate_arguments()

    def parse_arguments(self):
        t_attribute = 'arg'

        if not hasattr(self, 'used_args'):
            raise Exception('Directive ' + self.__class__.__name__ + ' does not define used_args')

        for arg in self.used_args:
            self.argument_dict[arg] = ''

        for argument in self.arguments:
            
            if not t_attribute in self.used_args:
                raise Exception('Argument ' + t_attribute + ' is not defined in directive ' + self.__class__.__name__)

            if argument.startswith(':'):
                t_attribute = argument.replace(':', '')
                continue

            self.argument_dict[t_attribute] += (' ' + argument) if self.argument_dict[t_attribute] else argument

    def translate_arguments(self):
        if hasattr(self, 'translate_args'):
            for argument in self.translate_args:
                if argument in self.argument_dict:
                    self.argument_dict[argument] = self.state.document.settings.env.config.localizer.translate(self.argument_dict[argument])