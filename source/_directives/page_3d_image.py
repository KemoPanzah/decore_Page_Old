from .directive_base import Directive_base
from docutils import nodes
from pathlib import Path


class Page_3d_image(Directive_base):
    has_content = True
    required_arguments = 1
    optional_arguments = 1000
    used_args = ['arg']
    translate_args = []

    def run(self):
        root_container = nodes.container()
        template = self.env.get_template('page_3d_image.html')

        html = template.render(
            arg=self.argument_dict['arg'][0],
        )

        if self.state.document.settings.env.app.builder.name == 'html':
            root_container.append(nodes.raw('', html, format='html'))

        return [root_container]
