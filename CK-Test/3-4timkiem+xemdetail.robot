*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String

*** Variables ***
${URL}    https://automationteststore.com

*** Test Cases ***
TimKiemSanPham
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    //*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div

    # Bước 3: Tạo số ngẫu nhiên từ 1 đến 16
    ${options}=    Create List    1    2    3    4    6    7    8    9    11    12    13    14    16
    ${random_number}=    Get From List    ${options}    0    # Chọn một giá trị mặc định nếu danh sách trống

    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[${random_number}]/div[2]/a/img

    # Bước 5: Đóng trình duyệt
    Close Browser