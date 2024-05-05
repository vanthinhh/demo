*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}               Chrome
${URL}                   https://practice-automation.com/tables/
${TABLE_XPATH}           //*[@id="post-1076"]/div/figure/table
${ALL_CELLS_XPATH}       ${TABLE_XPATH}//td
@{INDEXES_TO_CHECK}      4  6  8

*** Test Cases ***
Verify Cells At Specific Indexes Are Numbers
    [Documentation]    Verify that cells at specific indexes in the table contain numeric values

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    ${all_cells}    Get WebElements    ${ALL_CELLS_XPATH}
    
    FOR    ${index}    IN    @{INDEXES_TO_CHECK}
        ${index_as_int}    Convert To Integer    ${index}
        ${cell}    Set Variable    ${all_cells}[${index_as_int-1}]    # Subtract 1 because Python indexes start from 0
        ${cell_text}    Get Text    ${cell}
        ${cleaned_text}    Run Keyword If    "'$' in ${cell_text}"    Evaluate    "${cell_text}".split('$')[1]    ELSE    Set Variable    ${cell_text}
        Run Keyword If    "${cleaned_text.replace(' ', '').replace('.', '').replace(',', '').isdecimal()}"    Log    ${cleaned_text} is numeric
        ...    ELSE    Fail    ${cleaned_text} is not numeric
    END
    
    [Teardown]    Close Browser
