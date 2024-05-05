*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.saucedemo.com/
${VALID_USERNAME}    standard_user
${VALID_PASSWORD}    secret_sauce
${INVALID_USERNAME}  problem_user
${INVALID_PASSWORD}  invalid_password

*** Test Cases ***
Login With Valid Credentials
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${VALID_USERNAME}
    Input Text      id=password     ${VALID_PASSWORD}
    Click Button    login-button
    Wait Until Page Contains Element    //div[@id='inventory_container']
    [Teardown]    Close Browser

Login With Invalid Credentials
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${INVALID_USERNAME}
    Input Text      id=password    ${INVALID_PASSWORD}
    Click Button    login-button
    Wait Until Page Contains Element    //h3[contains(text(),'Username and password do not match any user')]
    [Teardown]    Close Browser
