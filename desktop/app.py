from PyQt6.QtWidgets import QMainWindow

from pui.mainwindow import Ui_MainWindow


class AppWindow(Ui_MainWindow, QMainWindow):
    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.load_items()
