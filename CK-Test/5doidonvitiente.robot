*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://automationteststore.com

*** Test Cases ***
TimKiemSanPham
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}
    # Bước 5: Hover vào mục Pound Sterling và chọn
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span
    Click Element    xpath=//*[contains(text(), 'Pound Sterling')]

    # Bước 6: Đóng trình duyệt
    Close Browser
