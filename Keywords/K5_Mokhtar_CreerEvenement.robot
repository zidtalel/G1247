*** Settings ***
Library           SeleniumLibrary
Library           DateTime
Library           String
Variables         ../Locators/locatorsLoginDashbordPage.py
Variables         ../Locators/Locators.py
*** Variables ***
${vURL}             http://localhost:8088/share/page
${TIMEOUT}        5s
${Ligne}
# Dashbord Config page elements
img_RoueDentee = "id=HEADER_TITLE_MENU"
btn_ChangerDisposition = "id=template_x002e_customise-layout_x002e_customise-user-dashboard_x0023_default-change-button-button"
btn_Mode = "id=template_x002e_customise-layout_x002e_customise-user-dashboard_x0023_default-select-button-dashboard"
btn_ChangerDisposition_OK = "id=template_x002e_customise-dashlets_x002e_customise-user-dashboard_x0023_default-save-button-button"
*** Keywords ***
CreerEvenement
    [Documentation]    Crée un événement dans Alfresco.
    [Arguments]    ${nSite}    ${Event Desc}    ${Event Title}
    Go To    ${vURL}/site/${nSite}/dashboard
    Click Element    id=HEADER_SITE_CALENDAR_text
    Click Element    id=template_x002e_toolbar_x002e_calendar_x0023_default-addEvent-button-button
    Input Text    //input[@id='eventEditPanel-title']    ${Event Title}
    Input Text    //textarea[@id='eventEditPanel-description']    ${Event Desc}
    Click Element    //button[@id='eventEditPanel-ok-button']
    Sleep    2s  # Attendre quelques secondes pour la création de l'événement
    Capture Page Screenshot   Event_Creation.png  # Facultatif : Capturez une capture d'écran de la page
