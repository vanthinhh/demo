*** Settings ***
Documentation  Assignment 3: Perform actions on Window Operations page and verify
Library  SeleniumLibrary

*** Variables ***
${URL}  https://automationteststore.com/
${BROWSER}  Chrome
${Page Index}    https://automationteststore.com/

*** Test Cases ***
Perform Actions on Window Operations Page and Verify
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Sleep  2s  # Wait for the page to load completely

    # Check if the current page link matches ${Page Index}
    ${current_url}=  Get Location
    Should Be Equal As Strings  ${current_url}  ${Page Index}
    
    # Click "Replace Window" button
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span
    Click Element  xpath=//*[contains(text(), ' Euro')]
    Switch Window  A place to practice your automation skills!
    

    #Check button header1
    Log    Check button header1 
    Wait Until Element Is Visible    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span    timeout=5s

    ${message}=    Get Text    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span
    ${expected_message}=    Set Variable     € EURO

    Should Match Regexp    ${message}    € EURO
    
    #Check button header2 
    Log    Check button header2 
    Wait Until Element Is Visible    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a    timeout=5s

    ${message}=    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a
    ${expected_message}=    Set Variable     0 ITEMS - 0.00€

    Should Match Regexp    ${message}    0 ITEMS - 0.00€

    Log    Check thumnail với 1 sẩn phẩm bất kì xem đã chuyển qua dùng euro chưa
    #check giá vị trí 1 của sản phẩm
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]
    Wait Until Element Is Visible    xpath=//*[@id="product_details"]/div/div[2]/div/div/div[1]/div/div    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="product_details"]/div/div[2]/div/div/div[1]/div/div
    ${expected_message}=    Set Variable     27.69€

    Should Match Regexp    ${message}    27.69€
    
    Log    check giá vị trí 2 của sản phẩm

    Wait Until Element Is Visible    xpath=//*[@id="product"]/fieldset/div[2]/label/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="product"]/fieldset/div[2]/label/span
    ${expected_message}=    Set Variable     27.69€

    Should Match Regexp    ${message}    27.69€


    Log    add vào card tiếp tục check
    Click Element    xpath=//*[@id="product"]/fieldset/div[4]/ul/li/a

    Wait Until Element Is Visible    xpath=//*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[4]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[4]
    ${expected_message}=    Set Variable     27.69€

    Should Match Regexp    ${message}    27.69€

    Log    Check lại phần table thanh toán

    Wait Until Element Is Visible    xpath=//*[@id="totals_table"]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="totals_table"]

    ${expected_message}=    Set Variable     27.69€

    Should Match Regexp    ${message}    27.69€
    Log    check lại giá trị giỏ hàng trên header
    Wait Until Element Is Visible    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a    timeout=5s

    ${message}=    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a
    ${expected_message}=    Set Variable     1 ITEMS - 27.69€

    Should Match Regexp    ${message}    1 ITEMS - 27.69€