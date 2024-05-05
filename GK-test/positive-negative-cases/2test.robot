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
${random_string}=    Generate Random String    8    [NUMBERS]

*** Test Cases ***
View and Sort Products
    [Documentation]    Test positive case: View and sort products
    [Tags]    Positive    Functionality
    Open Browser    ${URL}    ${BROWSER}
    Login    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Page Contains Element    //div[@id='inventory_container']
    View Product    xpath=//*[@id="item_4_img_link"]
    Navigate Back
    Sort Products    hilo
    Sort Products    lohi
    Sort Products    za
    Sort Products    az
    Close All Browsers

Login With Valid Credentials
    [Documentation]    Test positive case: Logging in with valid credentials
    [Tags]    Positive    Functionality
    Open Browser    ${URL}    ${BROWSER}
    Login    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Page Contains Element    //div[@id='inventory_container']
    Close Browser

Login With Invalid Credentials
    [Documentation]    Test negative case: Logging in with invalid credentials
    [Tags]    Negative    Functionality
    Open Browser    ${URL}    ${BROWSER}
    Login    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Wait Until Page Contains Element    //h3[contains(text(),'Username and password do not match any user')]
    Close Browser


*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Input Text    id=user-name    ${username}
    Input Text    id=password    ${password}
    Click Button    login-button

View Product
    [Arguments]    ${xpath}
    Click Element    ${xpath}

Navigate Back
    Go Back

Sort Products
    [Arguments]    ${value}
    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span/select
    Click Element    xpath=//option[@value="${value}"]
    Sleep    2s
