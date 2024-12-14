import requests


def download_file_token_auth(url, token, save_path):
    # Set the headers for token authentication
    headers = {
        'Authorization': f'Bearer {token}'
    }

    # Send a GET request with token authentication
    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        # Write the content to a file
        with open(save_path, 'wb') as f:
            f.write(response.content)
        print(f"File downloaded successfully and saved to {save_path}.")
    else:
        print(f"Failed to download file. Status code: {response.status_code}")
        print(response.text)


# Example usage
url = "https://www.bing.com/ck/a?!&&p=ad0879d506b576b913ac6b8d1490c6f60d01fcac0fb2b986958ff7c6b7c6fb99JmltdHM9MTczNDEzNDQwMA&ptn=3&ver=2&hsh=4&fclid=1898e00a-e395-63cd-298f-f32ee22762b8&psq=dogspdf&u=a1aHR0cHM6Ly93d3cuZG9nZG9vcnMuY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE3LzEwL0RvZy1icmVlZC1ib29rLWxvdy1yZXNvbHV0aW9uLnBkZg&ntb=1"  # Replace with the actual URL
token = "repo"  # Replace with your access token
save_path = "downloaded_file.txt"  # Path to save the downloaded file

download_file_token_auth(url, token, save_path)
