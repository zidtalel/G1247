
##########LOCATORS Pour CreerUnSite ###############

Onglet_Sites="//span[@id='HEADER_SITES_MENU_text']"
Link_CreerUnSite="//td[@id='HEADER_SITES_MENU_CREATE_SITE_text']"
Link_NomSite="xpath://input[@name='title']"
Link_NomUrl="xpath://input[@name='shortName']"
Champs_Description="xpath://div[@class='control-row']//textarea[@name='description']"
Visibilitepart1="//input[@value='"
Visibilitepart2="']"
btn_Creer="//span[text()='Créer']"


##########KeyWord Pour CreerUnSite ###############

CreerUnSite    ###K09
    # ${VNomSite}: c'est le nom du site qu'on eut creer
    # ${VNomUrl} : cest le nom de l'URL du site qu'on veut creer.
    # ${VChamps_Description} : il s'agit du champ descrition sur le formulaire du site qu'on veut creer
    # ${Visibilite} c'est le boutton radion , on a 3 choix a faire ; (PUBLIC, PRIVATE , MODERATED )

    [Arguments]    ${VNomSite}    ${VNomUrl}    ${VChamps_Description}    ${Visibilite}

   
    # Ouvrir la page "Sites"
    Click Element    ${Onglet_Sites}
    # Cliquer sur 'Créer un site'
    Wait Until Element Is Visible    ${Link_CreerUnSite}
    Click Element    ${Link_CreerUnSite}
    # Saisir les données 'Nom du site'
    Wait Until Element Is Visible    ${Link_NomSite}
    Input Text    ${Link_NomSite}    ${VNomSite}

    # Saisir les données 'Nom de URL'
    Wait Until Element Is Visible    ${Link_NomUrl}
    Input Text    ${Link_NomUrl}    ${VNomUrl}

    # Saisir les information dans le champs Descritpion
    Wait Until Element Is Visible    ${Champs_Description}
    Input Text    ${Champs_Description}    ${VChamps_Description}

    # Saisir la visibilité du site
    ${VisibileRadio}=    Get WebElement    ${Visibilitepart1}${Visibilite}${Visibilitepart2}
    Click Element    ${VisibileRadio}

    # Cliquer sur le boutton 'Créer'
    Wait Until Element Is Visible    ${btn_Creer}
    Click Element    ${btn_Creer}


NB: Pour une bonne execution du script il est recommandé de rajouter un sleep 2s  avnt le log out 


  