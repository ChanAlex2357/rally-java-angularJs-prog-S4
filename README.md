# Rally Project

Ce projet universitaire consiste a cree une application web qui gere le chrono d'un championat de rally pour ensuite determiner le rang et les points finales de chaque pilote pour leur performances

Le projet doit etre realiser avec Java et AngularJs , ducoup j'ai opter pour un application servlet pour faire du web avec Java en backend et supporter par angular js en frontend ansi que PostgreSQL pour la base de donnee

## Deployement

Le projet contient un script de deployement **warify.bat** qui va deployer le projet web dans tomcat , il s'execute en indiquant le nom du war " ./warify.bat WAR_NAME "

Le dossier de deployement de tomcat peut etre configurer dans le script

## Dependecies

- **servlet-api.jar** librairie pour prendre en charge les servlets
- **postgresql-42.6.0.jar** librairie de postgresql
- **jca-dao.jar** Gestion de l'acces a la base de donnee qui peut etre recuperer avec ce [repository](https://github.com/ChanAlex2357/rally-java-angularJs-prog-S4.git)
- **gson-2.10.1.jar** Permet de recuperer des donnee sous format JSON depuis Java
