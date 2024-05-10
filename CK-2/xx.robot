*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String

*** Variables ***
${URL}    https://automationteststore.com
${WAIT_TIME}        5s                     # Thời gian chờ 5 giây
${product_image}    xpath=//*[@id="product_details"]/div/div[1]/div[2]/a/img
*** Test Cases ***
Search by category and retrieve the quantity in the found category
    [Documentation]    tìm theo danh mục và lấy ra số lượng trong danh mục đã tìm được
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Bước 1: Truy cập trang chủ
    Go To    ${URL}

    # Bước 2: Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Click Element    xpath=//*[@id="filter_keyword"]
    Input Text    id=filter_keyword   Womens high heel point toe stiletto sandals ankle strap court shoes
    Click Element    xpath=//*[@id="search_form"]/div/div

    Wait Until Element Is Visible   xpath=//*[@id="maincontainer"]/div/div/div/div

    # Bước 1: Đợi và click vào các phần tử img
    Log    xem các ảnh img của các màu sản phẩm
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[1]
    Wait for Image to Load
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[2]
    Wait for Image to Load    
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[3]
    Wait for Image to Load    
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[4]
    Wait for Image to Load    
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[5]
    Wait for Image to Load    
    Wait and Click Element    xpath=//*[@id="product_details"]/div/div[1]/ul/li[6]
    Wait for Image to Load


 # Bước 1: Đợi và click vào các phần tử img
    Log    click chọn các màu của sản phẩm
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[1]
    ${color-1}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[1]
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[2]
    ${color-2}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[2]
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[3]
    ${color-3}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[3]
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[4]
    ${color-4}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[4]
    Wait and Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[5]
    ${color-5}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[5]

    # Bước 1: Click vào phần tử và kiểm tra
    Wait Until Element Is Visible    xpath=//*[@id="product"]/fieldset/div[2]
    ${quantity_value}    Get Element Attribute    id=product_quantity    value
    Log    số lượng sản phẩm : ${quantity_value}
    ${Total_Price}    Get Text    xpath=//*[@id="product"]/fieldset/div[3]/label/span


    # Bước 5: Đóng trình duyệt
    Set Selenium Page Load Timeout    5s
    # Bước 5: Đóng trình duyệt
    Close Browser

*** Keywords ***
Wait and Click Element
    [Arguments]    ${xpath}
    Wait Until Page Contains Element    ${xpath}    timeout=${WAIT_TIME}
    Click Element    ${xpath}


Wait and Check img
    Wait Until Element Is Visible    xpath=//*[@id="product_details"]/div/div[1]/div[1]
Wait for Image to Load
    Wait Until Element Is Visible    xpath=//img    timeout=${WAIT_TIME}
    Log    Ảnh đã load thành công