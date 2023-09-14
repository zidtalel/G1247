************************************************************************
* TIPS:Comment trouver votre ${vNomDeSite} et ${vNomDeSujet}?          *
* ${vNomDeSite} : Accueil > Sites > Mes sites  						   *
* ${vNomDeSujet}: Accueil > Sites > Mes sites > "Le site que vous avez * *                 choisi." > Discussions >  Tout(dans 'Sujets' a gauch)*
************************************************************************


# site page elements pour k27 Supprimer un sujet dans une discussion
list_sites = "xpath=//*[@id='HEADER_SITES_MENU_text']"
option_MesSites = "xpath=//*[@id='HEADER_SITES_MENU_MY_SITES_text']"
select_site_part1 = "xpath=//*[@class='theme-color-1' and text()='"
select_site_part2 = "']"
discussions_afficher_sur_header = "xpath=//div[@class='share-header-title']//*[@id='HEADER_SITE_DISCUSSIONS-TOPICLIST']"
icon_Plus = "xpath=//*[@id='HEADER_SITE_MORE_PAGES_text']"
icon_modifier = "xpath=//img[@title='Options de configuration de site']"
lien_Personnaliser_le_site = "//*[@id='HEADER_CUSTOMIZE_SITE']"
img_dispo_drag = "xpath=//*[@id='template_x002e_customise-pages_x002e_customise-site_x0023_default-page-discussions-topiclist']/img"
img_dispo_drop_place = "xpath=//*[@id='template_x002e_customise-pages_x002e_customise-site_x0023_default-currentPages-ul']"
btn_OK_dragDrop = "xpath=//*[@id='template_x002e_customise-pages_x002e_customise-site_x0023_default-save-button-button']"
lien_Discussions = "xpath=//*[@title='Discussions' and text()='Discussions']"
lien_Tout_sujets = "xpath=//*[@class='filter-link filter0' and text()='Tout']"
supprimer_part1 = "xpath=//*[text()='"
supprimer_part2 = "']/ancestor::div[@class='yui-dt-liner']//*[@class='topic-action-link-div' and text()='Supprimer']"
btn_supprimer = "xpath=//*[@type='button' and text()='Supprimer']"


Supprimer un sujet dans une discussion
    # vNomDeSite est le nom de site content le sujet a Supprimer
    # vNomDeSujet est le nom de sujet a supprimer
    [Arguments]    ${vNomDeSite}    ${vNomDeSujet}
    Sleep    2s
    # click list de sites
    Click Element    ${list_sites}
    # select 'Mes sites'
    Wait Until Element Is Visible    ${option_MesSites}
    Click Element    ${option_MesSites}
    # select un site content le sujet a Supprimer
    Click Element    ${select_site_part1}${vNomDeSite}${select_site_part2}

    # valide element 'Discussions' exist
    # ${found_sur_header} pour valider element 'Discussions' dans header ou pas
    # ${found_plus_icon} pou valider button 'Plus' exist ou pas
    ${found_sur_header} =    Run Keyword And Return Status    Element Should Be Visible    ${discussions_afficher_sur_header}
    ${found_plus_icon} =    Run Keyword And Return Status    Element Should Be Visible    ${icon_Plus}
    IF    not ${found_sur_header}
        # valide si il n'y pas icon 'Plus' icon 'Modifier' et drag and drop 'Discussions' img
        IF    not ${found_plus_icon}
            Click Element    ${icon_modifier}
            Click Element    ${lien_Personnaliser_le_site}
            Drag And Drop    ${img_dispo_drag}    ${img_dispo_drop_place}
            Click Element    ${btn_OK_dragDrop}
            Sleep    3s
        ELSE
            Click Element    ${icon_Plus}
            # valide si element 'Discussions' dans list 'Plus'    si non click icon 'Modifier' et drag and drop 'Discussions' img
            ${discussion_link_found} =    Run Keyword And Return Status    Element Should Be Visible    ${lien_Discussions}
            IF    not ${discussion_link_found}
                Click Element    ${icon_modifier}
                Click Element    ${lien_Personnaliser_le_site}
                Drag And Drop    ${img_dispo_drag}    ${img_dispo_drop_place}
                Click Element    ${btn_OK_dragDrop}
                Sleep    3s
            END
        END
    END

    # valide si element 'Discussions' sur header, si non click icon 'Plus'
    ${found_sur_header} =    Run Keyword And Return Status    Element Should Be Visible    ${discussions_afficher_sur_header}
    IF    not ${found_sur_header}
        Click Element    ${icon_Plus}
        # select option lien 'Discussions'
        Wait Until Element Is Visible    ${lien_Discussions}
        Click Element    ${lien_Discussions}
    ELSE
        # click 'Discussions' sur header
        Click Element    ${discussions_afficher_sur_header}
    END
    # click 'Tout' pour afficher tout les sujets
    Click Element    ${lien_Tout_sujets}  
    sleep    3s  
    # click option 'supprimer' 
    Click Element    ${supprimer_part1}${vNomDeSujet}${supprimer_part2}
    # click button 'Supprimer'
    Wait Until Element Is Visible     ${btn_supprimer}
    Click Button    ${btn_supprimer}