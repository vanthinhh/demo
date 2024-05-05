*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}    https://automationteststore.com

*** Test Cases ***
NhapVaCopyEmail
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập dữ liệu vào trường email
    ${dynamic_email}=    Generate Random String    8    [NUMBERS]
    Input Text    id=AccountFrm_email    testuser${dynamic_email}@example.com

    # Bước 3: Copy dữ liệu từ trường email
    ${copied_email}=    Get Text    id=AccountFrm_email

    # Bước 4: Log để kiểm tra kết quả
    Log    Email nhập vào: ${dynamic_email}
    Log    Email đã được copy: ${copied_email}

    # Bước 5: Đóng trình duyệt
    Close Browser
