*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}               Chrome
${URL}                   https://practice-automation.com/tables/
${DROPDOWN_XPATH}        //select[@name="tablepress-1_length"]
${TABLE_XPATH}           //*[@id="tablepress-1"]
${COLUMN_XPATH}          ${TABLE_XPATH}/thead/tr/th[2]
${ROW_XPATH}             ${TABLE_XPATH}/tbody/tr
${NEXT_PAGE_XPATH}       //*[@id="tablepress-1_next"]
${INFO_XPATH}            //*[@id="tablepress-1_info"]

*** Test Cases ***

View Table Data 1-25 / top 10
    [Documentation]    View top 10 data entries from the table (1-25).

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào cột đầu tiên của bảng
    Sleep    10s
    Select From List by Value    ${DROPDOWN_XPATH}    10

    # In tất cả thông tin trong bảng hiện tại
    ${info_text}    Get Text    ${INFO_XPATH}
    Log Table Data 1->10

    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Click Element    ${NEXT_PAGE_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Wait Until Element Is Visible    ${ROW_XPATH}
    Log Table Data 11->20

    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Click Element    ${NEXT_PAGE_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Wait Until Element Is Visible    ${ROW_XPATH}
    Log Table Data 21->25

    [Teardown]    Close Browser

View Table Data 25->1 / top 10
    [Documentation]    View top 10 data entries from the table in reverse order (25-1).

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào cột đầu tiên của bảng
    Double Click Element    ${COLUMN_XPATH}
    Sleep    10s
    Select From List by Value    ${DROPDOWN_XPATH}    10

    # In tất cả thông tin trong bảng hiện tại
    ${info_text}    Get Text    ${INFO_XPATH}
    Log Table Data 25->16


    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Click Element    ${NEXT_PAGE_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Wait Until Element Is Visible    ${ROW_XPATH}
    Log Table Data 15->6

    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Click Element    ${NEXT_PAGE_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Wait Until Element Is Visible    ${ROW_XPATH}
    Log Table Data 5->1

    [Teardown]    Close Browser



View Table Data 1->25 / top 25
    [Documentation]    View top 25 data entries from the table (1-25).

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào cột đầu tiên của bảng
    Click Element    ${COLUMN_XPATH}
    Sleep    10s
    Select From List by Value    ${DROPDOWN_XPATH}    25

    # In tất cả thông tin trong bảng hiện tại
    ${info_text}    Get Text    ${INFO_XPATH}
    Log Table Data 1->25


    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]
    Wait Until Element Is Visible    ${ROW_XPATH}


    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]
    Wait Until Element Is Visible    ${ROW_XPATH}

    [Teardown]    Close Browser

View Table Data 25->1 / top 25
    [Documentation]    View top 25 data entries from the table in reverse order (25-1).

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào cột đầu tiên của bảng
    Double Click Element    ${COLUMN_XPATH}
    Sleep    10s
    Select From List by Value    ${DROPDOWN_XPATH}    25

    # In tất cả thông tin trong bảng hiện tại
    ${info_text}    Get Text    ${INFO_XPATH}
    Log Table Data 25->1


    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]
    Wait Until Element Is Visible    ${ROW_XPATH}


    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]
    Wait Until Element Is Visible    ${ROW_XPATH}


    [Teardown]    Close Browser


View Table Data 1->50 / top 50
    [Documentation]    View top 50 data entries from the table (1-50).

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào cột đầu tiên của bảng
    Click Element    ${COLUMN_XPATH}
    Sleep    10s
    Select From List by Value    ${DROPDOWN_XPATH}    50

    # In tất cả thông tin trong bảng hiện tại
    ${info_text}    Get Text    ${INFO_XPATH}
    Log Table Data 1->50


    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]
    Wait Until Element Is Visible    ${ROW_XPATH}


    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]
    Wait Until Element Is Visible    ${ROW_XPATH}

    [Teardown]    Close Browser

View Table Data 50->1 / top 50
    [Documentation]    View top 50 data entries from the table in reverse order (50-1).

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào cột đầu tiên của bảng
    Double Click Element    ${COLUMN_XPATH}
    Sleep    10s
    Select From List by Value    ${DROPDOWN_XPATH}    50

    # In tất cả thông tin trong bảng hiện tại
    ${info_text}    Get Text    ${INFO_XPATH}
    Log Table Data 50->1


    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]
    Wait Until Element Is Visible    ${ROW_XPATH}


    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]
    Wait Until Element Is Visible    ${ROW_XPATH}


    [Teardown]    Close Browser


View Table Data 1->100 / top 100
    [Documentation]    View top 100 data entries from the table (1-100).

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào cột đầu tiên của bảng
    Click Element    ${COLUMN_XPATH}
    Sleep    10s
    Select From List by Value    ${DROPDOWN_XPATH}    100

    # In tất cả thông tin trong bảng hiện tại
    ${info_text}    Get Text    ${INFO_XPATH}
    Log Table Data 1->100


    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]
    Wait Until Element Is Visible    ${ROW_XPATH}


    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]
    Wait Until Element Is Visible    ${ROW_XPATH}

    [Teardown]    Close Browser

View Table Data 100->1 / top 100
    [Documentation]    View top 100 data entries from the table in reverse order (100-1).

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào cột đầu tiên của bảng
    Double Click Element    ${COLUMN_XPATH}
    Sleep    10s
    Select From List by Value    ${DROPDOWN_XPATH}    100

    # In tất cả thông tin trong bảng hiện tại
    ${info_text}    Get Text    ${INFO_XPATH}
    Log Table Data 100->1


    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]
    Wait Until Element Is Visible    ${ROW_XPATH}


    # Lăn chuột để hiển thị trang tiếp theo của bảng và in thông tin trong trang đó
    Scroll Element Into View    ${NEXT_PAGE_XPATH}
    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]
    Wait Until Element Is Visible    ${ROW_XPATH}


    [Teardown]    Close Browser
*** Keywords ***
Log Table Data 1->10
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END
    
Log Table Data 11->20
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

Log Table Data 21->25
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END


Log Table Data 25->16
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END


Log Table Data 15->6
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

Log Table Data 5->1
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END


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

Log Table Data 1->50
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

Log Table Data 50->1
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

Log Table Data 1->100
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

Log Table Data 100->1
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END
