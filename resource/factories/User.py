from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf 8'), bcrypt.gensalt(8))
    return hashed

def factory_user(target):

    data = {
        'faker': {
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': fake.free_email().lower(),
            'password': 'pwd123'    
        },
        'wrong_email':{
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': fake.first_name().lower() + '&gmail.com',
            'password': 'pwd123'
        },
        'login':{
            'name': 'Everton',
            'lastname': 'Souza',
            'email': 'everton@souza.com.br',
            'password': 'pwd123'

        },
        'be_geek':{
            'name': 'Kim',
            'lastname': 'Dotcom',
            'email': 'kim@dot.com',
            'password': 'pwd123',
            'geek_profile': {
                'whats':'19981906757',
                'desc':'Seu computador esta lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formatando, reinstalando o SO, trocando algum componente físico porque não remover o baidu ou qualquer outro malware.',
                'printer_repair':'Sim',
                'work':'Remoto',
                'cost':'100'
            }
        }
    }

    return data[target]
