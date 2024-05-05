*** Settings ***
#Fax:thông tin trống,~,0,1qa,TDTU
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}    https://automationteststore.com
${BROWSER}       Chrome
${Page Index}    https://automationteststore.com/
${Page Swap-1}   https://automationteststore.com/index.php?rt=account/login
${Page Swap-2}   https://automationteststore.com/index.php?rt=account/create
*** Test Cases ***


DangKiTaiKhoanMoi-1


    [Documentation]    Subcribe with Error: E-Mail Address is already registered!
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button


    
   #first name
    Input Text    id=AccountFrm_firstname    John123
    Input Text    id=AccountFrm_lastname    Doe123
    Input Text    id=AccountFrm_email    example@example.com
    Input Text    id=AccountFrm_telephone    0123456789
    Input Text    id=AccountFrm_fax    1234567890
    Input Text    id=AccountFrm_company    Tôn Đức Thắng University
    Input Text    id=AccountFrm_address_1    123 Đường Lê Lai, Quận 1, Thành phố Hồ Chí Minh
    Input Text    id=AccountFrm_address_2    123 Đường Lê Lai, Quận 1, Thành phố Hồ Chí Minh
    Input Text    id=AccountFrm_city    Ho Chi Minh City


    Select From List by Label    id=AccountFrm_country_id    Viet Nam
    Sleep    10seconds
    Select From List by Label    id=AccountFrm_zone_id    Ho Chi Minh City
    Input Text    id=AccountFrm_postcode    12345
    
    Input Text    id=AccountFrm_loginname   test123
    Input Text    id=AccountFrm_password    pass123
    Input Text    id=AccountFrm_confirm    pass123

    Click Element    xpath=//*[@id="AccountFrm_newsletter1"]
    Sleep    3s
    Click Element    xpath=//*[@id="AccountFrm_newsletter0"]
    Sleep    3s

    Click Element    xpath=//*[@id="AccountFrm_agree"]
    # Bước 3: Xác nhận và đăng kí
    #Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    #Sleep    10s

    

   

    #Region / State:
    

    #Zip
    


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser

