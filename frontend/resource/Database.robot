*** Settings ***
Documentation        Database Helpers

Library        DatabaseLibrary
Library        factories/User.py

Resource       ../resource/Database.robot

*** Keywords ***
Connect To Postgress
    Connect To Database        psycopg2
    ...                        sjemttiw
    ...                        sjemttiw
    ...                        uWmnKccrm9rhASbTG12W5Zprm_KqFUqd
    ...                        queenie.db.elephantsql.com
    ...                        5432

Reset Env
    Execute SQL String    DELETE from public.geeks;
    Execute SQL String    DELETE from public.users;    

Insert User
    [Arguments]        ${u}

    ${hashed_pass}      Get Hashed Pass    ${u}[password]

    ${q}        Set Variable        INSERT INTO public.users (name, email, password_hash, is_geek) values ('${u}[name] ${u}[lastname]', '${u}[email]', '${hashed_pass}', false);
    
    Execute SQL String        ${q}

Users seed

    ${users}       Users To Insert DB
    
    FOR    ${user}    IN    @{users}
        Insert User    ${user}        
    END