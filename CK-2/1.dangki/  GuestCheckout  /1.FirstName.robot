*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String


*** Variables ***

${URL}    https://automationteststore.com/index.php?rt=account/login
${BROWSER}       Chrome
${Page Index}    https://automationteststore.com/
${Page Swap-1}   https://automationteststore.com/index.php?rt=account/login
${Page Swap-2}   https://automationteststore.com/index.php?rt=account/create
*** Test Cases ***
DangKiTaiKhoanMoi-0
    [Documentation]    First Name không có ký tự nào (rỗng):(điều kiện để xảy ra : là 1 có ít nhất 1 sản phẩm trong card nếu không có sẽ không hiển thị   Guest Checkout ) 
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

    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    
    #Address 1:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


DangKiTaiKhoanMoi-1
    [Documentation]    First Name có 3 ký tự::(điều kiện để xảy ra : là 1 có ít nhất 1 sản phẩm trong card nếu không có sẽ không hiển thị   Guest Checkout ) 
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
    #input
    Input Text    id=guestFrm_firstname    Tom

    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    
    #Address 1:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


DangKiTaiKhoanMoi-1.2
    [Documentation]    First Name có 2 ký tự:(điều kiện để xảy ra : là 1 có ít nhất 1 sản phẩm trong card nếu không có sẽ không hiển thị   Guest Checkout ) 
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
    #input
    Input Text    id=guestFrm_firstname    Li

    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    
    #Address 1:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}




DangKiTaiKhoanMoi-1.3
    [Documentation]    First Name có hơn 32 ký tự(điều kiện để xảy ra : là 1 có ít nhất 1 sản phẩm trong card nếu không có sẽ không hiển thị   Guest Checkout ) 
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
    #input
    Input Text    id=guestFrm_firstname    Christopher Washington Jefferson Vanderbilt

    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    
    #Address 1:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}





DangKiTaiKhoanMoi-1.4
    [Documentation]    First Name có ít hơn 33 ký tự(điều kiện để xảy ra : là 1 có ít nhất 1 sản phẩm trong card nếu không có sẽ không hiển thị   Guest Checkout ) 
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
    #input
    Input Text    id=guestFrm_firstname    Elizabeth Montgomery Vanderbilt

    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    
    #Address 1:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}





DangKiTaiKhoanMoi-1.5
    [Documentation]    First Name chứa ký tự đặc biệt:(điều kiện để xảy ra : là 1 có ít nhất 1 sản phẩm trong card nếu không có sẽ không hiển thị   Guest Checkout ) 
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
    #input
    Input Text    id=guestFrm_firstname    M@ry

    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name

    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    
    #Address 1:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}




DangKiTaiKhoanMoi-1.6
    [Documentation]    First Name chứa dấu cách:(điều kiện để xảy ra : là 1 có ít nhất 1 sản phẩm trong card nếu không có sẽ không hiển thị   Guest Checkout ) 
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
    #input
    Input Text    id=guestFrm_firstname    [      ]

    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[1]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${expected_message}=    Set Variable    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    
    #Address 1:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}





DangKiTaiKhoanMoi-1.7
    [Documentation]    First Name chứa ký tự số:(điều kiện để xảy ra : là 1 có ít nhất 1 sản phẩm trong card nếu không có sẽ không hiển thị   Guest Checkout ) 
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
    #input
    Input Text    id=guestFrm_firstname    Sam123

    #conform
    Click Element    xpath=//*[@id="guestFrm"]/div[4]/div/button

    Set Selenium Page Load Timeout    5s
    #error message

    #first name
    
    #Last Name:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${expected_message}=    Set Variable    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}
    
    #Address 1:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${expected_message}=    Set Variable    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #City:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${expected_message}=    Set Variable    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}


    #Region / State:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${expected_message}=    Set Variable    Please select a region / state!
    Should Be Equal As Strings    ${message}    ${expected_message}

    #ZIP/Post Code:
    Wait Until Element Is Visible    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span    timeout=5s

    ${message}=    Get Text    xpath=//*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    ${expected_message}=    Set Variable    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${message}    ${expected_message}




























































































































































































































































