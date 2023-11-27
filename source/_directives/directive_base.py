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

    def parse_arguments(self):
        t_attribute = 'arg'
        t_arg = ''

        if not hasattr(self, 'used_args'):
            raise Exception('Directive ' + self.__class__.__name__ + ' does not define used_args')

        for arg in self.used_args:
            self.argument_dict[arg] = []

        for index, argument in enumerate(self.arguments):
            
            if not t_attribute in self.used_args:
                raise Exception('Argument ' + t_attribute + ' is not defined in directive ' + self.__class__.__name__)

            if ';' in argument or index == len(self.arguments) - 1:
                t_arg = t_arg + argument.replace(';', '')
                if t_arg != '':
                    self.argument_dict[t_attribute].append(t_arg)
                t_arg = ''
                continue

            if argument.startswith(':'):
                t_arg = t_arg[:-1] 
                if t_arg != '':
                    self.argument_dict[t_attribute].append(t_arg)
                t_attribute = argument.replace(':', '')
                t_arg = ''
                continue

            t_arg = t_arg + argument + ' '