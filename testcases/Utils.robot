*** Settings ***
Library      Selenium2Library
Resource     ../config/env_test.robot
Resource     ../home_page/home_page.robots
*** Variables ***

*** Keywords ***
Before test   
	Open Browser      ${BASE_URL}     ${BROWSER}     
    Wait Until Element Is Visible    ${iframe_ad}            25
    Select Frame      ${iframe_ad}    
    Wait Until Element Is Visible    ${icon_close_ad}        25
    Click Element    ${icon_close_ad}  
    Wait Until Element Is Visible    ${input_search}         10

After test
	Close All Browsers