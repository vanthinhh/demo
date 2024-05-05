*** Settings ***
Library    SeleniumLibrary
Library    String
*** Variables ***
${BROWSER}             Chrome
${URL}                 https://www.saucedemo.com/
${VALID_USERNAME}      standard_user
${VALID_PASSWORD}      secret_sauce
${INVALID_USERNAME}    invalid_user
${INVALID_PASSWORD}    invalid_password
${random_string}       Generate Random String    8    [NUMBERS]

*** Test Cases ***
View and Buy Products With Cart
    [Documentation]    Test positive case: View and buy products with items in the cart
    [Tags]    Positive    Functionality
    Open Browser    ${URL}    ${BROWSER}
    Login    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Page Contains Element    //div[@id='inventory_container']
    Add Product To Cart    //*[@id="add-to-cart-sauce-labs-backpack"]
    View Cart
    Checkout
    Fill Checkout Form
    Complete Purchase
    Return To Products Page
    Close All Browsers

View and Buy Products Without Cart
    [Documentation]    Test negative case: View and buy products without adding any item to the cart
    [Tags]    Negative    Functionality
    Open Browser    ${URL}    ${BROWSER}
    Login    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Page Contains Element    //div[@id='inventory_container']
    View Cart
    Checkout
    Fill Checkout Form
    Complete Purchase
    Return To Products Page
    Close All Browsers

Login With Invalid Credentials
    [Documentation]    Test negative case: Logging in with invalid credentials
    [Tags]    Negative    Functionality
    Open Browser    ${URL}    ${BROWSER}
    Login    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Wait Until Page Contains Element    //h3[contains(text(),'Username and password do not match any user')]
    Close All Browsers

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Input Text    id=user-name    ${username}
    Input Text    id=password    ${password}
    Click Button    login-button

Add Product To Cart
    [Arguments]    ${xpath}
    Click Button    ${xpath}

View Cart
    Click Button    xpath=//*[@id="shopping_cart_container"]/a
    Sleep    2s

Checkout
    Click Button    xpath=//*[@id="checkout"]
    Sleep    2s

Fill Checkout Form
    Input Text    id=first-name    thinhdepzai${random_string}
    Input Text    id=last-name    nguyen
    Input Text    id=postal-code    ${random_string}
    Sleep    2s

Complete Purchase
    Click Button    xpath=//*[@id="continue"]
    Click Button    id=finish
    Sleep    2s

Return To Products Page
    Click Button    id=back-to-products
    Sleep    2s
