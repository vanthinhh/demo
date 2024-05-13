Check input information and addresses: Validate Region/State: Check valid selection of region/state from the list.
    [Documentation]    Kiểm tra thông tin và địa chỉ đầu vào: Xác thực Vùng/Tiểu bang: Kiểm tra lựa chọn hợp lệ của vùng/tiểu bang từ danh sách.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Jonathan
    Input Text    id=guestFrm_shipping_company    Tôn Đức Thắng
    Input Text    id=guestFrm_shipping_address_1    22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa

    Input Text    id=guestFrm_shipping_address_2    TDTU Nha Trang, 22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa
    Input Text    id=guestFrm_shipping_city    Nha Trang
    Select From List by Label

    
    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address

    #first name


    #Last Name:


    #address

    #city

    #Region / State:

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}





Check input information and addresses: Validate Region/State: Check when region/state is not selected.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5s
    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a


    # quay về guest
    Click Element    xpath=//*[@id="cart_checkout1"]
    #click guest
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]   
    #click button contine
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element    xpath=//*[@id="accountFrm"]/fieldset/button
    Sleep    5s

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/section    timeout=5s
    ${message}    Get Text    xpath=/html/body/div/div[1]/div[2]/section
    Should Contain    ${message}    Home Cart Guest Checkout - Step 1
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[1]
    #input Your Personal Details
    Input Text    id=guestFrm_firstname    John
    Input Text    id=guestFrm_lastname    Jonathan
    Input Text    id=guestFrm_email    thinhprotec@gmail.com
    Input Text    id=guestFrm_telephone    0123456789
    Input Text    id=guestFrm_fax    190789
    ${heading-4}    Get Text    xpath=//*[@id="guestFrm"]/h4[2]
    Input Text    id=guestFrm_company    Tôn Đức Thắng
    Input Text    id=guestFrm_address_1    19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh
    Input Text    id=guestFrm_address_2   GQHM+WHM, Lộc Tiến, Bảo Lộc, Lâm Đồng
    Input Text    id=guestFrm_city    Hồ Chí Minh
    Select From List by Label    id=guestFrm_country_id    Viet Nam
    Select From List by Label    id=guestFrm_zone_id     Ho Chi Minh City 
    Input Text    id=guestFrm_postcode    1231321
    Click Element     xpath=//*[@id="guestFrm_shipping_indicator"]
    #input Shipping Address
    Input Text    id=guestFrm_shipping_firstname    John
    Input Text    id=guestFrm_shipping_lastname    Jonathan
    Input Text    id=guestFrm_shipping_company    Tôn Đức Thắng
    Input Text    id=guestFrm_shipping_address_1    22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa

    Input Text    id=guestFrm_shipping_address_2    TDTU Nha Trang, 22 Đ. Nguyễn Đình Chiểu, Vĩnh Phước, Nha Trang, Khánh Hòa
    Input Text    id=guestFrm_shipping_city    Nha Trang
    Select From List by Label

    
    ${heading-4}    Get Text    //*[@id="shipping_details"]/h4
    
    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    
    #email
    
    #address
    

    #City:

    #Region / State:

    #ZIP/Post Code:
    

    #Shipping Address

    #first name


    #Last Name:


    #address

    #city

    #Region / State:

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[8]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}






    Wait Until Element Is Visible    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span    timeout=5s
    ${message}=    Get Text    xpath=//*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message} 