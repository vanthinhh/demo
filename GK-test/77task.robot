*** Settings ***
Library           SeleniumLibrary
Library           String

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
    [Documentation]    Test login with valid credentials
    Input Text      id=user-name    ${VALID_USERNAME}
    Input Text      id=password     ${VALID_PASSWORD}
    Click Button    login-button
    Wait Until Page Contains Element    //div[@id='inventory_container']
    Close Browser

Login With Invalid Credentials
    Open Browser    ${URL}    ${BROWSER}
    [Documentation]    Test login with invalid credentials
    Input Text      id=user-name    ${INVALID_USERNAME}
    Input Text      id=password    ${INVALID_PASSWORD}
    Click Button    login-button
    Wait Until Page Contains Element    //h3[contains(text(),'Username and password do not match any user')]
    Close Browser

Verify Username Requirements
    [Documentation]    Test username requirements
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    invalid_username_&
    Click Button    login-button
    Wait Until Page Contains Element    //h3[contains(text(),'Epic sadface: Password is required')]
    ${error_message}=    Get Text    xpath=//*[@id="login_button_container"]/div/form/div[3]    Epic sadface: Password is required
    Should Be Equal    ${error_message}    Epic sadface: Password is required
    Close Browser


Verify Password Requirements
    [Documentation]    Test password requirements
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${VALID_USERNAME}
    Input Text      id=password    invalid_password
    Click Button    login-button
    Wait Until Page Contains Element    //h3[contains(text(),'Epic sadface: Password is required')]
    Close Browser
