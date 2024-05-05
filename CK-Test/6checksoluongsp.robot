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

    # Bước 2: Click vào sản phẩm
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/a/img

    # Bước 3: Ấn vào nút "Add to Cart"
    Click Element    xpath=//*[@id="product"]/fieldset/div[4]/ul/li/a

    # Bước 4: Ấn vào nút "Continue Shopping"
    Click Element    xpath=//*[@id="cart"]/div/div[3]/div/a[1]

    # Bước 5: Click vào mục cần
    Click Element    xpath=//*[@id="maincontainer"]/div/div[1]/div[1]/ul/li[4]/a[2]

    # Bước 6: Đóng trình duyệt
    Close Browser
