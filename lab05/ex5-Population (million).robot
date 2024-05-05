*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}               Chrome
${URL}                   https://practice-automation.com/tables/
${TABLE_XPATH}           //*[@id="tablepress-1"]
${COLUMN_XPATH}          ${TABLE_XPATH}/thead/tr/th[3]
${ROW_XPATH}             ${TABLE_XPATH}/tbody/tr
${NEXT_PAGE_XPATH}       //*[@id="tablepress-1_next"]
${INFO_XPATH}            //*[@id="tablepress-1_info"]

*** Test Cases ***
View Table Data min->max
    [Documentation]    View table data sorted from minimum to maximum.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào cột đầu tiên của bảng
    Click Element   ${COLUMN_XPATH}          
    Sleep    10s

    # In tất cả thông tin trong bảng hiện tại
    ${info_text}    Get Text    ${INFO_XPATH}
    Log Table Data min->max

    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Click Element    ${NEXT_PAGE_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Wait Until Element Is Visible    ${ROW_XPATH}
    Log Table Data min->max

    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Click Element    ${NEXT_PAGE_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Wait Until Element Is Visible    ${ROW_XPATH}
    Log Table Data min->max
    ${info_text}    Get Text    ${INFO_XPATH}

    [Teardown]    Close Browser

View Table Data max->min
    [Documentation]    View table data sorted from maximum to minimum.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào cột đầu tiên của bảng
    Double Click Element    ${COLUMN_XPATH}
    Sleep    10s

    # In tất cả thông tin trong bảng hiện tại
    Log Table Data max->min
    ${info_text}    Get Text    ${INFO_XPATH}


    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Click Element    ${NEXT_PAGE_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Wait Until Element Is Visible    ${ROW_XPATH}
    Log Table Data max->min

    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Click Element    ${NEXT_PAGE_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Wait Until Element Is Visible    ${ROW_XPATH}
    Log Table Data max->min
    ${info_text}    Get Text    ${INFO_XPATH}

    [Teardown]    Close Browser

*** Keywords ***
Log Table Data min->max
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

Log Table Data max->min
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END
