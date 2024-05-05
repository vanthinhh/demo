*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}    https://automationteststore.com

*** Test Cases ***

DangNhapTaiKhoanMoi0
    [Documentation]    done-register then login but rỗng

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    # Bước 3: Nhập thông tin cần thiết để đăng kí tài khoản mới
    ${random_string}=    Generate Random String    8    [NUMBERS]
    ${dynamic_email}=    Set Variable    testuser${random_string}@example.com

    Input Text    id=AccountFrm_firstname    YourFirstName
    Input Text    id=AccountFrm_lastname    YourLastName
    Input Text    id=AccountFrm_email    ${dynamic_email}
    Input Text    id=AccountFrm_telephone    0123456789
    Input Text    id=AccountFrm_fax    ${random_string}
    Input Text    id=AccountFrm_company    HoChiMinh
    Input Text    id=AccountFrm_address_1    YourAddress
    Input Text    id=AccountFrm_address_2    YourAddress
    Input Text    id=AccountFrm_city    YourCity

    # Bước 4: Nhảy tới chọn đất nước trước
    Select From List by Label    id=AccountFrm_country_id    Viet Nam

    # Bước 5: Quay lại chọn bang/địa phương
    Select From List by Label    id=AccountFrm_zone_id    Ho Chi Minh City

    Input Text    id=AccountFrm_postcode    123
    Input Text    id=AccountFrm_loginname   thinh_${random_string}
    Input Text    id=AccountFrm_password    Thinhml09
    Input Text    id=AccountFrm_confirm    Thinhml09

    # Bước 6: Chọn Yes cho Newsletter
    Click Element    xpath=//*[@id="AccountFrm_newsletter1"]

    # Bước 7: Chọn đồng ý với điều khoản
    Click Element    xpath=//*[@id="AccountFrm_agree"]

    # Bước 8: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button

    # Bước 9: Kiểm tra xem tài khoản đã được tạo thành công chưa
    Click Element    //*[@id="maincontainer"]/div/div[1]/div/div/section/a
    # Bước 10: Đóng trình duyệt
    Click Element    //*[@id="customer_menu_top"]/li/a/div
    Click Element    //*[@id="maincontainer"]/div/div[2]/div[1]/div/ul/li[10]/a
    Click Element    //*[@id="customer_menu_top"]/li/a
    # Bước 3: Nhập thông tin tài khoản đã đăng ký
    #Input Text    id=loginFrm_loginname   thinh_${random_string}
    #Input Text    id=loginFrm_password    Thinhml09
    
    # Bước 4: Chọn "Đăng nhập"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a

    Click Button    //*[@id="loginFrm"]/fieldset/button

    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: Incorrect login or password provided.

    Should Match Regexp    ${message}    Error: Incorrect login or password provided.

    Close All Browsers


DangNhapTaiKhoanMoi1
    [Documentation]    done-register then login 

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    # Bước 3: Nhập thông tin cần thiết để đăng kí tài khoản mới
    ${random_string}=    Generate Random String    8    [NUMBERS]
    ${dynamic_email}=    Set Variable    testuser${random_string}@example.com

    Input Text    id=AccountFrm_firstname    YourFirstName
    Input Text    id=AccountFrm_lastname    YourLastName
    Input Text    id=AccountFrm_email    ${dynamic_email}
    Input Text    id=AccountFrm_telephone    0123456789
    Input Text    id=AccountFrm_fax    ${random_string}
    Input Text    id=AccountFrm_company    HoChiMinh
    Input Text    id=AccountFrm_address_1    YourAddress
    Input Text    id=AccountFrm_address_2    YourAddress
    Input Text    id=AccountFrm_city    YourCity

    # Bước 4: Nhảy tới chọn đất nước trước
    Select From List by Label    id=AccountFrm_country_id    Viet Nam

    # Bước 5: Quay lại chọn bang/địa phương
    Select From List by Label    id=AccountFrm_zone_id    Ho Chi Minh City

    Input Text    id=AccountFrm_postcode    123
    Input Text    id=AccountFrm_loginname   thinh_${random_string}
    Input Text    id=AccountFrm_password    Thinhml09
    Input Text    id=AccountFrm_confirm    Thinhml09

    # Bước 6: Chọn Yes cho Newsletter
    Click Element    xpath=//*[@id="AccountFrm_newsletter1"]

    # Bước 7: Chọn đồng ý với điều khoản
    Click Element    xpath=//*[@id="AccountFrm_agree"]

    # Bước 8: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button

    # Bước 9: Kiểm tra xem tài khoản đã được tạo thành công chưa
    Click Element    //*[@id="maincontainer"]/div/div[1]/div/div/section/a
    # Bước 10: Đóng trình duyệt
    Click Element    //*[@id="customer_menu_top"]/li/a/div
    Click Element    //*[@id="maincontainer"]/div/div[2]/div[1]/div/ul/li[10]/a
    Click Element    //*[@id="customer_menu_top"]/li/a
    # Bước 3: Nhập thông tin tài khoản đã đăng ký
    Input Text    id=loginFrm_loginname   thinh_${random_string}
    Input Text    id=loginFrm_password    Thinhml09
    
    # Bước 4: Chọn "Đăng nhập"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a

    Click Button    //*[@id="loginFrm"]/fieldset/button

    #Error




