#################### VARIABLES DU KEYWORD "Supprimer un filtre" ####################
bouton_gestionnaireDeRecherche=    "xpath://a[@title='Gestionnaire de recherche']"
bouton_ici=    "xpath://a[@title='Search Manager']"
bouton_supprimerFiltre1=    "xpath://img[@title=\"Cliquez pour supprimer ''"
bouton_supprimerFiltre2=    "''\"]"
bouton_confirmerSupressionFiltre=   "id:ALF_CRUD_SERVICE_DELETE_CONFIRMATION_DIALOG_CONFIRM_label"


Supprimer un filtre
    # Nom_Filtre est le nom du filtre a supprimer
    [Arguments]    ${Nom_Filtre}
    Wait Until Element Is Visible    ${bouton_outilsAdmin}
    Click Element    ${bouton_outilsAdmin}
    Wait Until Element Is Visible    ${bouton_gestionnaireDeRecherche}
    Click Element    ${bouton_gestionnaireDeRecherche}
    Wait Until Element Is Visible    ${bouton_ici}
    Click Element    ${bouton_ici}
    Sleep    5
    Switch Window    url=http://localhost:8088/share/page/dp/ws/faceted-search-config
    Wait Until Element Is Visible    ${bouton_supprimerFiltre1}${Nom_Filtre}${bouton_supprimerFiltre2}
    Click Element    ${bouton_supprimerFiltre1}${Nom_Filtre}${bouton_supprimerFiltre2}
    Wait Until Element Is Visible    ${bouton_confirmerSupressionFiltre}
    Click Element    ${bouton_confirmerSupressionFiltre}