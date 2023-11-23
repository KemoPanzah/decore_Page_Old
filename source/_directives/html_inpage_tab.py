from .directive_base import Directive_base
from docutils import nodes


class Html_inpage_tab(Directive_base):
    has_content = True
    required_arguments = 1
    optional_arguments = 1000
    translate_args = ['arg', 'labels', 'contents']

    def run(self):
        root_container = nodes.container()
        template = self.env.get_template('html_inpage_tab.html')

        html = template.render(
            arg=self.argument_dict['arg'],
            labels=self.argument_dict['labels'],
            contents=self.argument_dict['contents']
        )

        if self.state.document.settings.env.app.builder.name == 'html':
            root_container.append(nodes.raw('', html, format='html'))

        return [root_container]
