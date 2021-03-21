*** Settings *** 
Resource        Utils.robot
Resource        ../keyword/home_page/home_page_action.robot
Resource        ../keyword/search_result/search_result_page.robot
Resource        ../keyword/detail_product/detail_product_page.robot
Resource        ../keyword/cart/cart_page.robot
Test Setup      Before test
#Test Teardown	After test

*** Variables *** 
${keyword_test}    TV

*** Test cases ***
TC01   
	[Documentation]    Search >> Filter screen size 44-55 >> Detail Product >> Add to cart
	Search    ${keyword_test}
	Wait Until Element Is Visible    ${div_filter_44_55_inches}    ${TIME_OUT} 
	Click Element     ${div_filter_44_55_inches}    
	Wait Until Element Is Visible    ${link_first_item}    ${TIME_OUT}
	Sleep  10s
	Click Element    ${link_first_item}
	Wait Until Element Is Visible    ${button_add_to_cart}    ${TIME_OUT}
	${product_name}=    Get Text   ${label_product_name}
	${xpath_product}=    Set Variable     //*[contains(text(), '${product_name}')]
  	Click Button    ${button_add_to_cart}
  	Sleep  5s
  	Click Element   ${icon_cart}
  	Wait Until Element Is Visible    ${xpath_product}

TC02  
	[Documentation]    Search >> Filter screen size 44-55 >> Detail Product >> Add to cart >> Filter screen size 32-43 >> Detail Product >> Add to cart
	Search    ${keyword_test}
	Wait Until Element Is Visible    ${div_filter_44_55_inches}    ${TIME_OUT} 
	Click Element     ${div_filter_44_55_inches}    
	Wait Until Element Is Visible    ${link_first_item}    ${TIME_OUT}
	Sleep  10s
	Click Element    ${link_first_item}
	Wait Until Element Is Visible    ${button_add_to_cart}    ${TIME_OUT}
	${product_name}=    Get Text   ${label_product_name}
	${xpath_product}=    Set Variable     //*[contains(text(), '${product_name}')]
  	Click Button    ${button_add_to_cart}
  	Sleep  5s
  	Click Element   ${icon_cart}
  	Wait Until Element Is Visible    ${xpath_product}
  	Go Back
  	Wait Until Element Is Visible    ${div_filter_44_55_inches}    ${TIME_OUT} 
	Click Element     ${div_filter_44_55_inches}
	Wait Until Element Is Visible    ${div_filter_32_43_inches}    ${TIME_OUT} 
	Click Element     ${div_filter_32_43_inches}
	Wait Until Element Is Visible    ${link_first_item}    ${TIME_OUT}
	Sleep  10s
	Click Element    ${link_first_item}
	Wait Until Element Is Visible    ${button_add_to_cart}    ${TIME_OUT}
	${product_name}=    Get Text   ${label_product_name}
	${xpath_product}=    Set Variable     //*[contains(text(), '${product_name}')]
  	Click Button    ${button_add_to_cart}
  	Sleep  5s
  	Click Element   ${icon_cart}
  	Wait Until Element Is Visible    ${xpath_product}
*** Keywords *** 
Go Back
    Execute Javascript  history.back()