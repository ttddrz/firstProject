*** Settings ***
Library        SeleniumLibrary
Suite Setup    SeleniumLibrary.Register Keyword To Run On Failure    ${None}

*** Variables ***
${URL}            https://seleniumbase.io/coffee/
${BROWSER}        chrome

*** Test Cases ***
Exercise 1 Open Browser
    Open Browser    about:blank    chrome
    Go To    https://ultimateqa.com/complicated-page

    Open Browser    https://ultimateqa.com/complicated-page
    # Open Browser    https://commercialsaletool-sit.generali.co.th/agency    gc    options=add_argument("--start-maximized");add_experimental_option('excludeSwitches', ['enable-logging'])

Exercise 2 Open Browser
    Open Browser    about:blank    chrome
    Go To    https://ultimateqa.com/complicated-page

    Open Browser    https://ultimateqa.com/complicated-page
    
Success case ทำการสั่งซื้อกาแฟ Americano 1 แก้ว
    GROUP   Step 1: เปิดเว็บไซต์
        Open Browser    ${URL}    ${BROWSER}    options=add_argument("--start-maximized");add_experimental_option('excludeSwitches', ['enable-logging'])
        Wait Until Page Contains Element    xpath=//*[@data-test="Americano"]
    END
    GROUP  Step 2: คลิกที่เมนู Americano
        Click Element    xpath=//*[@data-test="Americano"]
    END
    GROUP  Step 3: คลิกที่ปุ่ม Checkout
        Click Element    xpath=//*[@data-test="checkout"]
    END
    GROUP  Step 4: กรอกชื่อและอีเมล
        Input Text    id=name    Somkiat
        Input Text    id=email    Somkiat@xyz.com
    END
    GROUP  Step 5: คลิกที่ปุ่ม Submit Payment
        Click Element    id=submit-payment
        Wait Until Page Contains    Thanks for your purchase. Please check your email for payment.
    END