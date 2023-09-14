# Locators Delete Category
btn_SupprimerCategoriesP1="//span[text()='"
btn_SupprimerCategoriesP2="']/descendant::span[@class='insitu-delete-category']"
btn_SupprimerCategorieP3="//span[@class='button-group']/span[@class='yui-button yui-push-button']"
link_categorieP2="']"

#Utiliser le keyword K45 avant

SupprimerCategorie
    [Arguments]    ${nomCategoie}
	# ${nomCategoie} contient le nom de la catégorie a supprimer
	
    # Afficher les actions possible devant la catégorie a supprimer
    Mouse Over    ${btn_SupprimerCategoriesP1}${nomCategoie}${link_categorieP2}
	# Le sleep permet d'attendre que la croix apparaisse
    Sleep    3
    # Cliquer sur la croix pour supprimer
    Wait Until Element Is Visible    ${btn_SupprimerCategoriesP1}${nomCategoie}${btn_SupprimerCategoriesP2}
    Click Element    ${btn_SupprimerCategoriesP1}${nomCategoie}${btn_SupprimerCategoriesP2}
    Sleep    2
    # Confirmer la suppression
    Wait Until Element Is Visible    ${btn_SupprimerCategorieP3}
    Click Element    ${btn_SupprimerCategorieP3}
