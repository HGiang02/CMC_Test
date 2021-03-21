*** Settings ***
Resource          home_page.robot
Resource          ../../config/env_test.robot
Library           Selenium2Library
Resource          ../search_result/search_result_page.robot

*** Variables ***  
${ENTER}       \\13

*** Keywords ***
Search 
    [Arguments]     ${keyword}
    Wait Until Element Is Visible    ${input_search}         ${TIME_OUT}
    Input Text        ${input_search}       ${keyword} 
    Press Key         ${input_search}       ${ENTER}
    # Wait Until Element Is Visible    ${link_first_item}      ${TIME_OUT}

