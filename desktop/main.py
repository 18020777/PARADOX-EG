import sys

from PyQt6.QtWidgets import QApplication
from app import LoginWindow, MainWindow


def main():
    app = QApplication(sys.argv)

    def on_login_successful():
        main_window = MainWindow()
        main_window.show()

    window = LoginWindow(login_callback=on_login_successful)
    window.show()
    sys.exit(app.exec())


if __name__ == "__main__":
    main()
