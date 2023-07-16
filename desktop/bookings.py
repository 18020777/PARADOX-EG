import json

import requests

from auth import TokenGetter


class APIBookingsClient:
    def __init__(self, token=None):
        self.base_url = 'http://127.0.0.1:8000/api'
        self._token = token

    def get_data(self, resource):

        if self._token is None:
            print('Access token not found')
            return None

        url = f'{self.base_url}/{resource}'
        headers = {'Authorization': f'Token {self._token}'}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Raise an exception for 4xx and 5xx status codes
            return response.json()
        except requests.exceptions.RequestException as e:
            print(f'Request failed: {e}')
            return None
