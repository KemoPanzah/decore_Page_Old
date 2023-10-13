from docutils import nodes
from docutils.parsers.rst import Directive

from .._classes import Imagic


class Html_modal_image(Directive):
    has_content = True
    required_arguments = 1
    optional_arguments = 2
    def run(self):
        # Get the path to the image file
        image_path = None
        image_url = None

        for index, argument in enumerate(self.arguments):
            if index == 0:
                t_image_path = argument
            
            if argument == ':url:':
                image_url = self.arguments[index + 1]

        image = Imagic(t_image_path, image_url)

        root_container = nodes.container()
        html = f'''
        <!-- Button trigger modal -->
            <div style="padding:16px">
                <img class="border" src="{image.path}" alt="My Image" data-bs-toggle="modal" data-bs-target="#triggerModal">
            </div>
            <!-- Modal -->
            <div class="modal fade" id="triggerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" style="max-width: fit-content;">
                    <div class="modal-content">
                        <div class="modal-body" style="padding:32px;">
                        <img src="{image.path}" alt="My Image">
                        <button type="button" class="btn-close btn-light btn-outline-secondary position-absolute" data-bs-dismiss="modal" aria-label="Close" style="top:8px; right:8px"></button>
                        </div>
                    </div>
                </div>
            </div>
            </br>
        '''
        if self.state.document.settings.env.app.builder.name == 'html':
            root_container.append(nodes.raw('', html, format='html'))
        else:
            root_container.append(nodes.image(uri=self.arguments[0]))
                                  
        return [root_container]