from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf 8'), bcrypt.gensalt(8))
    return hashed

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

def factory_user_login():

    return {
        'name': 'Everton',
        'lastname': 'Souza',
        'email': 'everton@souza.com.br',
        'password': 'pwd123'
    }


def factory_user_be_geek():

    return {
        'name': 'Kim',
        'lastname': 'Dotcom',
        'email': 'kim@dot.com',
        'password': 'pwd123',
        'geek_profile': {
            'whats':'349987549832',
            'desc':'Seu computador esta lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formatando, reinstalando o SO, trocando algum componente físico porque não remover o baidu ou qualquer outro malware.',
            'printer_repair':'Sim',
            'work':'Remoto',
            'cost':'100'
        }
    }
