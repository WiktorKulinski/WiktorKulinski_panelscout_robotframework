*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en

${BROWSER}      Chrome

${SIGNINBUTTON}     //div/button/span

${EMAILINPUT}       //*[@id='login']

${PASSWORDINPUT}        //*[@id='password']

${PAGELOGO}     //*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]

${ENGLISHLIST}        //div[2]/div/div

${POLISHBUTTON}     //div[3]/ul/li[1]

${POLISHLIST}       //*[@id="__next"]/form/div/div[2]/div/div

${LOGOUTBUTTON}     //ul[2]/div[2]/div[2]/span


*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser

Change Language Test
    Open Login Page
    Click On english Listbox
    Click On polish Button
    Assert language
    [Teardown]    Close Browser

Test LogOut Button
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click On LogOut Button
    Assert SignIn


*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Scouts panel - sign in
Type in email
    Input Text    ${EMAILINPUT}     user07@getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}      Test-1234
Click on the Submit button
    Click Element       ${SIGNINBUTTON}
Assert dashboard
    Wait Until Element Is Visible       ${PAGELOGO}
    Title Should Be    Scouts panel
    Capture Page Screenshot    alert.png
Click on english listbox
    Click Element       ${ENGLISHLIST}
Click on polish button
    Click Element    ${POLISHBUTTON}
Assert language
    Wait Until Element Is Visible    ${POLISHLIST}
    Capture Page Screenshot    changelanguage.png
Click on LogOut Button
    Click Element    ${LOGOUTBUTTON}
Assert SignIn
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot    afterlogout.png
