import os
import sys
import subprocess
from pathlib import Path

projects_path = os.path.abspath('../../')
sys.path.append(projects_path)

# fmt: off
from decore_Page.source._classes import *
from decore_Page.source._directives import *
# fmt: on


def get_language(app):
    html_context = {
        'language': app.config.language,
    }


def on_build_finished(app, exception):
    if not exception:
        if app.builder.name == 'gettext':
            t_lang = app.config.language
            cmd = ['sphinx-intl', 'update', '-p', 'source/_text', '-l', t_lang]
            subprocess.run(cmd, cwd=os.path.abspath('.'), check=True)
            app.config.localizer.translate_po_file(
                Path('source/_locale/'+t_lang+'/LC_MESSAGES').joinpath('docs.po'))


def setup(app):
    app.config['localizer'] = Localizer(app.config.language)
    app.add_directive('html-modal-image', Html_modal_image)
    app.add_directive('page-3d-image', Page_3d_image)
    app.add_directive('html-inpage-nav', Html_inpage_nav)
    app.add_directive('page-tabs', Page_tabs)
    app.add_directive('page-feature-pane', Page_feature_pane)
    app.connect('builder-inited', get_language)
    app.connect('build-finished', on_build_finished)

# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information


project = 'decore Base'
copyright = '2023, Jean Rohark'
author = 'Jean Rohark'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ['sphinx.ext.autodoc', 'sphinx_sitemap',
              'sphinxcontrib.mermaid', 'sphinxcontrib.jquery', 'sphinx_immaterial']

locale_dirs = ['_locale/']
gettext_compact = "docs"

language = 'de'

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

add_module_names = False
autodoc_member_order = 'bysource'


# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

# Project information
html_title = 'decore Base | UI fastly'

# HTML options
html_baseurl = 'https://www.decore.dev/'
html_directory_suffix = '/'
html_logo = "_static/logo.png"
html_favicon = "_static/favicon.ico"
html_show_sourcelink = False

# Paths
html_static_path = ['_static']
html_extra_path = ['_files']

# Theme
html_theme = 'sphinx_immaterial'

html_theme_options = {
    "languages": [
        {
            "name": "German",
            "link": "de",  # points to ./fr/ subdirectory
            "lang": "de",
        },
        {
            "name": "English",
            "link": "en",  # points to ./en/ subdirectory
            "lang": "en",
        },
    ],
    "palette": [
        {
            "media": "(prefers-color-scheme: light)",
            "scheme": "default",
            "accent": "light-blue",
            "toggle": {
                "icon": "material/lightbulb-outline",
                "name": "Switch to dark mode",
            },
        },
        {
            "media": "(prefers-color-scheme: dark)",
            "scheme": "slate",
            "accent": "lime",
            "toggle": {
                "icon": "material/lightbulb",
                "name": "Switch to light mode",
            },
        },
    ],
    "features": [
        # "navigation.expand",
        # "navigation.tabs",
        # "toc.integrate",
        # "navigation.sections",
        # "navigation.instant",
        # "header.autohide",
        # "navigation.top",
        # "navigation.tracking",
        # "search.highlight",
        # "search.share",
        # "toc.follow",
        # "toc.sticky",
        # "content.tabs.link",
        # "announce.dismiss",
    ],
}

# CSS
html_css_files = [
    'styles/custom.css',
]

sitemap_filename = 'sitemap.xml'
sitemap_url_scheme = "{link}"

# html5_polyglot_doctype = True
# html5_extra_attrs = {
#     '*': ['data-bs-toggle', 'data-bs-target']
# }
