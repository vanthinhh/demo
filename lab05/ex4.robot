*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}               Chrome
${URL}                   https://practice-automation.com/tables/
${TABLE_XPATH}           //*[@id="tablepress-1"]
${SEARCH_INPUT_XPATH}    //*[@id="tablepress-1_filter"]/label/input
${ROW_XPATH}             ${TABLE_XPATH}/tbody/tr
${INFO_XPATH}            //*[@id="tablepress-1_info"]


${SEARCH_TERM-1}           13  # Giá trị bạn đã search
${SEARCH_TERM-2}           $  # Giá trị bạn đã search
${SEARCH_TERM-3}                 12  # Giá trị bạn đã search
${SEARCH_TERM-4}           11~  # Giá trị bạn đã search
${SEARCH_TERM-5}           13.  # Giá trị bạn đã search
${SEARCH_TERM-6}           183  # Giá trị bạn đã search
${SEARCH_TERM-7}           1*3  # Giá trị bạn đã search
${SEARCH_TERM-8}           13)  # Giá trị bạn đã search
${SEARCH_TERM-9}           .  # Giá trị bạn đã
${SEARCH_TERM-10}           -190  # Giá trị bạn đã


*** Test Cases ***
Search and Print Table Data /13/
    [Documentation]    Search for the value "13" in the table and print the matching rows.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào thanh search và nhập giá trị "${SEARCH_TERM}"
    Click Element    ${SEARCH_INPUT_XPATH}
    Input Text    ${SEARCH_INPUT_XPATH}    ${SEARCH_TERM-1}

    # Lấy thông tin từ bảng và in ra tại vị trí nó chứa giá trị "${SEARCH_TERM}"
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Run Keyword If    "'No matching records found' not in ${info_text}"    Log    ${info_text}


    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Run Keyword If    '${SEARCH_TERM-1}' in '${row_data}'    Log    ${row_data}
    END

    [Teardown]    Close Browser

Search and Print Table Data /$/
    [Documentation]    Search for the value "$" in the table and print the matching rows.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào thanh search và nhập giá trị "${SEARCH_TERM}"
    Click Element    ${SEARCH_INPUT_XPATH}
    Input Text    ${SEARCH_INPUT_XPATH}    ${SEARCH_TERM-2}

    # Lấy thông tin từ bảng và in ra tại vị trí nó chứa giá trị "${SEARCH_TERM}"
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Run Keyword If    "'No matching records found' not in ${info_text}"    Log    ${info_text}


    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Run Keyword If    '${SEARCH_TERM-2}' in '${row_data}'    Log    ${row_data}
    END

    [Teardown]    Close Browser


Search and Print Table Data /12/
    [Documentation]    Search for the value "12" in the table and print the matching rows.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào thanh search và nhập giá trị "${SEARCH_TERM}"
    Click Element    ${SEARCH_INPUT_XPATH}
    Input Text    ${SEARCH_INPUT_XPATH}    ${SEARCH_TERM-3}

    # Lấy thông tin từ bảng và in ra tại vị trí nó chứa giá trị "${SEARCH_TERM}"
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Run Keyword If    "'No matching records found' not in ${info_text}"    Log    ${info_text}


    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Run Keyword If    '${SEARCH_TERM-3}' in '${row_data}'    Log    ${row_data}
    END

    [Teardown]    Close Browser


Search and Print Table Data /11~/
    [Documentation]    Search for the value "11~" in the table and print the matching rows.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào thanh search và nhập giá trị "${SEARCH_TERM}"
    Click Element    ${SEARCH_INPUT_XPATH}
    Input Text    ${SEARCH_INPUT_XPATH}    ${SEARCH_TERM-4}

    # Lấy thông tin từ bảng và in ra tại vị trí nó chứa giá trị "${SEARCH_TERM}"
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Run Keyword If    "'No matching records found' not in ${info_text}"    Log    ${info_text}


    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Run Keyword If    '${SEARCH_TERM-4}' in '${row_data}'    Log    ${row_data}
    END

    [Teardown]    Close Browser


