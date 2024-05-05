*** Settings ***
Library    SeleniumLibrary
Library    String
*** Variables ***
${BROWSER}    Chrome
${URL}        https://www.saucedemo.com/
${VALID_USERNAME}    standard_user
${VALID_PASSWORD}    secret_sauce
${random_string}=    Generate Random String    8    [NUMBERS]

*** Test Cases ***
View and Update card
    Open Browser    ${URL}    ${BROWSER}
    #Đăng Nhập
    Input Text      id=user-name    ${VALID_USERNAME}
    Input Text      id=password     ${VALID_PASSWORD}
    Click Button    login-button
    Wait Until Page Contains Element    //div[@id='inventory_container']
    #xem sp
    Click Button    xpath=//*[@id="add-to-cart-sauce-labs-backpack"]
    #add sp
    Sleep    2s 
    Click Element    xpath=//*[@id="shopping_cart_container"]/a
    Sleep     2s 
    Click Button    xpath=//*[@id="remove-sauce-labs-backpack"]
    Close All Browsers