from pathlib import Path
from selenium.webdriver import Firefox, FirefoxOptions
from time import sleep
from PIL import Image

class Imagic:
    
    def __init__(self, p_path, p_relative=None, p_url=None, p_width=1920, p_height=1080, p_opt_height=720):
        self._path = p_path
        self.relative = p_relative
        self.url = p_url
        self.full_path = Path().joinpath('source', p_path)
        self.width = p_width
        self.height = p_height
        self.opt_height = p_opt_height
        self.run()

    @property
    def path(self):
        if self.relative is None:
            return self._path
        else:
            return self.relative+self._path
    
    def run(self):
        if not self.full_path.exists() and self.url is not None:
            self.full_path.parent.mkdir(parents=True, exist_ok=True)
            self.screenshot()
        elif not self.full_path.exists() and self.url is None:
            raise FileNotFoundError(f'Image not found: {self.full_path}')
        
    def screenshot(self):
        opts = FirefoxOptions()
        opts.add_argument("-headless")
        opts.add_argument("--width="+str(self.width))
        opts.add_argument(str("--height="+str(self.height+85)))
        browser = Firefox(options=opts)
        browser.get(self.url)
        sleep(5)
        browser.get_screenshot_as_file(self.full_path.absolute())
        browser.quit()
        self.optimize()
    
    def optimize(self):
        # Open the screenshot with Pillow, resize it to opt_height in current ration and save it
        image = Image.open(self.full_path)
        width, height = image.size
        ratio = width / height
        new_width = int(self.opt_height * ratio)
        image = image.resize(size=[new_width, self.opt_height])
        image.save(self.full_path, optimize=True)