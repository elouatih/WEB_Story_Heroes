			Projet ACOL / WEB : L'histoire dont VOUS êtes le héros
			
					------------------------

			-------------------- Requierements -----------------------

				Apache Tomcat installé (apache-tomcat-8.5.11)
					Librarie JDBC installée
				JDBC liée au serveur Web Apache Tomcat  

			--------------------- Configurations ----------------------

					########## Apache Tomcat ###########

			-> Ouvrir le fichier settings.xml
			-> Modifier les identifiants Tomcat pour entrer ses propres identifiants


					########## Librairie JDBC ##########

				-> Ouvrir le fichier src/main/webapp/META-INF/context.xml
				-> Modifier les identifiants de la base Oracle


					########## Base Oracle ##############

			-> Exécuter en query console de votre base de données Oracle les lignes
					 SQL dans le fichier install_bd.sql
		

			  ########## Déploiement et lancement de l'application ###################

				-> Lancer le serveur Tomcat avec votre éditeur (Netbeans, Éclipse ou Intellij)
				-> ou lancer le serveur en ligne de commande : mvn tomcat:deploy


