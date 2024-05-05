*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}               Chrome
${URL}                   https://practice-automation.com/tables/
${TABLE_XPATH}           //*[@id="tablepress-1"]
${COLUMN_XPATH}          ${TABLE_XPATH}/thead/tr/th[1]
${ROW_XPATH}             ${TABLE_XPATH}/tbody/tr
${NEXT_PAGE_XPATH}       //*[@id="tablepress-1_next"]
${INFO_XPATH}            //*[@id="tablepress-1_info"]

*** Test Cases ***
View Table Data 1-25
    [Documentation]    View the table data from row 1 to 25.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào cột đầu tiên của bảng
    Sleep    10s

    # In tất cả thông tin trong bảng hiện tại
    ${info_text}    Get Text    ${INFO_XPATH}
    Log Table Data 1->25

    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Click Element    ${NEXT_PAGE_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Wait Until Element Is Visible    ${ROW_XPATH}
    Log Table Data 1->25

    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Click Element    ${NEXT_PAGE_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Wait Until Element Is Visible    ${ROW_XPATH}
    Log Table Data 1->25

    [Teardown]    Close Browser

View Table Data 25->1
    [Documentation]    View the table data from row 25 to 1.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào cột đầu tiên của bảng
    Double Click Element    ${COLUMN_XPATH}
    Sleep    10s

    # In tất cả thông tin trong bảng hiện tại
    ${info_text}    Get Text    ${INFO_XPATH}
    Log Table Data 25->1


    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Click Element    ${NEXT_PAGE_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Wait Until Element Is Visible    ${ROW_XPATH}
    Log Table Data 25->1

    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Click Element    ${NEXT_PAGE_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Wait Until Element Is Visible    ${ROW_XPATH}
    Log Table Data 25->1

    [Teardown]    Close Browser

*** Keywords ***
Log Table Data 1->25
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

Log Table Data 25->1
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END
