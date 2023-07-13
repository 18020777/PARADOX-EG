import requests


class APIClient:

    def __init__(self, key):
        self.api_key = key
        self.base_url = 'https://api.example.com'  # Replace with the actual API URL

    def get_data(self, resource):
        url = f'{self.base_url}/{resource}'
        headers = {'Authorization': f'Bearer {self.api_key}'}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Raise an exception for 4xx and 5xx status codes
            return response.json()
        except requests.exceptions.RequestException as e:
            print(f'Request failed: {e}')
            return None


# Example usage
api_key = 'your-api-key'  # Replace with your actual API key
client = APIClient(api_key)

data = client.get_data('resource-name')
if data is not None:
    # Process the data
    print(data)
