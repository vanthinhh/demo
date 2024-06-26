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
View and Sort Products
    Open Browser    ${URL}    ${BROWSER}
    #Đăng Nhập
    Input Text      id=user-name    ${VALID_USERNAME}
    Input Text      id=password     ${VALID_PASSWORD}
    Click Button    login-button
    Wait Until Page Contains Element    //div[@id='inventory_container']
    #Xem Sản Phẩm
    Click Element   xpath=//*[@id="item_4_img_link"]
    #Quay về index
    Click Element   xpath=//*[@id="back-to-products"]

    Click Element   xpath=//*[@id="header_container"]/div[2]/div/span/select
    #loc san pham 
    Click Element   xpath=//option[@value="hilo"]
    Sleep    2s 
    Click Element   xpath=//option[@value="lohi"]
    Sleep    2s 
    Click Element   xpath=//option[@value="za"]
    Sleep    2s 
    Click Element   xpath=//option[@value="az"]
    Sleep    2s 

    #add sp
    Click Button    xpath=//*[@id="add-to-cart-sauce-labs-backpack"] 
    Sleep    2s
    Click Element    xpath=//*[@id="shopping_cart_container"]/a
    Sleep    2s
    #check out
    Click Button   xpath=//*[@id="checkout"]
    Input Text    id=first-name    thinhdepzai${random_string}
    Input Text    id=last-name   nguyen
    Input Text    id=postal-code  ${random_string}
    Click Button  xpath=//*[@id="continue"]
    Click Button  id=finish
    Click Button  id=back-to-products
    Close All Browsers
