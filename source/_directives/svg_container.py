from .directive_base import Directive_base
from docutils import nodes
from pathlib import Path


class Svg_container(Directive_base):
    has_content = True
    required_arguments = 1
    optional_arguments = 1000
    used_args = ['arg', 'class', 'height', 'alt']
    translate_args = ['alt']

    def run(self):
        root_container = nodes.container()
        template = self.env.get_template('svg_container.html')

        t_svg = []
        for svg in self.argument_dict['arg']:
            t_path = Path(
                self.state.document.settings.env.srcdir).joinpath(svg)
            with open(t_path, 'r') as f:
                t_svg.append(f.read())

        html = template.render(
            p_svg=t_svg,
            p_class=self.argument_dict['class'],
            p_height=self.argument_dict['height'],
            p_alt=self.argument_dict['alt']
        )

        if self.state.document.settings.env.app.builder.name == 'html':
            root_container.append(nodes.raw('', html, format='html'))

        return [root_container]
