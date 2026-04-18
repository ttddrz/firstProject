*** Settings ***
Library    AppiumLibrary
Library    String
Test Setup    Open Minimal Todo App
Test Teardown    Close Application

*** Keywords ***
Open Minimal Todo App
    Open Application    http://localhost:4723
    ...    platformName=Android
    ...    deviceName=emulator-5554
    ...    appPackage=com.avjindersinghsekhon.minimaltodo
    ...    appActivity=com.example.avjindersinghsekhon.toodle.MainActivity
    ...    automationName=Uiautomator2
No Task Found
    Wait Until Element Is Visible    //android.widget.TextView[@text="You don't have any todos"]
Click Add Task Button
    Click Element    //android.widget.ImageView[@resource-id="com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB"]
Type into Task Title
    [Arguments]    ${text}
    Wait Until Element Is Visible    //android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/userToDoEditText"]
    Clear Text    //android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/userToDoEditText"]
    Input Text    //android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/userToDoEditText"]    ${text}
Click Paper Air Plane Button
    Click Element    //android.widget.ImageView[@resource-id="com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton"]
Toggle Reminder Switch
    Click Element    //android.widget.Switch[@resource-id="com.avjindersinghsekhon.minimaltodo:id/toDoHasDateSwitchCompat"]
Click Date Field
    Wait Until Element Is Visible    //android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/newTodoDateEditText"]
    Click Element    //android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/newTodoDateEditText"]
Click Date
    [Arguments]    ${date}
    Wait Until Element Is Visible    //android.view.View[@content-desc="${date}"]
    Click Element    //android.view.View[@content-desc="${date}"]
    Click Element    //android.widget.Button[@resource-id="com.avjindersinghsekhon.minimaltodo:id/ok"]
Click Time Field
    Wait Until Element Is Visible    //android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/newTodoTimeEditText"]
    Click Element    //android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/newTodoTimeEditText"]
    Click Element    //android.widget.Button[@resource-id="com.avjindersinghsekhon.minimaltodo:id/ok"]
    
*** Test Cases ***
TC_MB_001
    [Documentation]    Verify Add Task successfully - Have Title
    No Task Found
    Capture Page Screenshot    ${CURDIR}${/}results${/}TC_MB_001${/}01.png
    Click Add Task Button
    Type into Task Title    Pay bills
    Click Paper Air Plane Button
    ${todo_text}=    Get Text    //android.widget.TextView[@resource-id="com.avjindersinghsekhon.minimaltodo:id/toDoListItemTextview"]
    Should Be Equal    ${todo_text}    Pay bills
    Capture Page Screenshot    ${CURDIR}${/}results${/}TC_MB_001${/}02.png
TC_MB_002
    [Documentation]    Verify Add Task successfully - Have Title and Reminder
    No Task Found
    Capture Page Screenshot    ${CURDIR}${/}results${/}TC_MB_002${/}01.png
    Click Add Task Button
    Type into Task Title    Take medicine
    Toggle Reminder Switch
    Click Date Field
    Click Date    30 April 2026
    Click Paper Air Plane Button
    ${todo_text}=    Get Text    //android.widget.TextView[@resource-id="com.avjindersinghsekhon.minimaltodo:id/toDoListItemTextview"]
    Should Be Equal    ${todo_text}    Take medicine
    ${temp_date}=    Get Text    //android.widget.TextView[@resource-id="com.avjindersinghsekhon.minimaltodo:id/todoListItemTimeTextView"]
    ${split_date}=    Split String    ${temp_date}
    Should Be Equal    ${split_date}[0] ${split_date}[1] ${split_date}[2]    Apr 30, 2026 
    Capture Page Screenshot    ${CURDIR}${/}results${/}TC_MB_002${/}02.png
