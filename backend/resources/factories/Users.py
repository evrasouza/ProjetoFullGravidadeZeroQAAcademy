

def factory_new_user():
    return {
        'name': 'Clint Barton',
        'email': 'clint@barton.com.br',
        'password': 'pwd123'
    }

def factory_get_user():
    return {
        'name': 'Gwen Stacy',
        'email': 'gwen@ozcorp.com.br',
        'password': 'pwd123'
    }

def factory_remove_user():
    return {
        'name': 'Thaddeus Ross',
        'email': 'ross@gmail.com.br',
        'password': 'pwd123'
    }

def factory_update_user():
    
    email = 'evertonRafael@gmail.com.br'

    return {
        'before': {
            'name': 'Souza Everton',
            'email': email,
            'password': 'pwd123'
        },
        'after': {
            'name': 'Everton Souza Alterado',
            'email': email,
            'whatsapp': '19999999999',
            'avatar': 'https://dt2sdf0db8zob.cloudfront.net/wp-content/uploads/2019/12/9-Best-Online-Avatars-and-How-to-Make-Your-Own-for-Free-image1-5.png'
        }
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