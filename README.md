## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Libraries Tools Used](#libraries-tools-used)
* [Folder Structure](#folder-structure)
* [Flow](#flow)
* [Account for testing](#account-for-testing)
* [Conclusion](#conclusion)

# General info

This is a simple todo app using Amplify from AWS services.

## Technologies

Project is created with:
*  Flutter version 3.0.1
*  Dart version 2.16.2

## Setup
To run this project, download:

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/winneze1/gimmeassignment.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

Execute the following command to run app:

```
flutter run
```

Execute the following command to test app:

```
flutter test
```
Note: Due to limited time. I'm only write a couple few test. And still trying to implement unit test with bloc_test

## Features:

* Login/SignUp/Forgot Password
* Show todos of login user
* Add new todo
* Update todo
* Delete todo

## Libraries Tools Used

**For features**
* [flutter_bloc](https://pub.dev/packages/flutter_bloc)
* [amplify_flutter](https://pub.dev/packages/amplify_flutter)
* [amplify_api](https://pub.dev/packages/amplify_api)
* [amplify_datastore](https://pub.dev/packages/amplify_datastore) (Todo handle CRUD in todo app)
* [amplify_auth_cognito](https://pub.dev/packages/amplify_auth_cognito) (To handle authenticateion)

**For testing**
* [bloc_test](https://pub.dev/packages/bloc_test)
* [equatable](https://pub.dev/packages/equatable)
* [mocktail](https://pub.dev/packages/mocktail)

## Folder Structure

```
lib/
|- data (Include cubits and repository to handle logic)
  |- cubits
  |- repository
|- models (Include todo models that pull form amplify)
|- ui (User model)
  |- pages (Contain pages)
  |- common (Contain loadingview and exceptionview)
  |- utils (Contain padding constant)
  |- app_navigator (To navigate app)
|- main (This is the starting point of the application.)
```

## Flow


<table align="center" style="margin: 0px auto;">
  <tr>
    <th>No.</th>
    <th>Gimme now assignment</th>
    <th>Screenshots</th>
  </tr>
  <tr>
    <td>1</td>
    <td>Authentication Flow <br>(User can also sign up <br>or forget password =><br> system will send a code to user mail to <br>apply when they sign up or forgot password)</td>
    <td><img align="center" src="https://user-images.githubusercontent.com/54367091/183335782-7e921844-b847-4c3f-97dd-2355adb29ee3.gif" height="350"></img></td>
  </tr>
  <tr>
      <td>2</td>
      <td>CRUD Flow</td>
      <td><img align="center" src="https://user-images.githubusercontent.com/54367091/183335741-97c1a9cc-e5d3-46a8-8468-477c0e809eb6.gif" height="350"></img></td>
   </tr>
</table>

## Account for testing
<table align="center" style="margin: 0px auto;">
  <tr>
    <th>No.</th>
    <th>Email</th>
    <th>Password</th>
  </tr>
  <tr>
    <td>1</td>
    <td>hoang97fa@gmail.com</td>
     <td>Test@123</td>
  </tr>
  <tr>
      <td>2</td>
       <td>vole5579@gmail.com</td>
     <td>Test@123</td>
   </tr>
</table>

## Conclusion

This is just a demo app. If you have any feature that you want me to improve. Feel free to ask me. 🙂





