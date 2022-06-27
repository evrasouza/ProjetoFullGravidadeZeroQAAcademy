*** Settings ***
Documentation        Base test

Library              RequestsLibrary

Resource             routes/SessionsRoute.robot

*** Variables ***
${API_URL}        https://getgeeks-users-evra.herokuapp.com