TC_MB_003
    [Documentation]    Verify Edit Task successfully - Remove reminder
    No Task Found
    Click Add Task Button
    Type into Task Title    Recharge phone
    Toggle Reminder Switch
    Click Date Field
    Click Date    30 April 2026
    Click Paper Air Plane Button
    Capture Page Screenshot    ${CURDIR}${/}results${/}TC_MB_003${/}01.png
    Click Element    //android.widget.LinearLayout[@resource-id="com.avjindersinghsekhon.minimaltodo:id/listItemLinearLayout"]
    Toggle Reminder Switch
    Click Paper Air Plane Button
    Capture Page Screenshot    ${CURDIR}${/}results${/}TC_MB_003${/}02.png
TC_MB_004
    [Documentation]    Verify Edit Task successfully - Edit title and set reminder date
    No Task Found
    Click Add Task Button
    Type into Task Title    Go to gym
    Click Paper Air Plane Button
    Capture Page Screenshot    ${CURDIR}${/}results${/}TC_MB_004${/}01.png
    Click Element    //android.widget.LinearLayout[@resource-id="com.avjindersinghsekhon.minimaltodo:id/listItemLinearLayout"]
    Type into Task Title    Go to court
    Toggle Reminder Switch
    Click Date Field
    Click Date    29 April 2026
    Click Paper Air Plane Button
    ${todo_text}=    Get Text    //android.widget.TextView[@resource-id="com.avjindersinghsekhon.minimaltodo:id/toDoListItemTextview"]
    Should Be Equal    ${todo_text}    Go to court
    ${temp_date}=    Get Text    //android.widget.TextView[@resource-id="com.avjindersinghsekhon.minimaltodo:id/todoListItemTimeTextView"]
    ${split_date}=    Split String    ${temp_date}
    Should Be Equal    ${split_date}[0] ${split_date}[1] ${split_date}[2]    Apr 29, 2026
    Capture Page Screenshot    ${CURDIR}${/}results${/}TC_MB_004${/}02.png
TC_MB_005
    [Documentation]    Verify Delete Task (Swipe left) successfully
    No Task Found
    Click Add Task Button
    Type into Task Title    Do homework
    Click Paper Air Plane Button
    Capture Page Screenshot    ${CURDIR}${/}results${/}TC_MB_005${/}01.png
    Swipe By Percent    90    15    10    15    1000
    Capture Page Screenshot    ${CURDIR}${/}results${/}TC_MB_005${/}02.png
TC_MB_006
    [Documentation]    Verify Complete Task (Swipe right) successfully
    No Task Found
    Click Add Task Button
    Type into Task Title    Do automation
    Click Paper Air Plane Button
    Capture Page Screenshot    ${CURDIR}${/}results${/}TC_MB_006${/}01.png
    Swipe By Percent    10    15    90    15    1000
    Capture Page Screenshot    ${CURDIR}${/}results${/}TC_MB_006${/}02.png
TC_MB_007
    [Documentation]    Verify empty title cannot be saved
    No Task Found
    Click Add Task Button
    Capture Page Screenshot    ${CURDIR}${/}results${/}TC_MB_007${/}01.png
    Click Paper Air Plane Button
    No Task Found
    Capture Page Screenshot    ${CURDIR}${/}results${/}TC_MB_007${/}02.png
TC_MB_008
    [Documentation]    Verify error message when set past time reminder and task cannot be saved
    No Task Found
    Click Add Task Button
    Type into Task Title    Exercise
    Toggle Reminder Switch
    Click Time Field
    ${error_text}=    Get Text    //android.widget.TextView[@resource-id="com.avjindersinghsekhon.minimaltodo:id/newToDoDateTimeReminderTextView"]
    Should Be Equal    ${error_text}    The date you entered is in the past.
    Capture Page Screenshot    ${CURDIR}${/}results${/}TC_MB_008${/}01.png
    Click Paper Air Plane Button
    No Task Found
    Capture Page Screenshot    ${CURDIR}${/}results${/}TC_MB_008${/}02.png
