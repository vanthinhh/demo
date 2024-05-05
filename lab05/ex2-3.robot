*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://practice-automation.com/tables/
${TABLE_XPATH}    //*[@id="post-1076"]/div/figure/table
${ALL_CELLS_XPATH}    ${TABLE_XPATH}//td

*** Test Cases ***
Print All Cell Data In Table
    [Documentation]    Print the data of all cells in the table

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TABLE_XPATH}
    
    ${all_cells}    Get WebElements    ${ALL_CELLS_XPATH}
    
    FOR    ${cell}    IN    @{all_cells}
        ${cell_text}    Get Text    ${cell}
        Log    ${cell_text}
    END
    
    [Teardown]    Close Browser
