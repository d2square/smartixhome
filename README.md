#smartIx

I have implemented TDD(Test Data driven) architecture(Clean architecture) for this application.

#I have integrated login with firebase
(For login the app you can use email id: smartIx@gmail.com password:123456)
I have added this dummy user on firebase if we need dynamic user then we need to register from device.

#Integrated Weather api and fetched real time database based on user current location

#For api integration i have added dio plugin 
You can check network layer in networking folder

#Folder structure
Presentation layer: In this folder you can find all UI pages
Domain: In this folder you can find repository and data model.
Application: 1. Binding: This is used to inject your repository to your controller
             2. Controller: All business logic is added in the controller

#Utils: 
You can find all common components in this folder.


#pubspec.yml
You can find all plugin and other app configuration here

#State Management
I have used GetX ecosystem for state management(it uses MVVM pattern).

#Routes
I am using Getx routes for navigation to one screen to another screen

#note: I am not able to do dynamic creation of data it will take time we can use firebase for that.