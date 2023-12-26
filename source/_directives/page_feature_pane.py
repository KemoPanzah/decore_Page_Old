from .directive_base import Directive_base
from docutils import nodes
from pathlib import Path


class Page_feature_pane(Directive_base):
    has_content = True
    required_arguments = 1
    optional_arguments = 1000
    used_args = ['arg', 'label', 'svg', 'image', 'source', 'contents']
    translate_args = ['arg', 'label', 'contents']

    def run(self):
        root_container = nodes.container()
        template = self.env.get_template('page_feature_pane.html')

        t_svg_s = []
        for svg in self.argument_dict['svg']:
            t_path = Path(self.state.document.settings.env.srcdir).joinpath(svg)
            with open(t_path, 'r') as f:
                t_svg_s.append(f.read())


        html = template.render(
            arg=self.argument_dict['arg'],
            label=self.argument_dict['label'],
            svg = t_svg_s,
            image=self.argument_dict['image'],
            contents=self.argument_dict['contents']
        )

        if self.state.document.settings.env.app.builder.name == 'html':
            root_container.append(nodes.raw('', html, format='html'))

        return [root_container]
