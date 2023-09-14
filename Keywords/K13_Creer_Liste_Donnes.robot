*** Settings ***
Library    SeleniumLibrary
# Login Page Elements
*** Variables ***
${vURL}

# Locators  
${link_HeaderAccueil}    id=HEADER_HOME
${tab_Liste_De_Donnes}    xpath://a[@title='Listes de données']
${btn_Nouvelle_liste}    xpath://button[@id='template_x002e_datalists_x002e_data-lists_x0023_default-newListButton-button']"
${link_Type_Donnes_P1}    xpath://div[@id='template_x002e_datalists_x002e_data-lists_x0023_default-newList-itemTypesContainer']/div/h4/a[contains(text(),'
${link_Type_Donnes_P2}    ')]
${input_Title}    xpath://input[@id='template_x002e_datalists_x002e_data-lists_x0023_default-newList_prop_cm_title']    
${input_Description}    xpath://textarea[@id='template_x002e_datalists_x002e_data-lists_x0023_default-newList_prop_cm_description']
${btn_Enregistrer}    xpath://button[@id='template_x002e_datalists_x002e_data-lists_x0023_default-newList-form-submit-button']

*** Keywords ***
# K13: Creer une liste de donnes(dans un site deja cree)
Creer Une Liste De Donnes   
    [Arguments]    ${nomSite}    ${nomTypeDonnes}    ${title}    ${description}

    Wait Until Element Is Visible    ${link_HeaderAccueil}
    Sleep    3
    #Aller sur la site   
    Go To    ${vURL}/site/${nomSite}/dashboard
    Sleep    3
    Click Element    ${tab_Liste_De_Donnes}
    Sleep    3
    #Click sur le bouton de creer la liste nouvelle
    Click Element    ${btn_Nouvelle_liste}
    Sleep    3
    #Choisir Agenda Evenement    
    Click Element    ${link_Type_Donnes_P1}${nomTypeDonnes}${link_Type_Donnes_P2}
    #Input title et description dans le form
    Input Text    ${input_Title}    ${title}
    Sleep    3
    Input Text    ${input_Description}    ${description}
    Sleep    3
    #Click sur le bouton Enregistrer
    Click Element    ${btn_Enregistrer}
    Sleep    3