Search and Print Table Data /13./

    [Documentation]    Search for the value "13." in the table and print the matching rows.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào thanh search và nhập giá trị "${SEARCH_TERM}"
    Click Element    ${SEARCH_INPUT_XPATH}
    Input Text    ${SEARCH_INPUT_XPATH}    ${SEARCH_TERM-5}

    # Lấy thông tin từ bảng và in ra tại vị trí nó chứa giá trị "${SEARCH_TERM}"
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Run Keyword If    "'No matching records found' not in ${info_text}"    Log    ${info_text}


    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Run Keyword If    '${SEARCH_TERM-5}' in '${row_data}'    Log    ${row_data}
    END

    [Teardown]    Close Browser



Search and Print Table Data /183/
    [Documentation]    Search for the value "183" in the table and print the matching rows.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào thanh search và nhập giá trị "${SEARCH_TERM}"
    Click Element    ${SEARCH_INPUT_XPATH}
    Input Text    ${SEARCH_INPUT_XPATH}    ${SEARCH_TERM-6}

    # Lấy thông tin từ bảng và in ra tại vị trí nó chứa giá trị "${SEARCH_TERM}"
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Run Keyword If    "'No matching records found' not in ${info_text}"    Log    ${info_text}


    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Run Keyword If    '${SEARCH_TERM-6}' in '${row_data}'    Log    ${row_data}
    END

    [Teardown]    Close Browser



Search and Print Table Data /1*3/
    [Documentation]    Search for the value "1*3" in the table and print the matching rows.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào thanh search và nhập giá trị "${SEARCH_TERM}"
    Click Element    ${SEARCH_INPUT_XPATH}
    Input Text    ${SEARCH_INPUT_XPATH}    ${SEARCH_TERM-7}

    # Lấy thông tin từ bảng và in ra tại vị trí nó chứa giá trị "${SEARCH_TERM}"
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Run Keyword If    "'No matching records found' not in ${info_text}"    Log    ${info_text}


    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Run Keyword If    '${SEARCH_TERM-7}' in '${row_data}'    Log    ${row_data}
    END

    [Teardown]    Close Browser



Search and Print Table Data /13)/
    [Documentation]    Search for the value "13)" in the table and print the matching rows.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào thanh search và nhập giá trị "${SEARCH_TERM}"
    Click Element    ${SEARCH_INPUT_XPATH}
    Input Text    ${SEARCH_INPUT_XPATH}    ${SEARCH_TERM-8}

    # Lấy thông tin từ bảng và in ra tại vị trí nó chứa giá trị "${SEARCH_TERM}"
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Run Keyword If    "'No matching records found' not in ${info_text}"    Log    ${info_text}


    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Run Keyword If    '${SEARCH_TERM-8}' in '${row_data}'    Log    ${row_data}
    END

    [Teardown]    Close Browser


Search and Print Table Data /./
    [Documentation]    Search for the value "." in the table and print the matching rows.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào thanh search và nhập giá trị "${SEARCH_TERM}"
    Click Element    ${SEARCH_INPUT_XPATH}
    Input Text    ${SEARCH_INPUT_XPATH}    ${SEARCH_TERM-9}

    # Lấy thông tin từ bảng và in ra tại vị trí nó chứa giá trị "${SEARCH_TERM}"
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Run Keyword If    "'No matching records found' not in ${info_text}"    Log    ${info_text}


    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Run Keyword If    '${SEARCH_TERM-9}' in '${row_data}'    Log    ${row_data}
    END

    [Teardown]    Close Browser



Search and Print Table Data /-190/
    [Documentation]    Search for the value "-190" in the table and print the matching rows.

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    # Click vào thanh search và nhập giá trị "${SEARCH_TERM}"
    Click Element    ${SEARCH_INPUT_XPATH}
    Input Text    ${SEARCH_INPUT_XPATH}    ${SEARCH_TERM-10}

    # Lấy thông tin từ bảng và in ra tại vị trí nó chứa giá trị "${SEARCH_TERM}"
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    ${info_text}    Get Text    ${INFO_XPATH}
    Run Keyword If    "'No matching records found' not in ${info_text}"    Log    ${info_text}


    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        Run Keyword If    '${SEARCH_TERM-10}' in '${row_data}'    Log    ${row_data}
    END

    [Teardown]    Close Browser


