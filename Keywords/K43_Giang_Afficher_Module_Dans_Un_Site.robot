*** Settings ***
Library    SeleniumLibrary
# Login Page Elements
*** Variables ***
${vURL}

# Locators  
${link_HeaderAccueil}    id=HEADER_HOME
${nom_Module_Locator_P1}    xpath://a[@title='    
${nom_Module_Locator_P2}    ']    
${btn_Plus}    xpath://span[@id='HEADER_SITE_MORE_PAGES_text']   
${nom_Module_De_Liste_P1}    xpath://a[@title='    
${nom_Module_De_Liste_P2}    ']   

*** Keywords ***
#K43: Afficher un module dans un site
Afficher un module dans un site
    [Arguments]    ${nomSite}    ${nomModule}
    Wait Until Element Is Visible    ${link_HeaderAccueil}
    Sleep    3 
    #Aller sur la site  
    Go To    ${vURL}/site/${nomSite}/dashboard
    Sleep    3
    
    ${nomModuleExist}=    Get Text    ${nom_Module_Locator_P1}${nomModule}${nom_Module_Locator_P2}
    # Check le module est diponible dans la tabs,
    IF   "${nomModuleExist}" == "${nomModule}"
        #S'il est disponible, click le
        Click Element    ${nom_Module_Locator_P1}${nomModule}${nom_Module_Locator_P2}
        Sleep    3
    ELSE
        #Si no, click sur le bouton Plus
        Click Element    ${btn_Plus}
        Sleep    3
        #Affichage une liste de module
        #Choisir le module par click sur le nom de module
        Click Element    ${nom_Module_De_Liste_P1}${nomModule}${nom_Module_De_Liste_P2} 
        Sleep    3       
    END
    