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
*** Keywords ***
Login
    # vURL contient l'adresse URL de la page web
    # vBrowser contient l'identifiant du navigateur cible
    # vUsername contient le login
    # vPassword contient le mot de passe
    [Arguments]    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
    # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
    # Ouvrir le navigateur en precisant l'URL et le navigateur
    Open Browser    ${vURL}    ${vBrowser}
    # Maximiser la fenetre du navigateur
    Maximize Browser Window
    # Saisie du login
    Input text    ${txt_UserName}    ${vUsername}
    # Saisie du mot de passe
    Input text    ${txt_Password}    ${vPassword}
    # Click sur le bouton Connexion
    Click Button    ${btn_Login}
    # S'assurer que la page est chargee
    Wait Until Element Is Visible    ${lblTitle}
    # S'assurer que l'utilisateur est connecte et que le tableau de bord est affiche
    Element Should Contain    ${lblTitle}    Tableau de bord de ELHISSAK Mokhtar
Logout
    #sleep    3s
    Wait Until Element Is Visible    ${link_HeaderUserMenu}
    Click Element    ${link_HeaderUserMenu}
    Wait Until Element Is Visible    ${link_HeaderDeconnexion}
    Click Element    ${link_HeaderDeconnexion}
    [Teardown]    Close Browser
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