DangNhapTaiKhoanMoi1.1
    [Documentation]    done-register then login but có sai tài khoản 

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    # Bước 3: Nhập thông tin cần thiết để đăng kí tài khoản mới
    ${random_string}=    Generate Random String    8    [NUMBERS]
    ${dynamic_email}=    Set Variable    testuser${random_string}@example.com

    Input Text    id=AccountFrm_firstname    YourFirstName
    Input Text    id=AccountFrm_lastname    YourLastName
    Input Text    id=AccountFrm_email    ${dynamic_email}
    Input Text    id=AccountFrm_telephone    0123456789
    Input Text    id=AccountFrm_fax    ${random_string}
    Input Text    id=AccountFrm_company    HoChiMinh
    Input Text    id=AccountFrm_address_1    YourAddress
    Input Text    id=AccountFrm_address_2    YourAddress
    Input Text    id=AccountFrm_city    YourCity

    # Bước 4: Nhảy tới chọn đất nước trước
    Select From List by Label    id=AccountFrm_country_id    Viet Nam

    # Bước 5: Quay lại chọn bang/địa phương
    Select From List by Label    id=AccountFrm_zone_id    Ho Chi Minh City

    Input Text    id=AccountFrm_postcode    123
    Input Text    id=AccountFrm_loginname   thinh_${random_string}
    Input Text    id=AccountFrm_password    Thinhml09
    Input Text    id=AccountFrm_confirm    Thinhml09

    # Bước 6: Chọn Yes cho Newsletter
    Click Element    xpath=//*[@id="AccountFrm_newsletter1"]

    # Bước 7: Chọn đồng ý với điều khoản
    Click Element    xpath=//*[@id="AccountFrm_agree"]

    # Bước 8: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button

    # Bước 9: Kiểm tra xem tài khoản đã được tạo thành công chưa
    Click Element    //*[@id="maincontainer"]/div/div[1]/div/div/section/a
    # Bước 10: Đóng trình duyệt
    Click Element    //*[@id="customer_menu_top"]/li/a/div
    Click Element    //*[@id="maincontainer"]/div/div[2]/div[1]/div/ul/li[10]/a
    Click Element    //*[@id="customer_menu_top"]/li/a
    # Bước 3: Nhập thông tin tài khoản đã đăng ký
    Input Text    id=loginFrm_loginname   thinh_${random_string}-
    Input Text    id=loginFrm_password    Thinhml09
    
    # Bước 4: Chọn "Đăng nhập"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a

    Click Button    //*[@id="loginFrm"]/fieldset/button

    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: Incorrect login or password provided.

    Should Match Regexp    ${message}    Error: Incorrect login or password provided.

    Close All Browsers

