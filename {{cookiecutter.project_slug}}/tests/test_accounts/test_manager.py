import pytest
from apps.accounts.models import User

pytestmark = pytest.mark.django_db


def test_create_user(faker):
    user = User.objects.create_user(faker.email(), None)
    assert not user.is_staff
    assert not user.is_superuser


@pytest.mark.xfail(raises=ValueError)
def test_create_user_null_email():
    User.objects.create_user(None, None)


def test_create_superuser(faker):
    user = User.objects.create_superuser(faker.email(), None)
    assert user.is_staff
    assert user.is_superuser


@pytest.mark.xfail(raises=ValueError)
def test_create_superuser_not_staff(faker):
    User.objects.create_superuser(faker.email(), None, is_staff=False)


@pytest.mark.xfail(raises=ValueError)
def test_create_superuser_not_super(faker):
    User.objects.create_superuser(faker.email(), None, is_superuser=False)
