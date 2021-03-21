*** Settings ***
Test Setup        Before test
Test Teardown     After test
Library           Selenium2Library
Library           String
Library           BuiltIn
Resource          ../keyword/home_page/home_page.robot
Resource          ../keyword/search_result/search_result_page.robot
Resource          Utils.robot

*** Variables ***
${ENTER}          \\13
${keyword_test}    TV

*** Test cases ***
TC01
    [Documentation]    Check search suggestion
    Wait Until Element Is Visible    ${input_search}    ${TIME_OUT}
    Input Text    ${input_search}    ${keyword_test}
    input Text    ${input_search}    ${EMPTY}
    Wait Until Element Is Visible    ${span_sugguest_keyword}    ${TIME_OUT}
    Check search suggestion    ${keyword_test}

TC02
    [Documentation]    Check when click search button
    Wait Until Element Is Visible    ${input_search}    ${TIME_OUT}
    Input Text    ${input_search}    ${keyword_test}
    Click Button    ${button_search}
    Wait Until Element Is Visible    ${link_first_item}    ${TIME_OUT}
    Execute Javascript    history.back()

TC03
    [Documentation]    Check when press ENTER
    Wait Until Element Is Visible    ${input_search}    ${TIME_OUT}
    Input Text    ${input_search}    ${keyword_test}
    Press Key    ${input_search}    ${ENTER}
    Wait Until Element Is Visible    ${link_first_item}    ${TIME_OUT}

*** Keywords ***
Check search suggestion
    [Arguments]    ${keyword}
    ${keyword}    Convert To Lower Case    ${keyword}
    # Check keyword suggestion
    ${list_span_keyword_sg}=    Get WebElements    ${span_sugguest_keyword}
    ${count}=    Get Length    ${list_span_keyword_sg}
    FOR    ${span}    IN    @{list_span_keyword_sg}
        ${text}=    Get Text    ${span}
        ${text}=    Convert To Lower Case    ${text}
        Should Be Equal As Strings    ${text}    ${keyword}
    END
    # Check product suggestion
    ${list_span_product_sg}=    Get WebElements    ${span_sugguest_product}
    FOR    ${span}    IN    @{list_span_product_sg}
        ${text}=    Get Text    ${span}
        ${text}=    Convert To Lower Case    ${text}
        Should Contain    ${text}    ${keyword}
    END