DangNhapTaiKhoanMoi1.2

    [Documentation]    done-register then login but có sai matkhau

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    # Bước 3: Nhập thông tin cần thiết để đăng kí tài khoản mới
    ${random_string}=    Generate Random String    8    [NUMBERS]
    ${dynamic_email}=    Set Variable    testuser${random_string}@example.com

    Input Text    id=AccountFrm_firstname    YourFirstName
    Input Text    id=AccountFrm_lastname    YourLastName
    Input Text    id=AccountFrm_email    ${dynamic_email}
    Input Text    id=AccountFrm_telephone    0123456789
    Input Text    id=AccountFrm_fax    ${random_string}
    Input Text    id=AccountFrm_company    HoChiMinh
    Input Text    id=AccountFrm_address_1    YourAddress
    Input Text    id=AccountFrm_address_2    YourAddress
    Input Text    id=AccountFrm_city    YourCity

    # Bước 4: Nhảy tới chọn đất nước trước
    Select From List by Label    id=AccountFrm_country_id    Viet Nam

    # Bước 5: Quay lại chọn bang/địa phương
    Select From List by Label    id=AccountFrm_zone_id    Ho Chi Minh City

    Input Text    id=AccountFrm_postcode    123
    Input Text    id=AccountFrm_loginname   thinh_${random_string}
    Input Text    id=AccountFrm_password    Thinhml09
    Input Text    id=AccountFrm_confirm    Thinhml09

    # Bước 6: Chọn Yes cho Newsletter
    Click Element    xpath=//*[@id="AccountFrm_newsletter1"]

    # Bước 7: Chọn đồng ý với điều khoản
    Click Element    xpath=//*[@id="AccountFrm_agree"]

    # Bước 8: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button

    # Bước 9: Kiểm tra xem tài khoản đã được tạo thành công chưa
    Click Element    //*[@id="maincontainer"]/div/div[1]/div/div/section/a
    # Bước 10: Đóng trình duyệt
    Click Element    //*[@id="customer_menu_top"]/li/a/div
    Click Element    //*[@id="maincontainer"]/div/div[2]/div[1]/div/ul/li[10]/a
    Click Element    //*[@id="customer_menu_top"]/li/a
    # Bước 3: Nhập thông tin tài khoản đã đăng ký
    Input Text    id=loginFrm_loginname   thinh_${random_string}
    Input Text    id=loginFrm_password    Thinhml09-
    
    # Bước 4: Chọn "Đăng nhập"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a

    Click Button    //*[@id="loginFrm"]/fieldset/button

    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: Incorrect login or password provided.

    Should Match Regexp    ${message}    Error: Incorrect login or password provided.

    Close All Browsers

DangNhapTaiKhoanMoi1.3
    [Documentation]    done-register then login but only tài khoản

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    # Bước 3: Nhập thông tin cần thiết để đăng kí tài khoản mới
    ${random_string}=    Generate Random String    8    [NUMBERS]
    ${dynamic_email}=    Set Variable    testuser${random_string}@example.com

    Input Text    id=AccountFrm_firstname    YourFirstName
    Input Text    id=AccountFrm_lastname    YourLastName
    Input Text    id=AccountFrm_email    ${dynamic_email}
    Input Text    id=AccountFrm_telephone    0123456789
    Input Text    id=AccountFrm_fax    ${random_string}
    Input Text    id=AccountFrm_company    HoChiMinh
    Input Text    id=AccountFrm_address_1    YourAddress
    Input Text    id=AccountFrm_address_2    YourAddress
    Input Text    id=AccountFrm_city    YourCity

    # Bước 4: Nhảy tới chọn đất nước trước
    Select From List by Label    id=AccountFrm_country_id    Viet Nam

    # Bước 5: Quay lại chọn bang/địa phương
    Select From List by Label    id=AccountFrm_zone_id    Ho Chi Minh City

    Input Text    id=AccountFrm_postcode    123
    Input Text    id=AccountFrm_loginname   thinh_${random_string}
    Input Text    id=AccountFrm_password    Thinhml09
    Input Text    id=AccountFrm_confirm    Thinhml09

    # Bước 6: Chọn Yes cho Newsletter
    Click Element    xpath=//*[@id="AccountFrm_newsletter1"]

    # Bước 7: Chọn đồng ý với điều khoản
    Click Element    xpath=//*[@id="AccountFrm_agree"]

    # Bước 8: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button

    # Bước 9: Kiểm tra xem tài khoản đã được tạo thành công chưa
    Click Element    //*[@id="maincontainer"]/div/div[1]/div/div/section/a
    # Bước 10: Đóng trình duyệt
    Click Element    //*[@id="customer_menu_top"]/li/a/div
    Click Element    //*[@id="maincontainer"]/div/div[2]/div[1]/div/ul/li[10]/a
    Click Element    //*[@id="customer_menu_top"]/li/a
    # Bước 3: Nhập thông tin tài khoản đã đăng ký
    Input Text    id=loginFrm_loginname   thinh_${random_string}
    #Input Text    id=loginFrm_password    Thinhml09-
    
    # Bước 4: Chọn "Đăng nhập"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a

    Click Button    //*[@id="loginFrm"]/fieldset/button

    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: Incorrect login or password provided.

    Should Match Regexp    ${message}    Error: Incorrect login or password provided.

    Close All Browsers

