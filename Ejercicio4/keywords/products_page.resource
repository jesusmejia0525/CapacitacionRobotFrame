*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${product}=    
${btn_cart}=    //button[text()='Add to cart']
${btn_back}=    //button[text()='Back to products']
${Cart}=    class=shopping_cart_link

*** Keywords ***
Add Products To Cart
    [Arguments]    ${list}
    FOR    ${item}    IN    @{list}
        Click Element    //a/div[text()='${item}']
        Click Button    ${btn_cart}
        Click Button    ${btn_back}
    END
    
Open Cart
    Click Element    ${Cart}