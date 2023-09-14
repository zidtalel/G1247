#################### VARIABLES DU KEYWORD "Creer un sujet dans une discussion ####################
####################                      (dans un site deja cree)"           ####################
bouton_sites=    "id:HEADER_SITES_MENU_text"
bouton_mesSites=    "id:HEADER_SITES_MENU_MY_SITES_text"
bouton_site1=    "xpath://a[text()='"
bouton_site2=   "']"
bouton_discussions=    "xpath://a[@title='Discussions']"
bouton_nouveauSujet=    "xpath://button[text()='Nouveau sujet']"
champ_titre=    "xpath://input[@name='title']"
bouton_enregistrer=    "xpath://button[text()='Enregistrer']"
localisateur_titreNouveauSujet=    "xpath:*[@class='nodeTitle']"


Creer un sujet dans une discussion (dans un site deja cree)
    # nomNouveauSujet est le nom du nouveau sujet a creer
    # nom_site est le nom du site ou creer le nouveau sujet
    [Arguments]    ${nomNouveauSujet}    ${nom_site}
    Wait Until Element Is Visible    ${bouton_sites}
    Click Element    ${bouton_sites}
    Wait Until Element Is Visible    ${bouton_mesSites}
    Click Element    ${bouton_mesSites}
    Wait Until Element Is Visible    ${bouton_site1}${nom_site}${bouton_site2}
    Click Element    ${bouton_site1}${nom_site}${bouton_site2}
    Wait Until Element Is Visible    ${bouton_discussions}
    Click Element    ${bouton_discussions}
    Wait Until Element Is Visible    ${bouton_nouveauSujet}
    Click Element    ${bouton_nouveauSujet}
    Wait Until Element Is Visible   ${champ_titre}
    Input Text    ${champ_titre}    ${nomNouveauSujet}
    Wait Until Element Is Visible   ${bouton_enregistrer}
    Click Element    ${bouton_enregistrer}
    Wait Until Element Is Visible    ${localisateur_titreNouveauSujet}
    Element Text Should Be    ${localisateur_titreNouveauSujet}    ${nomNouveauSujet}