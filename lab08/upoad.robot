*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://practice-automation.com/file-upload/
${Browser}      Chrome
${File Path}    //Users//thinhnguyen//Library//Mobile Documents//com~apple~CloudDocs//WS//CNCT//Testing//lab08//type-of-file//docx//70KB.docx
${Upload Button Xpath}    //*[@id="upload-btn"]
${Message Xpath}    //*[@id="wpcf7-f13587-p1037-o1"]/form/div[2]
${Success Message}    There was an error trying to send your message. Please try again later.
${Error Mesage}    One or more fields have an error. Please check and try again.

${Message Xpath Field}    //*[@id="wpcf7-f13587-p1037-o1"]/form/p[1]/span[1]/span
${Error Mesage Field}    Please fill out this field.
${Error Mesage Field-Big}    Uploaded file is too big.
*** Test Cases ***
Test Case: 00 test click emplement before
    Open Browser To URL
    Setup For Testing 00
    Close All Browsers
Test Case: 01 test file upload with browser (1MB < file docx > 1MB)
    Open Browser To URL
    Setup For Testing 01
    Close All Browsers

Test Case: 02 test file upload with browser (1MB < file gif > 1MB)
    Open Browser To URL
    Setup For Testing 02
    Close All Browsers

Test Case: 03 test file upload with browser (1MB < file jpeg > 1MB)
    Open Browser To URL
    Setup For Testing 03
    Close All Browsers

Test Case: 04 test file upload with browser (1MB < file jpg > 1MB)
    Open Browser To URL
    Setup For Testing 04
    Close All Browsers

Test Case: 05 test file upload with browser (1MB < file pdf > 1MB)
    Open Browser To URL
    Setup For Testing 05
    Close All Browsers

Test Case: 06 test file upload with browser (1MB < file png > 1MB)
    Open Browser To URL
    Setup For Testing 06
    Close All Browsers

Test Case: 07 test file upload with browser (1MB < file txt > 1MB)
    Open Browser To URL
    Setup For Testing 07
    Close All Browsers



*** Keywords ***
Open Browser To URL
    [Documentation]    Opens the browser to the specified URL
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window


Setup For Testing 00
    [Documentation]    Sets up the environment for testing 00
    Wait Until Element Is Visible    ${Upload Button Xpath}
    #Choose File    ${Upload Button Xpath}    ${File Path}
    Click Element    ${Upload Button Xpath}
    Wait Until Element Is Visible    ${Message Xpath}    timeout=5s
    ${message}    Get Text    ${Message Xpath}
    Should Be Equal As Strings    ${message}    ${Error Mesage}

    Wait Until Element Is Visible    ${Message Xpath Field}   timeout=5s
    ${message}    Get Text    ${Message Xpath Field}
    Should Be Equal As Strings    ${message}    ${Error Mesage Field}
Setup For Testing 01
    [Documentation]    Sets up the environment for testing docx
    Wait Until Element Is Visible    ${Upload Button Xpath}
    Choose File    //*[@id="file-upload"]    //Users//thinhnguyen//Library//Mobile Documents//com~apple~CloudDocs//WS//CNCT//Testing//lab08//type-of-file//docx//70KB.docx
    Sleep    5s
    Click Element    ${Upload Button Xpath}
    Wait Until Element Is Visible    ${Message Xpath}    timeout=5s
    Sleep    5s
    ${message}    Get Text    ${Message Xpath}
    Should Be Equal As Strings    ${message}    ${Success Message}
    Sleep    5s
    Choose File    //*[@id="file-upload"]    //Users//thinhnguyen//Library//Mobile Documents//com~apple~CloudDocs//WS//CNCT//Testing//lab08//type-of-file//docx//1,5MB.docx
    Click Element    ${Upload Button Xpath}

    Wait Until Element Is Visible    ${Message Xpath}    timeout=5s
    ${message}    Get Text    ${Message Xpath}
    Should Be Equal As Strings    ${message}    ${Error Mesage}

    Wait Until Element Is Visible    ${Message Xpath Field}   timeout=5s
    ${message}    Get Text    ${Message Xpath Field}
    Should Be Equal As Strings    ${message}    ${Error Mesage Field-Big}

