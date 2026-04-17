*** Settings ***
Library    AppiumLibrary

*** Test Cases ***
Open My Application
    Open Application    http://localhost:4723
    ...    platformName=Android
    ...    deviceName=emulator-5554
    ...    appPackage=com.avjindersinghsekhon.minimaltodo
    ...    appActivity=com.example.avjindersinghsekhon.toodle.MainActivity
    ...    automationName=Uiautomator2
    Wait Until Element Is Visible    //android.widget.TextView[@text="You don't have any todos"]
    Click Element    //android.widget.ImageView[@resource-id="com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB"]
    Wait Until Element Is Visible    //android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/userToDoEditText"]
    Input Text    //android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/userToDoEditText"]    Buy groceries
    Click Element    //android.widget.Switch[@resource-id="com.avjindersinghsekhon.minimaltodo:id/toDoHasDateSwitchCompat"]
    Wait Until Element Is Visible    //android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/newTodoDateEditText"]
    Click Element    //android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/newTodoDateEditText"]
    Wait Until Element Is Visible    //android.view.View[@content-desc="22 April 2026"]
    Click Element    //android.view.View[@content-desc="22 April 2026"]
    Click Element    //android.widget.Button[@resource-id="com.avjindersinghsekhon.minimaltodo:id/ok"]
    Wait Until Element Is Visible    //android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/newTodoDateEditText"]
    Click Element    //android.widget.ImageView[@resource-id="com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton"]
    ${todo_text}=    Get Text    //android.widget.TextView[@resource-id="com.avjindersinghsekhon.minimaltodo:id/toDoListItemTextview"]
    Should Be Equal    ${todo_text}    Buy groceries
    Close Application