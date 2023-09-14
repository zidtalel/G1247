Parametrer un site
    # vNomSite fonctionne tout comme dans le mot clé 'Creer une nouvelle page Wiki'
    [Arguments]    ${vNomSite}
    Wait Until Element Is Visible    ${link_HeaderSites}                             # Attendre menu déroulant 'Sites' visible
    Click Element                    ${link_HeaderSites}                             # Cliquer menu déroulant 'Sites'
    Wait Until Element Is Visible    ${link_HeaderMesSites}                          # Attendre option 'Mes Sites' visible
    Click Element                    ${link_HeaderMesSites}                          # Cliquer option 'Mes Sites'
    Wait Until Element Is Visible    ${lien_monSite01}${vNomSite}${lien_monSite03}   # Attendre nom site visible
    Click Element                    ${lien_monSite01}${vNomSite}${lien_monSite03}   # Cliquer site désiré
    Wait Until Element Is Visible    ${options_Configuration}                        # Attendre 'Options de configuration de site' visible
    Click Element                    ${options_Configuration}                        # Cliquer 'Options de configuration de site'
    Wait Until Element Is Visible    ${options_ParametrerSite}                       # Attendre menu déroulant charge éléments
    Click Element                    ${options_ParametrerSite}                       # Cliquer 'Personnaliser le site'
    Wait Until Element Is Visible    ${btn_ParametrerSite_Cancel}                    # Attendre bouton 'OK' soit visible
    Wait Until Element Is Visible    ${btn_ParametrerSite_OK}                        # Attendre bouton 'Annuler' soit visible