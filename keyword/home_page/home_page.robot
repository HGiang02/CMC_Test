*** Variables ***
${icon_close_ad}     //i[@class='fa fa-times element-close-button']
${iframe_ad}         //iframe[@class='sp-fancybox-iframe sp-fancybox-skin sp-fancybox-iframe-1414 adaptive-resolution']
# Xpath search elements
${input_search}      //input[@id='txt-searchBox-input']
${span_sugguest_keyword}    //div[contains(@class,'suggestion_container')]/div[contains(@id,'txt-searchBox')]//span
${span_sugguest_product}    //div[contains(@class,'suggestion_container')]//a[contains(@id,'lnk-searchBox')]//span
${button_search}     //button[@id='btn-searchBox-input']