Setup For Testing 02
    [Documentation]    Sets up the environment for testing gif
    Wait Until Element Is Visible    ${Upload Button Xpath}
    Choose File    //*[@id="file-upload"]      //Users//thinhnguyen//Library//Mobile Documents//com~apple~CloudDocs//WS//CNCT//Testing//lab08//type-of-file//gif//369KB.gif

    Sleep    5s
    Click Element    ${Upload Button Xpath}
    Wait Until Element Is Visible    ${Message Xpath}    timeout=5s
    Sleep    5s
    ${message}    Get Text    ${Message Xpath}
    Should Be Equal As Strings    ${message}    ${Success Message}
    Sleep    5s
    Choose File    //*[@id="file-upload"]      //Users//thinhnguyen//Library//Mobile Documents//com~apple~CloudDocs//WS//CNCT//Testing//lab08//type-of-file//gif//1,4MB.gif

    Click Element    ${Upload Button Xpath}

    Wait Until Element Is Visible    ${Message Xpath}    timeout=5s
    ${message}    Get Text    ${Message Xpath}
    Should Be Equal As Strings    ${message}    ${Error Mesage}

    Wait Until Element Is Visible    ${Message Xpath Field}   timeout=5s
    ${message}    Get Text    ${Message Xpath Field}
    Should Be Equal As Strings    ${message}    ${Error Mesage Field-Big}


Setup For Testing 03
    [Documentation]    Sets up the environment for testing jpeg
    Wait Until Element Is Visible    ${Upload Button Xpath}
    Choose File    //*[@id="file-upload"]            //Users//thinhnguyen//Library//Mobile Documents//com~apple~CloudDocs//WS//CNCT//Testing//lab08//type-of-file//jpeg//8KB.jpeg
    Sleep    5s
    Click Element    ${Upload Button Xpath}
    Wait Until Element Is Visible    ${Message Xpath}    timeout=5s
    Sleep    5s
    ${message}    Get Text    ${Message Xpath}
    Should Be Equal As Strings    ${message}    ${Success Message}
    Sleep    5s
    Choose File    //*[@id="file-upload"]            //Users//thinhnguyen//Library//Mobile Documents//com~apple~CloudDocs//WS//CNCT//Testing//lab08//type-of-file//jpeg//2,2MB.jpeg
    Click Element    ${Upload Button Xpath}

    Wait Until Element Is Visible    ${Message Xpath}    timeout=5s
    ${message}    Get Text    ${Message Xpath}
    Should Be Equal As Strings    ${message}    ${Error Mesage}

    Wait Until Element Is Visible    ${Message Xpath Field}   timeout=5s
    ${message}    Get Text    ${Message Xpath Field}
    Should Be Equal As Strings    ${message}    ${Error Mesage Field-Big}

Setup For Testing 04
    [Documentation]    Sets up the environment for testing jpg
    Wait Until Element Is Visible    ${Upload Button Xpath}
    Choose File    //*[@id="file-upload"]            //Users//thinhnguyen//Library//Mobile Documents//com~apple~CloudDocs//WS//CNCT//Testing//lab08//type-of-file//jpg//25KB.jpg
    Sleep    5s
    Click Element    ${Upload Button Xpath}
    Wait Until Element Is Visible    ${Message Xpath}    timeout=5s
    Sleep    5s
    ${message}    Get Text    ${Message Xpath}
    Should Be Equal As Strings    ${message}    ${Success Message}
    Sleep    5s
    Choose File    //*[@id="file-upload"]            //Users//thinhnguyen//Library//Mobile Documents//com~apple~CloudDocs//WS//CNCT//Testing//lab08//type-of-file//jpg//4MB.jpg
    Click Element    ${Upload Button Xpath}

    Wait Until Element Is Visible    ${Message Xpath}    timeout=5s
    ${message}    Get Text    ${Message Xpath}
    Should Be Equal As Strings    ${message}    ${Error Mesage}

    Wait Until Element Is Visible    ${Message Xpath Field}   timeout=5s
    ${message}    Get Text    ${Message Xpath Field}
    Should Be Equal As Strings    ${message}    ${Error Mesage Field-Big}


