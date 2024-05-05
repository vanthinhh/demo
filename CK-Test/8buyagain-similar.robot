*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}    https://automationteststore.com

*** Test Cases ***
DangKiTaiKhoanMoi
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
    Click Button    //*[@id="loginFrm"]/fieldset/button

    # Bước 5: Về Trang Main
    Click Element    //*[@id="categorymenu"]/nav/ul/li[1]/a
    # Bước 2: Click vào sản phẩm
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/a/img

    # Bước 3: Kiểm tra trạng thái của sản phẩm
    ${add_to_cart_button}=    Element Should Be Visible    xpath=//*[@id="product"]/fieldset/div[4]/ul/li/a

    Run Keyword If    '${add_to_cart_button}' == 'None'
    ...    Log    Sản phẩm hết hàng
    ...    ELSE
    ...    Log    Sản phẩm còn trong kho

    # Bước 4: Ấn vào nút "Add to Cart"
    Click Element    xpath=//*[@id="product"]/fieldset/div[4]/ul/li/a

    # Bước 5: Ấn vào nút "Check-out"
    Click Element    xpath=//*[@id="cart_checkout1"]

    # Bước 6: Click vào nút  "Confirm Order" 	
    Click Element    xpath=//*[@id="checkout_btn"]
    # Bước 7: Click vào nút continue 
    Click Element    //*[@id="maincontainer"]/div/div/div/div/section/a
    # Bước 8 : Click vào nút Main
    Click Element    //*[@id="categorymenu"]/nav/ul/li[1]/a
    # Bước 9: Click vào sản phẩm
    Click Element    //*[@id="block_frame_featured_1769"]/div/div[3]/div[2]/a/img
    # Bước 10: Ấn vào nút "Add to Cart"
    Click Element    xpath=//*[@id="product"]/fieldset/div[4]/ul/li/a

    # Bước 11: Ấn vào nút "Check-out"
    Click Element    xpath=//*[@id="cart_checkout1"]

    # Bước 12: Click vào nút  "Confirm Order" 	
    Click Element    xpath=//*[@id="checkout_btn"]
    # Bước 13: Click vào nút continue 
    Click Element    //*[@id="maincontainer"]/div/div/div/div/section/a