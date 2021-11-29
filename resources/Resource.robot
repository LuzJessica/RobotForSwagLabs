*** Settings ***

Library  SeleniumLibrary

*** Variables ***

${URL}       https://www.saucedemo.com/
${USERNAME}  standard_user
${PASSWORD}  secret_sauce
${FILTER_OPTIONS}  Name (A to Z)\nName (Z to A)\nPrice (low to high)\nPrice (high to low)

*** Keywords ***

### SETUP AND TEARDOWN###

Open Website
  Open Browser  about:blank  chrome

Close Website
  Close Browser

Given than user access the Swag Labs website
  Go To  ${URL}
  Title Should Be    Swag Labs
  Element Should Be Visible    id=login-button

When user informs username and password
  Input Text    id=user-name    ${USERNAME}
  Input Text    id=password     ${PASSWORD}

And click Login button
  Click Button    id=login-button

Then the page of products should be load
  Element Text Should Be    xpath=//span[@class='title']    PRODUCTS

And click the menu button
  Click Button    id=react-burger-menu-btn

Then the menu items shoud apper
  Element Should Be Enabled    css=.bm-menu

And then in the X menu button
  Wait Until Element Is Visible    id=inventory_sidebar_link
  Click Element    css=.bm-cross-button

And then click in the "About" item in the menu list
  Wait Until Element Is Visible    id=inventory_sidebar_link
  Click Element    id=about_sidebar_link

Then the Sauce Labs website should load
  Title Should Be    Cross Browser Testing, Selenium Testing, Mobile Testing | Sauce Labs

And then click in the "Logout" item in the menu list
  Wait Until Element Is Visible    id=inventory_sidebar_link
  Click Element  id=logout_sidebar_link

Then the Login page should load
   Title Should Be    Swag Labs
   Element Should Be Visible    id=user-name
   Element Should Be Visible    id=password

And click in the button NAME(A TO Z)
   Click Element    css=.product_sort_container

Then the options Name (A TO Z), Name (Z TO A), Price (low to high), Price (high to low) should be shown
  Element Should Contain    css=.product_sort_container    ${FILTER_OPTIONS}
