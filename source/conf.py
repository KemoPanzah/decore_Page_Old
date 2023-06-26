import os, sys

decore_Base_path = os.path.abspath('../../decore_Base/')

sys.path.append(decore_Base_path)

def setup(app):
    print ('DECORE_BASE_PATH: '+ decore_Base_path)
    print("Hello World!")

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

extensions = ['sphinx.ext.autodoc', 'sphinx_copybutton', 'sphinx_favicon']

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

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
}

html_static_path = ['_static']

html_css_files = [
    'styles/custom.css',
]

html_logo = "_static/logo.png"

favicons = [
    {"href": "favicon.ico"},
]