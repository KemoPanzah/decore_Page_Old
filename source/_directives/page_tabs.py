from .directive_base import Directive_base
from docutils import nodes
from pathlib import Path


class Page_tabs(Directive_base):
    has_content = True
    required_arguments = 1
    optional_arguments = 1000
    used_args = ['arg', 'labels', 'svgs', 'images', 'sources', 'contents']
    translate_args = ['arg', 'labels', 'contents']

    def run(self):
        root_container = nodes.container()
        template = self.env.get_template('page_tabs.html')

        t_svgs = []
        for svg in self.argument_dict['svgs']:
            t_path = Path(self.state.document.settings.env.srcdir).joinpath(svg)
            with open(t_path, 'r') as f:
                t_svgs.append(f.read())


        html = template.render(
            arg=self.argument_dict['arg'],
            labels=self.argument_dict['labels'],
            svgs = t_svgs,
            images=self.argument_dict['images'],
            contents=self.argument_dict['contents']
        )

        if self.state.document.settings.env.app.builder.name == 'html':
            root_container.append(nodes.raw('', html, format='html'))

        return [root_container]
