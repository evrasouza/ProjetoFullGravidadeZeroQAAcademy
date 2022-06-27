*** Settings ***
Documentation        Base test

Library              RequestsLibrary
Library              factories/Users.py

Resource             routes/SessionsRoute.robot
Resource             routes/UsersRoute.robot
Resource             Helpers.robot


*** Variables ***
${API_URL}        https://getgeeks-users-evra.herokuapp.com
