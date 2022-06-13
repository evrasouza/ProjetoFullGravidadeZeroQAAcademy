*** Settings ***
Documentation        Database Helpers

Library        DatabaseLibrary

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
    ${q}        Set Variable        INSERT INTO public.users (name, email, password_hash, is_geek) values ('${u}[name] ${u}[lastname]', '${u}[email]', '${u}[password]', false);
    Execute SQL Script        ${q}
    