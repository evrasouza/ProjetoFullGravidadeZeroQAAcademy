*** Settings ***
Documentation        Shared Actions

Library    Browser
Library    Collections

Resource   ../Base.robot

*** Keywords ***
Modal Content Should Be
    [Arguments]                ${expect_message}

    ${title}        Set Variable        css=.swal2-title
    ${content}      Set Variable        css=.swal2-html-container

    Wait For Elements State    ${title}     visible      5
    Get Text                   ${title}     equal        Oops...
    
    Wait For Elements State    ${content}   visible      5
    Get Text                   ${content}   equal        ${expect_message}