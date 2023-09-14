link_HeaderSites="id:HEADER_SITES_MENU_text"
link_HeaderMesSites="id=HEADER_SITES_MENU_MY_SITES"
lien_Wiki = "xpath=//a[@href='/share/page/site/mon-site02/wiki-page?title=Main_Page']"
btn_NouvellePageWiki = "xpath=//div[@class='new-page']//button"
txt_TitreWiki = "xpath=//div/input[@name='pageTitle']"
btn_SauvegarderPageWiki = "xpath=//div[@class='yui-u']/span/span/button"

# Pour identifier le nom du site Web désiré
# Vous devez concatener comme-ci ${lien_monSite01}${vNomSite}${lien_monSite03} pour l'étape de selection du site
lien_monSite01 = "xpath=//a[contains(text(),'"
lien_monSite03 = "')]"

Creer une nouvelle page Wiki
    [Arguments]    ${vNomSite}    ${vNomWiki}
    Wait Until Element Is Visible    ${link_HeaderSites}                 # Attendre menu déroulant 'Sites' visible
    Click Element                    ${link_HeaderSites}                 # Cliquer menu déroulant 'Sites'
    Wait Until Element Is Visible    ${link_HeaderMesSites}              # Attendre option 'Mes Sites' visible
    Click Element                    ${link_HeaderMesSites}              # Cliquer option 'Mes Sites'
    Wait Until Element Is Visible    ${vNomSite}                         # Attendre nom site visible
    Click Element                    ${vNomSite}                         # Cliquer site désiré
    Wait Until Element Is Visible    ${lien_Wiki}                        # Attendre option 'Wiki' visible
    Click Element                    ${lien_Wiki}                        # Cliquer option 'Wiki'
    Wait Until Element Is Visible    ${btn_NouvellePageWiki}             # Attendre bouton 'Nouvelle Page' visible
    Click Button                     ${btn_NouvellePageWiki}             # Cliquer bouton 'Nouvelle Page'
    Input Text                       ${txt_TitreWiki}    ${vNomWiki}     # Entrer nom nouvelle page
    Click Button                     ${btn_SauvegarderPageWiki}          # Cliquer bouton 'Enregistrer'
    Wait Until Page Contains         ${vNomWiki}                         # Valider nom du Wiki créé