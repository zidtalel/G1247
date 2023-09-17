
##########LOCATORS Pour CreerUnNouveauFiltre ###############


###Module Creer un nouveau filtre K 39##### 
link_OutilsAdmin = "xpath://span[@ id='HEADER_ADMIN_CONSOLE_text']"
link_GestionnaireRecherche = "xpath://a[contains(text(),'Gestionnaire de recherche')]"
link_Ici="xpath://a[@target='_blank']"
btn_CreerNouveauFiltre="xpath://span[text()='Créer un nouveau filtre']"
ID_du_Filtre="xpath://input[@name='filterID']"
Nom_du_filtre="xpath://input[@name='displayName']"
Proprieté_pour_filtrer_les_resultats="xpath://input[@id='FORM_FACET_QNAME_CONTROL']"
Le_bouton_enregistrer="//span[text()='Enregistrer']"
Disponibilite_du_Filtre="//tr [@role='presentation']//span[text()='Partout']"
Btn_list="//input[@role='button presentation']"
Prp_filtre_Resultat_part1="//div[text()='"
Prp_filtre_Resultat_part2="']"




##########KeyWord Pour CreerUnNouveauFiltre   K39 ###############

########CreerUnFiltre    ###K39##############
    [Arguments]    ${vID_du_filtre}    ${vNom_du_filtre}    ${Prp_Du_Filtre}
    # ${vID_du_filtre}: C'est le ID du filttre qu'on doit inserrer
    # ${vNom_du_filtre}: C'est le Nom du filttre qu'on doit inserrer
    # ${vURLBTN} c'est la nouvelle fenetre qui s'ouvre aprés avoir cliquer sur le lien "ICI"
    # ${Date}=    Init Date    : On l'utilise pour eviter d'inserrer de nouvelles données a chaque fois
    # ${Prp_Du_Filtre}= dans la liste deroulante selectionner la proprieté pour filtrer les resultats .

 

    # Ouvrir la page    outils admin
    Click Element    ${link_OutilsAdmin}
    # Ouvrir le Gestionnaire de recherche
    Click Element    ${link_GestionnaireRecherche }

    # ouvrir le lien ICI
    Wait Until Element Is Visible    ${link_Ici}
    Click Element    ${link_Ici}
    Sleep    4
    # Le switch vrs la nouvelle fenetre dont le nouveau URL

    Switch Window    url= http://localhost:8088/share/page/dp/ws/faceted-search-config
    Sleep    3

    # Cliquer sur le boutton creer un nouveau filtre
    Wait Until Element Is Visible    ${btn_CreerNouveauFiltre}
    Click Element    ${btn_CreerNouveauFiltre}

    # Saisie des données du nouveau filtre ID
    Wait Until Element Is Visible    ${ ID_du_filtre}
    Input Text    ${ID_du_filtre}    ${vID_du_filtre}    

    # Saisie des données du nouveau filtre Nom
    Wait Until Element Is Visible    ${Nom_du_filtre}
    Input Text    ${Nom_du_filtre}    ${vNom_du_filtre}    

    # Cliquer sur le boutton de la liste deroulante
    Wait Until Element Is Visible    ${Btn_list}
    Click Element    ${Btn_list}

    # Saisir les propietes pour filtrer les resultats
    Wait Until Element Is Visible    ${Prp_filtre_Resultat_part1}${Prp_Du_Filtre}${Prp_filtre_Resultat_part2}
    Click Element    ${Prp_filtre_Resultat_part1}${Prp_Du_Filtre}${Prp_filtre_Resultat_part2}

    # Cliquer sur Enregistrer
    Click Element    ${Le_bouton_enregistrer}
	
	
NB: Il est préferable de rajouter un Sleep  2s ddans le script d'execution jste avant le Logout 	
	






  