
************************************************
* TIPS:Comment trouver votre ${vNomDeSite}?    *
* ${vNomDeSite} : Accueil > Sites > Mes sites  *
************************************************


# site page elements
list_sites = "xpath=//*[@id='HEADER_SITES_MENU_text']"
option_MesSites = "xpath=//*[@id='HEADER_SITES_MENU_MY_SITES_text']"
select_site_part1 = "xpath=//*[@class='theme-color-1' and text()='"
select_site_part2 = "']"
logo_site = "xpath=//*[@title='Groupe1247' and text()='Groupe1247']"


Afficher un site
    # vNomDeSite est le nom de site a afficher
    [Arguments]    ${vNomDeSite}    
    Sleep    2s
    # click list de sites
    Click Element    ${list_sites}
    # select 'Mes sites'
    Wait Until Element Is Visible    ${option_MesSites}
    Click Element    ${option_MesSites}
    # select un site content le sujet a Supprimer
    Click Element    ${select_site_part1}${vNomDeSite}${select_site_part2}
Valide site afficher
    [Arguments]    ${vNomDeSite}
    ${element_text} =    Get Text    ${logo_site}
    Should Be Equal    ${element_text}    ${vNomDeSite}