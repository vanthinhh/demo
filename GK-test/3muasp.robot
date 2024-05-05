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
View and Buy Products
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
    #checkout
    Click Button   xpath=//*[@id="checkout"]
    Sleep     2s  
    Input Text    id=first-name    thinhdepzai${random_string}
    Sleep     2s  
    Input Text    id=last-name   nguyen
    Sleep     2s  
    Input Text    id=postal-code  ${random_string}
    Sleep     2s  
    Click Button  xpath=//*[@id="continue"]
    Click Button  id=finish
    Sleep     2s  
    Click Button  id=back-to-products
    Close All Browsers

View and Buy Products with 0đ
    Open Browser    ${URL}    ${BROWSER}


    Input Text      id=user-name    ${VALID_USERNAME}
    Input Text      id=password     ${VALID_PASSWORD}
    Click Button    login-button
    Wait Until Page Contains Element    //div[@id='inventory_container']







    Click Element    xpath=//*[@id="shopping_cart_container"]/a
    Sleep     2s  
    #checkout
    Click Button   xpath=//*[@id="checkout"]
    Sleep     2s  
    Input Text    id=first-name    thinhdepzai${random_string}
    Sleep     2s  
    Input Text    id=last-name   nguyen
    Sleep     2s  
    Input Text    id=postal-code  ${random_string}
    Sleep     2s  
    Click Button  xpath=//*[@id="continue"]
    Click Button  id=finish
    Sleep     2s  
    Click Button  id=back-to-products
    Close All Browsers