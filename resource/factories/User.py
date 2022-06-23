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
        },
        'short_desc':{
            'name': 'Peter',
            'lastname': 'Jordan',
            'email': 'peter@einerd.com',
            'password': 'pwd123',
            'geek_profile': {
                'whats':'21981906757',
                'desc':'Formato o seu PC',
                'printer_repair':'Não',
                'work':'Ambos',
                'cost':'200'
            }
        },
        'long_desc':{
            'name': 'Rodrigo',
            'lastname': 'Silva',
            'email': 'rodrigo@arqueologo.com',
            'password': 'pwd123',
            'geek_profile': {
                'whats':'17981906757',
                'desc':'Nada do que é social e humano é mais real que as utopias. Na sua vertente eutópica, as utopias constituíram sempre o fundamento simbólico e mítico sem o qual nenhuma forma de organização social se sustenta, justifica ou sobrevive. E criam, tanto na vertente eutópica como na distópica, o vocabulário da revolução e da mudança.',
                'printer_repair':'Não',
                'work':'Ambos',
                'cost':'200'
            }
        }
    }

    return data[target]
