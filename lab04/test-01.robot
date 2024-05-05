*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}        https://practice-automation.com/form-fields/

*** Test Cases ***
Login With Valid Credentials
    Open Browser          ${URL}    ${BROWSER}
    Close All Browsers


