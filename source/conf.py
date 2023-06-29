import os, sys
from pathlib import Path


decore_Base_path = os.path.abspath('../../')
sys.path.append(decore_Base_path)

def setup(app):
    from decore_Page.helper import split_rst_file
    print ('DECORE_BASE_PATH: '+ decore_Base_path)
    print("Hello World!")
    split_rst_file(Path('../decore_base').joinpath('README.rst'), Path('source').joinpath('base').joinpath('readme'), ['notes'])

# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'decore People'
copyright = '2023, Jean Rohark'
author = 'Jean Rohark'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ['sphinx.ext.autodoc', 'sphinx_copybutton', 'sphinx_favicon', "sphinx_design", 'sphinx_sitemap']

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

add_module_names = False
autodoc_member_order = 'bysource'


# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_extra_path = ['_files']

html_directory_suffix = '/'

html_theme = 'pydata_sphinx_theme'

html_theme_options = {
   "show_toc_level": 3,
   "navbar_align": "right",
   "logo": {
        "text": "decore Project",
        },
    "footer_start": None,
    "footer_end": ["copyright"],
    "show_prev_next": False,
}

html_static_path = ['_static']

html_css_files = [
    'styles/custom.css',
]

html_show_sourcelink = False

html_logo = "_static/logo.png"

favicons = [
    {"href": "favicon.ico"},
]

html_baseurl = 'https://www.decore.dev/'
sitemap_filename = 'sitemap.xml'
sitemap_url_scheme = "{link}"