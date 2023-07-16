import json

import requests

import auth


class APIBookingsClient:
    def __init__(self, token=None):
        self.url = 'http://127.0.0.1:8000/api/booking/'
        self._token = token

    def get_data(self):

        if self._token is None:
            print('Access token not found')
            return None

        headers = {'Authorization': f'Token {self._token}'}

        try:
            response = requests.get(self.url, headers=headers)
            response.raise_for_status()  # Raise an exception for 4xx and 5xx status codes
            return response.json()
        except requests.exceptions.RequestException as e:
            print(f'Request failed: {e}')
            return None


def main():
    username = input('Enter your username: ')
    password = input('Enter your password: ')

    token_getter = auth.TokenGetter()
    token_auth = auth.TokenAuth(token_getter.get_token(username, password))
    bookings = APIBookingsClient(token_auth.get_token())
    print(bookings.get_data())


if __name__ == '__main__':
    main()
