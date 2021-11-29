*** Setting ***

Resource  ../resources/Resource.robot
Test Setup  Open Website
Test Teardown  Close Website

*** Test Cases ***

Test Case 1: Sign in
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  Then the page of products should be load


Test Case 2: Acess items menu
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  And click the menu button
  Then the menu items shoud apper

Test Case 3: Close items menu
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  And click the menu button
  And then in the X menu button

Test Case 4: Open About page
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  And click the menu button
  And then click in the "About" item in the menu list
  Then the Sauce Labs website should load

Test Case 5: Click Logout menu item
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  And click the menu button
  And then click in the "Logout" item in the menu list
  Then the Login page should load

Test Case 6: Show Name filter options
  Given than user access the Swag Labs website
  When user informs username and password
  And click Login button
  And click in the button NAME(A TO Z)
  Then the options Name (A TO Z), Name (Z TO A), Price (low to high), Price (high to low) should be shown
