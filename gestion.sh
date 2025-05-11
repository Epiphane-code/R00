#!/bin/bash
#region fonction creation du fichier
create_file() {
echo "----------------------------------------------------------------------"
echo -n "Nom du fichier () :"
read file_name
touch $file_name
echo -e "\n\nCREATION DU FICHIER AVEC SUCCES"
echo -ne "\nFaites 'ENTRER' pour retourner au menu principal \n "
read create
echo "----------------------------------------------------------------------"
echo " MENU" 
}
#endregion
#region fonction creation du dossier
create_directory(){
echo "----------------------------------------------------------------------"
echo " CREATION DU DOSSIER "
echo "Entrez le nom: "
read file
mkdir $file
cp gestion.sh ./$file  
echo "----------------------------------------------------------------------"

}
#endregion
#region fonction fonction pour lister le contenu du repertoire courant
liste_file(){
echo "----------------------------------------------------------------------"
echo "Les élements de dossier $(pwd) : "
echo "----------------------------------------------------------------------"
ls -l | awk '{print $9, $5}'
echo "----------------------------------------------------------------------"
echo -e "Taper sur 'ENTRER' pour retourner au menu principale"
echo "----------------------------------------------------------------------"
read sorti
echo "MENU"
}
#endregion
#region fonction pour ajouter du texte dans un fichier
write_to_file()
{
echo "----------------------------------------------------------------------"
echo "Entrez le nom du fichier avec l'extension"
read file
echo -n "Veillez patienter..."
for n in 1 2 3 4 5  
do
echo -n " $n "
sleep 0.5
done
echo " "
if [ -f $file ]; then 
echo "Entrez vos informations et valider avec ENTRER puis CTRL+D"
echo " "
echo "----------------------------------------------------------------------"
echo "----------------------------------------------------------------------"
cat >> $file 
echo "----------------------------------------------------------------------"
echo "----------------------------------------------------------------------"
echo " Informations ajoutées avec succés ! "
echo -n " "
for n in 1 2 3 4 5
do
sleep 0.5
done
else echo "Le fichier '$file' n'existe pas"
fi  
echo "Faites 'ENTRER' pour sortir"
read sort
echo "----------------------------------------------------------------------"
echo "MENU"
}
#endregion 
#region fonction pour vider un fichier
truncate_file() {
echo "----------------------------------------------------------------------"
echo -n "Nom du fichier :"
read file
if [ -f $file ]; then
truncate -s 0 $file
else echo "Le fichier '$file' n'existe pas "
fi
echo -e "\nFaites 'ENTRER' pour retourner au menu principale\n"
read sort
echo "----------------------------------------------------------------------"
echo "MENU"
}
#endregion
#region fonction pour supprimer un dossier
remove_folder() {
echo "----------------------------------------------------------------------"
echo -n "Le nom du dossier : "
read folder
if [ -d $folder ]; then
rm -r $folder
else 
echo "Le dossier '$folder' n'existe pas "
fi
echo -e "\nFaites 'ENTRER' pour retourner au menu principal\n "
read sorti
echo "----------------------------------------------------------------------"
echo "MENU"
}
#endregion
#region fonction pour supprimer un fichier
remove_file()
{
echo "----------------------------------------------------------------------"
echo -n "Nom du fichier :"
read file
if [ -f $file ]; then
rm $file
else 
echo "Le fichier '$file' n'existe pas "
fi
echo -e "\nFates 'ENTRE' pour retourner au menu principal \n"
read supprimer
echo "----------------------------------------------------------------------"
echo "MENU"
}
#endregion
echo "----------------------------------------------------------------------"
echo -e "|   Vous etes dans le gestionnaire des fichiers realisé par RUSH-36   |"
echo "----------------------------------------------------------------------"
quitter=0
while [ $quitter -eq 0 ] 
do
option=0
while [ $option -lt 1 ] || [ $option -gt 10 ] 
do
echo "----------------------------------------------------------------------"
echo -e "1. Lister le repertoir \n2. Créer un dossier \n3. Créer un fichier \n4. Ajouter du texte à un fichier \n5. Supprimer un fichier \n6. Supprimer un dossier \n7. Vider un fichier \n8. Sortie"
echo "----------------------------------------------------------------------"
read choix
option=$choix
done
if [ $option -eq 1 ]; 
then
liste_file
elif [ $option -eq 2 ]; then
create_directory
elif [ $option -eq 3 ]; then
create_file
elif [ $option -eq 4 ]; then
write_to_file
elif [ $option -eq 5 ]; then
remove_file
elif [ $option -eq 6 ]; then
remove_folder
elif [ $option -eq 7 ]; then
truncate_file
else quitter=1
fi
option=0
done