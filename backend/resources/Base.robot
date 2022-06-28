*** Settings ***
Documentation        Base test

Library              RequestsLibrary
Library              factories/Users.py

Resource             routes/SessionsRoute.robot
Resource             routes/UsersRoute.robot
Resource             routes/GeeksRoute.robot
Resource             Helpers.robot


*** Variables ***
${API_URL}        https://getgeeks-users-evra.herokuapp.com
${API_GEEKS}      https://getgeeks-geeks-evra.herokuapp.com
