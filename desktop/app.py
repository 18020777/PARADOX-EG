from PyQt6.QtCore import Qt, pyqtSignal
from PyQt6.QtGui import QKeyEvent
from PyQt6.QtWidgets import QMainWindow, QApplication

from pui.loginwindow import Ui_LoginWindow
from pui.mainwindow import Ui_MainWindow

from bookings import APIBookingsClient
import utils as u
import auth


class LoginWindow(Ui_LoginWindow, QMainWindow):

    def __init__(self, login_callback):
        super().__init__()
        self.setupUi(self)
        self.setup_links()
        u.WindowUtils.center_window(self)
        self.login_callback = login_callback

    def handle_login(self):
        username = self.editUsername.text()
        password = self.editPassword.text()
        token_getter = auth.TokenGetter()
        token_auth = auth.TokenAuth(token_getter.get_token(username, password))
        if token_auth.authorization():
            print(self.login_callback)

    def setup_links(self):
        self.buttonLogin.clicked.connect(self.handle_login)

    def keyPressEvent(self, event: QKeyEvent):
        # Handle key press events
        if event.key() == Qt.Key.Key_Return or event.key() == Qt.Key.Key_Enter:
            # Simulate button click when "Enter" key is pressed
            self.buttonLogin.click()
        else:
            # Propagate other key press events to the base class
            super().keyPressEvent(event)

    def login(self):
        pass


class MainWindow(Ui_MainWindow, QMainWindow):
    def __init__(self):
        super().__init__()
        self.setupUi(self)
        # self.setup_links()
        u.WindowUtils.center_window(self)
