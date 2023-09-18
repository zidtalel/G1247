*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         DateTime
Library         String
Variables       ../Locators/locatorsLoginDashbordPage.py
Variables       ../Locators/Locators.py
*** Variables ***
${vURL}         http://localhost:8088/share/page
${TIMEOUT}      5s
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
    Wait Until Element Is Visible    ${link_HeaderUserMenu}
    Click Element    ${link_HeaderUserMenu}
    Wait Until Element Is Visible    ${link_HeaderDeconnexion}
    Click Element    ${link_HeaderDeconnexion}
    # [Teardown]    Close Browser
SupprimerFichier
    [Documentation]    test la Supprission d'un fichier
    [Arguments]    ${nFichier}    ${btn_DocSuprrimer}    ${cf_Annuler}
    Click Element    //a[@href='/share/page/context/mine/myfiles']
    # Clique sur le lien du fichier spécifié par son nom.
    Wait Until Element Is Visible    //a[text()='mokhtar']
    Mouse Over    //a[text()='mokhtar']
    Sleep    2
    Click Element    //a[text()='mokhtar']/ancestor::td/following-sibling::td/descendant::a[@class='show-more']
    #Click Element    xpath=//div[@id='onActionShowMore']//span[text()='Plus...']
    #Click Element    xpath=//*[@class='more-actions']/*[@class='document-delete']
    Click Element    //a[@style="background-image:url(/share/res/components/documentlibrary/actions/document-delete-16.png)"]
    # Sleep    2s
    # Cliquer sur le button suppriemr
    ##Wait Until Element Is Visible    //button[text()='Supprimer']
    ##Click Button    //button[text()='Supprimer']
    Sleep    2s
    #Cliquer sur le button supprimer pour confirmer la suppression
    Click Button    //button[text()='Annuler']
    Sleep    2
