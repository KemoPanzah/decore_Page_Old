from .directive_base import Directive_base
from docutils import nodes
from pathlib import Path


class Page_feature_pane(Directive_base):
    has_content = True
    required_arguments = 1
    optional_arguments = 1000
    used_args = ['arg', 'svg', 'image', 'source', 'content']
    translate_args = ['arg', 'content']

    def run(self):
        root_container = nodes.container()
        template = self.env.get_template('page_feature_pane.html')

        t_svg = []
        for svg in self.argument_dict['svg']:
            t_path = Path(self.state.document.settings.env.srcdir).joinpath(svg)
            with open(t_path, 'r') as f:
                t_svg.append(f.read())


        html = template.render(
            arg=self.argument_dict['arg'],
            svg = t_svg,
            image=self.argument_dict['image'],
            content=self.argument_dict['content']
        )

        if self.state.document.settings.env.app.builder.name == 'html':
            root_container.append(nodes.raw('', html, format='html'))

        return [root_container]
