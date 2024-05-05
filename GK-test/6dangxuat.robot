*** Settings ***
Library    SeleniumLibrary
Library    String
Library    BuiltIn

*** Variables ***
${BROWSER}    Chrome
${URL}        https://www.saucedemo.com/
${VALID_USERNAME}    standard_user
${VALID_PASSWORD}    secret_sauce
${random_string}=    Generate Random String    8    [NUMBERS]

*** Test Cases ***
View and Sort Products
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${VALID_USERNAME}
    Input Text      id=password     ${VALID_PASSWORD}
    Click Button    login-button
    Wait Until Page Contains Element    //div[@id='inventory_container']
    Sleep   5s
    Click Button  id=react-burger-menu-btn
    Sleep   5s
    Click Button    xpath=//*[@id="react-burger-cross-btn"]
    Close All Browsers