Setup For Testing 05
    [Documentation]    Sets up the environment for testing pdf
    Wait Until Element Is Visible    ${Upload Button Xpath}
    Choose File    //*[@id="file-upload"]            //Users//thinhnguyen//Library//Mobile Documents//com~apple~CloudDocs//WS//CNCT//Testing//lab08//type-of-file//pdf//164KB.pdf
    Sleep    5s
    Click Element    ${Upload Button Xpath}
    Wait Until Element Is Visible    ${Message Xpath}    timeout=5s
    Sleep    5s
    ${message}    Get Text    ${Message Xpath}
    Should Be Equal As Strings    ${message}    ${Success Message}
    Sleep    5s
    Choose File    //*[@id="file-upload"]            //Users//thinhnguyen//Library//Mobile Documents//com~apple~CloudDocs//WS//CNCT//Testing//lab08//type-of-file//pdf//2MB.pptx.pdf
    Click Element    ${Upload Button Xpath}

    Wait Until Element Is Visible    ${Message Xpath}    timeout=5s
    ${message}    Get Text    ${Message Xpath}
    Should Be Equal As Strings    ${message}    ${Error Mesage}

    Wait Until Element Is Visible    ${Message Xpath Field}   timeout=5s
    ${message}    Get Text    ${Message Xpath Field}
    Should Be Equal As Strings    ${message}    ${Error Mesage Field-Big}


Setup For Testing 06
    [Documentation]    Sets up the environment for testing png
    Wait Until Element Is Visible    ${Upload Button Xpath}
    Choose File    //*[@id="file-upload"]            //Users//thinhnguyen//Library//Mobile Documents//com~apple~CloudDocs//WS//CNCT//Testing//lab08//type-of-file//png//466KB.png
    Sleep    5s
    Click Element    ${Upload Button Xpath}
    Wait Until Element Is Visible    ${Message Xpath}    timeout=5s
    Sleep    5s
    ${message}    Get Text    ${Message Xpath}
    Should Be Equal As Strings    ${message}    ${Success Message}
    Sleep    5s
    Choose File    //*[@id="file-upload"]            //Users//thinhnguyen//Library//Mobile Documents//com~apple~CloudDocs//WS//CNCT//Testing//lab08//type-of-file//png//4,6MB.png
    Click Element    ${Upload Button Xpath}

    Wait Until Element Is Visible    ${Message Xpath}    timeout=5s
    ${message}    Get Text    ${Message Xpath}
    Should Be Equal As Strings    ${message}    ${Error Mesage}

    Wait Until Element Is Visible    ${Message Xpath Field}   timeout=5s
    ${message}    Get Text    ${Message Xpath Field}
    Should Be Equal As Strings    ${message}    ${Error Mesage Field-Big}

Setup For Testing 07
    [Documentation]    Sets up the environment for testing txt
    Wait Until Element Is Visible    ${Upload Button Xpath}
    Choose File    //*[@id="file-upload"]            //Users//thinhnguyen//Library//Mobile Documents//com~apple~CloudDocs//WS//CNCT//Testing//lab08//type-of-file//txt//4-KB.txt
    Sleep    5s
    Click Element    ${Upload Button Xpath}
    Wait Until Element Is Visible    ${Message Xpath}    timeout=5s
    Sleep    5s
    ${message}    Get Text    ${Message Xpath}
    Should Be Equal As Strings    ${message}    ${Success Message}
    Sleep    5s
    Choose File    //*[@id="file-upload"]            //Users//thinhnguyen//Library//Mobile Documents//com~apple~CloudDocs//WS//CNCT//Testing//lab08//type-of-file//txt//8MB.txt
    Click Element    ${Upload Button Xpath}
    
    Wait Until Element Is Visible    ${Message Xpath}    timeout=10s
    ${message}    Get Text    ${Message Xpath}
    Should Be Equal As Strings    ${message}    ${Error Mesage}

    Wait Until Element Is Visible    ${Message Xpath Field}   timeout=5s
    ${message}    Get Text    ${Message Xpath Field}
    Should Be Equal As Strings    ${message}    ${Error Mesage Field-Big}