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
    Execute Sql String    DELETE from public.geeks;
    Execute Sql String    DELETE from public.users;