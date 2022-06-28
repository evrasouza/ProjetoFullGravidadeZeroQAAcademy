

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

def factory_be_geek():

    return {
        'name': 'Andreas Kisser',
        'email': 'andreas@gmail.com',
        'password': 'pwd123',
        'geek_profile': {
            'whatsapp': '19999999999',
            'desc': 'Seu computador esta lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formatando, reinstalando o SO, trocando algum componente físico porque não remover o baidu ou qualquer outro malware.',
            'printer_repair': 'Sim',
            'work': 'Presencial',
            'cost': '199.99'
        }
    }

def factory_search_for_geeks():

    return {
        'user': {
            'name': 'Peter Quill',
            'email': 'quill@marvel.com.br',
            'password': 'pwd123',
        },
        'geeks': [
                {
                    'name': 'Riri Willians',
                    'email': 'riri@marvel.com',
                    'password': 'pwd123',
                    'geek_profile': {
                        'whatsapp': '11999999999',
                        'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
                        'printer_repair': 'Não',
                        'work': 'Presencial',
                        'cost': '100'
                    }
                },
                {
                    'name': 'Arnim Zola',
                    'email': 'zola@hidra.com',
                    'password': 'pwd123',
                    'geek_profile': {
                        'whatsapp': '21999999999',
                        'desc': 'Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unit',
                        'printer_repair': 'Não',
                        'work': 'Ambos',
                        'cost': '110'
                    }
                },
                {
                    'name': 'Reed Richards',
                    'email': 'reed@fantastic4.com',
                    'password': 'pwd123',
                    'geek_profile': {
                        'whatsapp': '31999999999',
                        'desc': 'Instalado e faço manutenção em qualquer tipo de impressora, matricial padrão, matricial fiscal, a jato, a cera, a laser e até 3D. Também faço remold de fitas coloridas para Epson LX300. ',
                        'printer_repair': 'Sim',
                        'work': 'Remoto',
                        'cost': '120'
                    }
                }
            ]
    }