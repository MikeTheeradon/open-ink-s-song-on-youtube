*** Settings ***
Library                   SeleniumLibrary

*** Variables ***
${Browser}                https://www.youtube.com
${Search}                 INK WARUNTORN
${Select song}            สายตาหลอกกันไม่ได้    


*** Test Cases ***
open song
    Search INK WARUNTORN's song
    Open พบรัก song

*** Keywords ***
Search INK WARUNTORN's song
    Open Browser                        ${Browser}        chrome
    Maximize Browser Window
    Input Text                          xpath=//input[@name="search_query"][1]    ${Search}
    Click Button                        xpath=//button[@aria-label="Search"] 
    
Open พบรัก song
    # Wait Until Element Is Visible        xpath=//div//a[@id="video-title"]//yt-formatted-string[contains(text(),"สายตาหลอกกันไม่ได้")]
    # Scroll Element Into View             xpath=//div//a[@id="video-title"]//yt-formatted-string[contains(text(),"สายตาหลอกกันไม่ได้")]

    Wait Until Element Is Visible       xpath=//div//a[@id="video-title"]//yt-formatted-string[contains(text(),"${Select song}")]
    Click Element                      xpath=//div//a[@id="video-title"]//yt-formatted-string[contains(text(),"${Select song}")]
    Close Browser
    