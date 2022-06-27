

def factory_new_user():
    return {
        'name': 'Clint Barton',
        'email': 'clint@barton.com.bbr',
        'password': 'pwd123'
    }

def factory_users_session(target):
    
    name = 'Paul Smith'
    email = 'paul@smith.com'
    password = 'pwd123'

    data = {
        'signup': {
            'name': name,
            'email': email,
            'password': password
        },
        'login': {
            'email': email,
            'password': password
        }
    }

    return data[target]