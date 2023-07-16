import json

from PyQt6.QtCore import Qt, pyqtSignal
from PyQt6.QtGui import QKeyEvent
from PyQt6.QtWidgets import QMainWindow, QApplication, QWidget, QVBoxLayout

from pui.loginwindow import Ui_LoginWindow
from pui.mainwindow import Ui_MainWindow

from bookings import APIBookingsClient
import utils as u
import auth


class LoginWindow(Ui_LoginWindow, QMainWindow):

    def __init__(self):
        super().__init__()
        self.mainApp = None
        self.setupUi(self)
        self.setup_links()
        u.WindowUtils.center_window(self)

    def login(self):
        username = self.editUsername.text()
        password = self.editPassword.text()
        token_getter = auth.TokenGetter()
        token_auth = auth.TokenAuth(token_getter.get_token(username, password))
        if token_auth.authorization():
            self.mainApp = MainWindow(token_auth)
            self.mainApp.show()
            self.close()

    def setup_links(self):
        self.buttonLogin.clicked.connect(self.login)

    def keyPressEvent(self, event: QKeyEvent):
        # Handle key press events
        if event.key() == Qt.Key.Key_Return or event.key() == Qt.Key.Key_Enter:
            # Simulate button click when "Enter" key is pressed
            self.buttonLogin.click()
        else:
            # Propagate other key press events to the base class
            super().keyPressEvent(event)


# Define the colors
primary_color = "#D27F35"
secondary_color = "#3A3238"
surface_color = "#1e1e1e"
dark_color = "#161315"
light_color = "#b8b8b8"


class MainWindow(Ui_MainWindow, QMainWindow):
    def __init__(self, token_auth):
        super().__init__()
        self.token_auth = token_auth
        self.ui = Ui_MainWindow()
        self.ui.setupUi(self)
        self.central_widget()
        self.setStyleSheet(f"""
            QWidget {{
                background-color: {surface_color};
                color: {light_color};
            }}
            QLabel {{
                color: {light_color};
                font-size: 14px;
            }}
        """)

        self.fetch_bookings()

    def central_widget(self):
        central_widget = QWidget()
        self.setCentralWidget(central_widget)

        layout = QVBoxLayout(central_widget)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.addWidget(self.ui.bookingList)

        self.fetch_bookings()

    def fetch_bookings(self):
        bookings = APIBookingsClient(self.token_auth.get_token()).get_data()
        if bookings is not None:
            for booking in bookings['results']:
                self.ui.bookingList.addItem(
                    f"Booking ID: {booking['id']}, User: {booking['user']}, "
                    f"Date: {booking['date']}, Time: {booking['time']}, "
                    f"Players: {booking['num_players']}"
                )
        else:
            print("Failed to fetch bookings from the API.")
