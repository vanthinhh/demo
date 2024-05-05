*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        https://practice-automation.com/form-fields/
${NAME}       Nguyễn Thịn



*** Test Cases ***
Login and Navigate Test
    Open Browser                ${URL}                                ${BROWSER}
    Wait Until Page Contains    form-fields
    [Documentation]             Fill data into the form and submit
    Input Text                  id=name                               ${NAME}
    #Click What is your favorite drink?
    Select Checkbox             Water
    Select Checkbox             Milk
    Select Checkbox             Coffee
    Select Checkbox             Wine
    Select Checkbox             Ctrl-Alt-Delight
    Unselect Checkbox           Water
    Unselect Checkbox           Milk
    Unselect Checkbox           Coffee
    Unselect Checkbox           Wine
    Unselect Checkbox           Ctrl-Alt-Delight
    Select Checkbox             Water

    #Select What is your favorite color?
    Set Selenium Speed       3seconds 
    Select Radio Button      fav_color    Blue
    Select Radio Button      fav_color    Green
    Select Radio Button      fav_color    Yellow
    Click Element    xpath=//*[@id="feedbackForm"]/label[13]

    Set Selenium Speed       3seconds



    #Click Do you have any siblings?
    Click Element    xpath=//*[@id="siblings"]/option[2]
    Sleep            2s
    Click Element    xpath=//*[@id="siblings"]/option[3]
    Sleep            2s
    Click Element    xpath=//*[@id="siblings"]/option[4]
    Sleep            2s
    Sleep            3s
    #input email
    Input Text       id=email                               admiin@gmail.com 
    #input test
    Input Text       id=message                             Ta Là Vua
    Sleep            3s
    #click submit
    Click Button     id=submit-btn
    Close All Browsers