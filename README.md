# NoteTaking-Web-Application

This is a note taking web application which is buit on top of technologies like front end: html, css, bootstrap and for backend: Core Java, JDBC(MYSQL), Servlets, Jsp
The modules are Register User, Login User, Add Notes, Edit Notes, Deleter Notes, View Notes and profile view and logout

Register User : user will register their name, email and password and that will be stored in the database
Login User    : user will enter the registered email and password based on it will check the database and allow user to further process or it will redirect to register page
Add Notes     : this notes section will get the heading of the topic and the content and it will be stored in the database
Delete Notes  : the user can delete their notes
Edit Notes    : the user can able to edit the topic or the content they wish to edit
View Notes    : this page shows all the notes that are added by the particular user even if the user logout the data will be remain untill he deletes the notes
                and it each notes will shown like a template that contain heading and content then published date and time and publisher name
Profile View  : the user can able to see the profile details. the data that he/she given while registering and with their unique id
logout        : it will logout the user and will be redirected to login page

without login the user cannot be able to access anyother page in this website if he try to do so it will be redirected to login page 
