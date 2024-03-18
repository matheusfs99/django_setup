import secrets


def generate_secret_key(length=50):
    alphabet = "abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*(-_=+)"
    secret_key = ''.join(secrets.choice(alphabet) for _ in range(length))
    return secret_key
