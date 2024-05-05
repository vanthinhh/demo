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
DangKiTaiKhoanMoi-0
    [Documentation]    đăng nhập không có thông tin
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s
    
    #first name
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    First Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #LastName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Email
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Address
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #City
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser



DangKiTaiKhoanMoi-1


    [Documentation]    Login name đạt độ dài tối thiểu và chỉ chứa ký tự chữ cái và số:
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


    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser


DangKiTaiKhoanMoi-1.1


    [Documentation]    Login name dài hơn 64 ký tự:
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
    
    Input Text    id=AccountFrm_loginname   thisisalongloginnamethatisdefinitelymorethan64characterslongggggggggggggggggggg


    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser


DangKiTaiKhoanMoi-1.2


    [Documentation]    Login name chứa ký tự đặc biệt:

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
    
    Input Text    id=AccountFrm_loginname   user@123


    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser


DangKiTaiKhoanMoi-1.3


    [Documentation]    Login name chứa khoảng trắng

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
    
    Input Text    id=AccountFrm_loginname   user name


    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser


DangKiTaiKhoanMoi-1.4


    [Documentation]    Login name chứa ký tự đặc biệt và đủ độ dài:

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
    
    Input Text    id=AccountFrm_loginname   test!@#123


    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser


DangKiTaiKhoanMoi-1.5


    [Documentation]    Login name có độ dài nhỏ hơn 5 ký tự:

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
    
    Input Text    id=AccountFrm_loginname   a


    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser

DangKiTaiKhoanMoi-1.6


    [Documentation]    Login name không chứa ký tự chữ cái hoặc số:

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
    
    Input Text    id=AccountFrm_loginname   $%^&&*


    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #LoginName
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser



DangKiTaiKhoanMoi-1.7


    [Documentation]    Login name đủ điều kiện đúng:
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
    
    Input Text    id=AccountFrm_loginname   user123


    # Bước 3: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s

    

   

    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Zip
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    

    #LoginPassword
    Wait Until Element Is Visible    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Password must be between 4 and 20 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: You must agree to the Privacy Policy!
    Should Match Regexp    ${message}    .*Error: You must agree to the Privacy Policy!.*


    # Bước 4: Đóng trình duyệt
    Close Browser