DangNhapTaiKhoanMoi1.4
    [Documentation]    done-register then login but only matkhau

    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Chọn tùy chọn "Đăng kí"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button

    # Bước 3: Nhập thông tin cần thiết để đăng kí tài khoản mới
    ${random_string}=    Generate Random String    8    [NUMBERS]
    ${dynamic_email}=    Set Variable    testuser${random_string}@example.com

    Input Text    id=AccountFrm_firstname    YourFirstName
    Input Text    id=AccountFrm_lastname    YourLastName
    Input Text    id=AccountFrm_email    ${dynamic_email}
    Input Text    id=AccountFrm_telephone    0123456789
    Input Text    id=AccountFrm_fax    ${random_string}
    Input Text    id=AccountFrm_company    HoChiMinh
    Input Text    id=AccountFrm_address_1    YourAddress
    Input Text    id=AccountFrm_address_2    YourAddress
    Input Text    id=AccountFrm_city    YourCity

    # Bước 4: Nhảy tới chọn đất nước trước
    Select From List by Label    id=AccountFrm_country_id    Viet Nam

    # Bước 5: Quay lại chọn bang/địa phương
    Select From List by Label    id=AccountFrm_zone_id    Ho Chi Minh City

    Input Text    id=AccountFrm_postcode    123
    Input Text    id=AccountFrm_loginname   thinh_${random_string}
    Input Text    id=AccountFrm_password    Thinhml09
    Input Text    id=AccountFrm_confirm    Thinhml09

    # Bước 6: Chọn Yes cho Newsletter
    Click Element    xpath=//*[@id="AccountFrm_newsletter1"]

    # Bước 7: Chọn đồng ý với điều khoản
    Click Element    xpath=//*[@id="AccountFrm_agree"]

    # Bước 8: Xác nhận và đăng kí
    Click Button    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button

    # Bước 9: Kiểm tra xem tài khoản đã được tạo thành công chưa
    Click Element    //*[@id="maincontainer"]/div/div[1]/div/div/section/a
    # Bước 10: Đóng trình duyệt
    Click Element    //*[@id="customer_menu_top"]/li/a/div
    Click Element    //*[@id="maincontainer"]/div/div[2]/div[1]/div/ul/li[10]/a
    Click Element    //*[@id="customer_menu_top"]/li/a
    # Bước 3: Nhập thông tin tài khoản đã đăng ký
    #Input Text    id=loginFrm_loginname   thinh_${random_string}
    Input Text    id=loginFrm_password    Thinhml09-
    
    # Bước 4: Chọn "Đăng nhập"
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a

    Click Button    //*[@id="loginFrm"]/fieldset/button

    #Error
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div/div/div[1]    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    ${expected_message}=    Set Variable     Error: Incorrect login or password provided.

    Should Match Regexp    ${message}    Error: Incorrect login or password provided.

    Close All Browsers

