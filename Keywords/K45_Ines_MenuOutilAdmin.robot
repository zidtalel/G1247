# Locators Admin Tools
link_headerOutilsAdmin="xpath=//div[@id='HEADER_ADMIN_CONSOLE']/span/a"
link_optionOutilsAdminP1="//a[@href='"
link_optionOutilsAdminP2="']"


OptionMenuOutilsAdmin
    [Arguments]    ${optionAdmin}
	# ${optionAdmin} Ce parametre contient l'option du menu outils admin qu'il faut selectionner. Peut contenir :
    # application          pour Application
    # category-manager    pour Gestionnaire de catégories
    # module-package    pour Navigateur de modules
    # node-browser    pour Navigateur de noeuds
    # search-manager    pour Gestionnaire de recherche
    # tag-management    pour Gestionnaire de tags
    # custom-model-manager    pour Gestionnaire de modèles
    # manage-sites    pour Gestionnaire de sites
    # replication-jobs    pour Tâches de réplication
    # groups    pour Groupes
    # users    pour Utilisateurs
	
    # Click sur Outil admin
    Wait Until Element Is Visible    ${link_headerOutilsAdmin}
    Click Element    ${link_headerOutilsAdmin}
    # Sleep    3
    Wait Until Element Is Visible    ${link_optionOutilsAdminP1}${optionAdmin}${link_optionOutilsAdminP2}
    Click Element    ${link_optionOutilsAdminP1}${optionAdmin}${link_optionOutilsAdminP2}
