#################### VARIABLES DU KEYWORD "Supprimer un modèle" ####################
bouton_outilsAdmin=    "css:a[title='Outils admin']"
bouton_gestionnaireDeModeles=    "css:a[title='Gestionnaire de modèles']"
linkActions1="//span[text()='"
linkActions2="']/ancestor::tr/td//span[text()='Actions']"
localisation_listeModeles=    "xpath://tr[@class='alfresco-lists-views-layouts-Row alfresco-lists-views-layout-_MultiItemRendererMixin__item']"
bouton_supprimer=    "xpath://div[contains(@style,'visible')]//descendant::*[text()='Supprimer']"
bouton_confirmerSuppression=    "xpath://div[@class='footer']/descendant::*[text()='Supprimer']"


Supprimer un modele
    # NomModele est le nom du modele a supprimer
    [Arguments]    ${NomModele}
    Wait Until Element Is Visible    ${bouton_outilsAdmin}
    Click Element    ${bouton_outilsAdmin}
    Wait Until Element Is Visible    ${bouton_gestionnaireDeModeles}
    Click Element    ${bouton_gestionnaireDeModeles}
    Wait Until Element Is Visible    ${linkActions1}${NomModele}${linkActions2}
    Sleep    2
    Click Element    ${linkActions1}${NomModele}${linkActions2}
    Wait Until Element Is Visible    ${bouton_supprimer}
    Click Element    ${bouton_supprimer}
    Wait Until Element Is Visible    ${bouton_confirmerSuppression}
    Click Element    ${bouton_confirmerSuppression}