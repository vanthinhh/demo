*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String

*** Variables ***
${URL}    https://automationteststore.com

*** Test Cases ***


TimKiemSanPham0
    [Documentation]    TÌm kiếm rỗng
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    #Input Text    id=filter_keyword    [ ]
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message1}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message2}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]
    Should Match Regexp    ${message2}    There is no product that matches the search criteria.

    Set Selenium Page Load Timeout    5s
    # Bước 5: Đóng trình duyệt
    Close Browser

TimKiemSanPham1
    [Documentation]    TÌm kiếm dấu cách
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword    [         ]
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message1}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message2}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]
   
    Should Match Regexp    ${message2}    There is no product that matches the search criteria.

    Set Selenium Page Load Timeout    5s
    # Bước 5: Đóng trình duyệt
    Close Browser


TimKiemSanPham1.1
    [Documentation]    tìm kiếm với các danh mục sản phẩm
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Men
    Click Element    xpath=//*[@id="search_form"]/div/div

    # Bước 3: Tạo số ngẫu nhiên từ 1 đến 16
    ${options}=    Create List    1    2    3    4    6    7    8    9    11    12    13    14    16
    ${length}=    Get Length    ${options}
    ${random_index}=    Evaluate    random.randint(0, ${length}-1)
    ${random_number}=    Get From List    ${options}    ${random_index}


    # Bước 4: Kiểm tra và click vào sản phẩm tương ứng
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[${random_number}]/div[2]/a/img
    Set Selenium Page Load Timeout    5s
    # Bước 5: Đóng trình duyệt
    Close Browser


TimKiemSanPham1.2
    [Documentation]    TÌm kiếm kí tự đặc biệt
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword    ~!@$&*^*@!
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message1}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message2}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]
   
    Should Match Regexp    ${message2}    There is no product that matches the search criteria.

    Set Selenium Page Load Timeout    5s
    # Bước 5: Đóng trình duyệt
    Close Browser

TimKiemSanPham1.3
    [Documentation]    Tìm kiếm bằng số 
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword    1
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message1}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div
    ${message2}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]
    ${message3}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]
    #Should Match Regexp    ${message2}    There is no product that matches the search criteria.

    Set Selenium Page Load Timeout    5s
    # Bước 5: Đóng trình duyệt
    Close Browser