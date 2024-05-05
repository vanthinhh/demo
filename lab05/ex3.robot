*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}               Chrome
${URL}                   https://practice-automation.com/tables/
${TABLE_XPATH}           //*[@id="post-1076"]/div/figure/table
${DROPDOWN_XPATH}        //select[@name="tablepress-1_length"]
${TABLE_BODY_XPATH}      //*[@id="tablepress-1"]/tbody
${ROW_XPATH}             ${TABLE_BODY_XPATH}/tr

*** Test Cases ***
Select Dropdown Value
    [Documentation]    Open the page and select values from dropdown.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}

    Select From List by Value    ${DROPDOWN_XPATH}    10    25    50    100
    # Hoặc nếu bạn muốn chọn giá trị dựa trên index
    # Select From List by Index    ${DROPDOWN_XPATH}    1   # Lựa chọn 10
    
    [Teardown]    Close Browser

Select Dropdown Table with 10 
    [Documentation]    Select value 10 from the dropdown and log table data.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}

    Select From List by Value    ${DROPDOWN_XPATH}    10
    Sleep    2s 

    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

    Scroll Element Into View    xpath=//*[@id="tablepress-1_next"]
    Click Element    xpath=//*[@id="tablepress-1_next"]  
    Sleep    2s 

    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

    Scroll Element Into View    xpath=//*[@id="tablepress-1_next"]
    Click Element    xpath=//*[@id="tablepress-1_next"]
    Sleep    2s 

    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

    [Teardown]    Close Browser

Select Dropdown Table with 25
    [Documentation]    Select value 25 from the dropdown and log table data.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}

    Select From List by Value    ${DROPDOWN_XPATH}    25

    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]

    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]

    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

    [Teardown]    Close Browser

Select Dropdown Table with 50
    [Documentation]    Select value 50 from the dropdown and log table data.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}

    Select From List by Value    ${DROPDOWN_XPATH}    50

    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]

    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]

    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

    [Teardown]    Close Browser

Select Dropdown Table with 100
    [Documentation]    Select value 100 from the dropdown and log table data.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}

    Select From List by Value    ${DROPDOWN_XPATH}    100

    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]

    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

    Wait Until Element Is Visible    xpath=//*[@id="tablepress-1_next"]

    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Log    ${row_data}
    END

    [Teardown]    Close Browser