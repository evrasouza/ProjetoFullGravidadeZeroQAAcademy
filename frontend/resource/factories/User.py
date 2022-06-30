from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf 8'), bcrypt.gensalt(8))
    return hashed

def users_to_insert_db():
    return [
        factory_user('login'),
        factory_user('be_geek'),
        factory_user('attempt_be_geek'),
        factory_user('search_alien'),
        factory_user('search_commom'),
        factory_user('searcher')
    ]

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
        },
        'attempt_be_geek':{
            'name': 'Ronnie',
            'lastname': 'Dio',
            'email': 'ronnie@dio.com',
            'password': 'pwd123',
            'geek_profile': {
                'whats':'17981906757',
                'desc':'Seu computador esta lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formatando, reinstalando o SO, trocando algum componente físico porque não remover o baidu ou qualquer outro malware.',
                'printer_repair':'Não',
                'work':'Ambos',
                'cost':'200'
            }
        },
        'searcher': {
            'name': 'Johnny',
            'lastname': 'Lawrence',
            'email': 'johnny@cobrakai.com',
            'password': 'pwd123'
        },
        'search_alien': {
            'name': 'Dok',
            'lastname': 'Ock',
            'email': 'dok@oscorp.com',
            'password': 'pwd123',
            'geek_profile': {
                'whatsapp': '21999991001',
                'desc': 'Faço conserto de qualquer impressora. Matricial a fita, Matricial a fita colorida, a laser, a jato de tinta e também impressora 3D.',
                'printer_repair': 'Sim',
                'work': 'Presencial',
                'cost': '250'
            }
        },
        'search_commom':{
            'name': 'Peter',
            'lastname': 'Parker',
            'email': 'parker@oscorp.com.br',
            'password': 'pwd123',
            'geek_profile': {
                'whats':'76999999922',
                'desc':'Faço conserto de qualquer impressora. Matricial a fiota, Matricial a fita colorida, a laser, a jato de tinta e também impressora 3D.',
                'printer_repair':'Não',
                'work':'Remoto',
                'cost':'99.43'
            }
        }
    }

    return data[target]
