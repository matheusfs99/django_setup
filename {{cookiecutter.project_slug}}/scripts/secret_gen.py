import secrets


def secret_gen(length=50):
    alphabet = "abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*(-_=+)"
    secret_key = ''.join(secrets.choice(alphabet) for _ in range(length))
    return secret_key
