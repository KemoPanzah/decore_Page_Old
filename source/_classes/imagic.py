from pathlib import Path
from selenium import webdriver
from time import sleep

class Imagic:
    
    def __init__(self, p_path, p_url=None):
        self._path = p_path
        self._url = p_url
        self.run()

    @property
    def path(self):
        return self._path
    
    def run(self):
        full_path = Path(self._path).absolute()
        pass