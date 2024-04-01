from .directive_base import Directive_base
from docutils import nodes
from pathlib import Path


class Svg_container(Directive_base):
    has_content = True
    required_arguments = 1
    optional_arguments = 1000
    used_args = ['arg', 'class', 'height', 'width']
    translate_args = []

    def run(self):
        root_container = nodes.container()
        template = self.env.get_template('svg_container.html')

        t_svg = None
        t_path = Path(self.state.document.settings.env.srcdir).joinpath(self.argument_dict['arg'])
        with open(t_path, 'r') as f:
            t_svg = f.read()

        html = template.render(
            p_svg=t_svg,
            p_class=self.argument_dict['class'],
            p_height=self.argument_dict['height'],
            p_width=self.argument_dict['width']
        )

        if self.state.document.settings.env.app.builder.name == 'html':
            root_container.append(nodes.raw('', html, format='html'))

        return [root_container]
