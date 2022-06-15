from faker import Faker
fake = Faker()

def factory_user():
    return {
        'name': fake.first_name(),
        'lastname': fake.last_name(),
        'email': fake.free_email().lower(),
        'password': 'pwd123'
    }

def factory_wrong_email():

    first_name = fake.first_name()

    return {
        'name': first_name,
        'lastname': fake.last_name(),
        'email': first_name.lower() + '&gmail.com',
        'password': 'pwd123'
    }
