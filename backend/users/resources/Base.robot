*** Settings ***
Documentation        Base test

Library              RequestsLibrary

Resource             routes/SessionsRoute.robot
Resource             routes/UsersRoute.robot

*** Variables ***
${API_URL}        https://getgeeks-users-evra.herokuapp.com
