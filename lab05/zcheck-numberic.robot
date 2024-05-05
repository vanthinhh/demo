*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BROWSER}    Chrome
${URL}    https://practice-automation.com/tables/
${TABLE_XPATH}    //\*[@id="post-1076"]/div/figure/table
${DROPDOWN_XPATH}    //select[@name="tablepress-1_length"]
${TABLE_BODY_XPATH}    //\*[@id="tablepress-1"]/tbody
${ROW_XPATH}    ${TABLE_BODY_XPATH}/tr

*** Test Cases ***
Select Dropdown Table with 10
    [Documentation]    Select value 10 from the dropdown and log table data and check numberic
    #@{row_parts} = [ 3 | United | States | 340 ] fail
    #@{row_parts} = [ 15 | D.R. | Congo | 102 ] fail
    #@{row_parts} = [ 21 | United | Kingdom | 67.9 ] fail
 
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    Select From List by Value    ${DROPDOWN_XPATH}    10
    Sleep    2s
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        @{row_parts}    Split String    ${row_data}    ${SPACE}
        ${first_index}    Set Variable    ${row_parts}[0]
        ${second_index}    Set Variable    ${row_parts}[1]
        ${third_index}    Run Keyword And Continue On Failure    Set Variable    ${row_parts}[2]
        ${is_first_numeric}    Evaluate    '${first_index}'.isnumeric()    # Check if first index is numeric
        ${is_second_numeric}    Evaluate    '${second_index}'.isnumeric()    # Check if second index is numeric
        ${is_third_numeric}    Run Keyword And Continue On Failure    Evaluate    '${third_index}'.isnumeric()    # Check if third index is numeric
        Log    ${first_index} is numberic: ${is_first_numeric}
        Log    ${second_index} is numberic: ${is_second_numeric}
        Log    ${third_index} is numberic: ${is_third_numeric}
    END
    Scroll Element Into View    xpath=//\*[@id="tablepress-1_next"]
    Click Element    xpath=//\*[@id="tablepress-1_next"]
    Sleep    2s
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        @{row_parts}    Split String    ${row_data}    ${SPACE}
        ${first_index}    Set Variable    ${row_parts}[0]
        ${second_index}    Set Variable    ${row_parts}[1]
        ${third_index}    Run Keyword And Continue On Failure    Set Variable    ${row_parts}[2]
        ${is_first_numeric}    Evaluate    '${first_index}'.isnumeric()
        ${is_second_numeric}    Evaluate    '${second_index}'.isnumeric()
        ${is_third_numeric}    Run Keyword And Continue On Failure    Evaluate    '${third_index}'.isnumeric()
        Log    ${first_index} is numberic: ${is_first_numeric}
        Log    ${second_index} is numberic: ${is_second_numeric}
        Log    ${third_index} is numberic: ${is_third_numeric}
    END
    Scroll Element Into View    xpath=//\*[@id="tablepress-1_next"]
    Click Element    xpath=//\*[@id="tablepress-1_next"]
    Sleep    2s
    ${table_rows}    Get WebElements    ${ROW_XPATH}
    FOR    ${row}    IN    @{table_rows}
        ${row_data}    Get Text    ${row}
        @{row_parts}    Split String    ${row_data}    ${SPACE}
        ${first_index}    Set Variable    ${row_parts}[0]
        ${second_index}    Set Variable    ${row_parts}[1]
        ${third_index}    Run Keyword And Continue On Failure    Set Variable    ${row_parts}[2]
        ${is_first_numeric}    Evaluate    '${first_index}'.isnumeric()
        ${is_second_numeric}    Evaluate    '${second_index}'.isnumeric()
        ${is_third_numeric}    Run Keyword And Continue On Failure    Evaluate    '${third_index}'.isnumeric()
        Log    ${first_index} is numberic: ${is_first_numeric}
        Log    ${second_index} is numberic: ${is_second_numeric}
        Log    ${third_index} is numberic: ${is_third_numeric}
    END
    [Teardown]    Close Browser