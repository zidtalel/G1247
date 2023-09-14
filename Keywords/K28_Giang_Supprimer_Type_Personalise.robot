*** Settings ***
Library    SeleniumLibrary
# Login Page Elements
*** Variables ***
${vURL}

# Locators  
${link_HeaderAccueil}    id=HEADER_HOME
${gestionnaire_De_Modeles}    xpath://a[@title='Gestionnaire de modèles']    
${link_NomModelePart1}    //span[text()='    
${link_NomModelePart2}    ']    
${nom_Modele_HEADINGPart1}    xpath://h1[text()='    
${nom_Modele_HEADINGPart2}    ']    
${link_ActionMenuPart1}    //span[text()='
${link_ActionMenuPart2}    ']/ancestor::tr/td[5]/descendant::span[text()='Actions'] 
${img_Deleted}    xpath://div[@class='dijitPopup Popup']/descendant::div[@class='alf-menu-group-items']/table/tbody/tr[3]/child::td/child::img[@alt='Supprimer']
${supprimer_DIALOG_HEADING}    id=CMM_DELETE_TYPE_DIALOG_title 
${btn_Supprimer}    xpath://div[@class='footer']/descendant::span[contains(text(),'Supprimer')] 

*** Keywords ***
#K28: Supprimer un type personnalise(dans un modele deja cree)
Supprimer un type personnalise
    [Arguments]    ${vNomModele}    ${vTypePersonalise}

    Wait Until Element Is Visible    ${link_HeaderAccueil}
    Sleep    3
    #Aller sur l'outil Admin   
    Go To    ${vURL}/console/admin-console/application
    Sleep    3
    #Click sur la link Gestion de Modeles
    Click Element    ${gestionnaire_De_Modeles}
    Sleep    3
    Wait Until Element Is Visible    //*[contains(text(), 'Actions')]
    #Click sur le nom de modele
    Click Element    ${link_NomModelePart1}${vNomModele}${link_NomModelePart2}
    Sleep    3
    
    Wait Until Element Is Visible    ${nom_Modele_HEADINGPart1}${vNomModele}${nom_Modele_HEADINGPart2}
    #Click sur le menu Actions que le nom de type de personalise
    Click Element    ${link_ActionMenuPart1}${vTypePersonalise}${link_ActionMenuPart2}
    Sleep    3 

    #Click sur l'option Supprimer du menu Actions 
    ${item2}=     Get WebElement    ${img_Deleted}  
    Click Element    ${item2}    
    Sleep    3

    #Attendre le popup visible
    Wait Until Element Is Visible    ${supprimer_DIALOG_HEADING}

    #Click sur le bouton Supprimer
    ${btnSupprimer}=    Get WebElement    ${btn_Supprimer}
    Click Element    ${btnSupprimer}
    Sleep    3 
