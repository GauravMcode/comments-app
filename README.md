


Comments App
============



**Comments App** is a Flutter application built using the MVVM architecture. It leverages the **Provider** state management system, **Firebase Authentication** for user authentication, **Cloud Firestore** to store user data, and **Remote Config** to manage a boolean feature flag (`maskEmail`). The app fetches comments from the API `https://jsonplaceholder.typicode.com/comments` and displays them as a list of cards.

The app includes functionality for user login, sign-up, home page with comment cards, and a profile page to view user details.

* * * * *

Features
--------

-   **User Authentication**:
    -   Login and Sign-up functionality using **Firebase Authentication**.
    -   User data (name and email) is stored in **Firestore** upon successful registration.
-   **Remote Config**:
    -   A boolean flag `maskEmail` is fetched using **Firebase Remote Config**. It determines whether or not to mask user emails in the UI.
-   **Data Fetching**:
    -   Comments are fetched from the public API: `https://jsonplaceholder.typicode.com/comments`.
    -   The comments are displayed as a list of cards, each card showing the commenter's name, email (conditioned by `maskEmail`), and the comment body.
-   **Profile Management**:
    -   Users can view their profile, including name and email, after logging in.

* * * * *

Folder Structure
----------------

The project follows a modular folder structure based on **MVVM architecture**:


* * * * *

Technology Stack
----------------

-   **State Management**: Provider
-   **Firebase Authentication**: To manage user sign-up and login.
-   **Cloud Firestore**: To store user information such as name and email.
-   **Firebase Remote Config**: Used to manage a boolean flag (`maskEmail`) that alters the display of user emails.
-   **API**: Data is fetched from the public API `https://jsonplaceholder.typicode.com/comments`.

* * * * *

Installation and Setup
----------------------

1.  **Clone the repository:**

    bash

    Copy code

    `git clone https://github.com/GauravMcode/comments-app.git`

2.  **Install dependencies:**

    Make sure you have Flutter and Dart installed. Then run:

    bash

    Copy code

    `flutter pub get`

3.  **Set up Firebase:**

    -   Add your `google-services.json` for Android and `GoogleService-Info.plist` for iOS in their respective directories.
    -   Make sure Firebase Authentication, Firestore, and Remote Config are enabled in your Firebase project.
4.  **Run the app:**

    bash

    Copy code

    `flutter run`

* * * * *

App Architecture
----------------

The app is structured using the **MVVM (Model-View-ViewModel)** architecture to promote separation of concerns, making the app more maintainable.

-   **Model**: Contains data models, such as the user or comment model.
-   **View**: Handles the UI, built with Flutter widgets.
-   **ViewModel**: Manages the business logic, interacting with services and providing data to the view.

* * * * *

State Management
----------------

We are using **Provider** for state management, which allows us to bind the UI to the ViewModel effectively. For example:

-   In the login page, we use `context.read<AuthViewModel>().login()` to call authentication methods.
-   On the home page, we use `context.watch<CommentViewModel>()` to listen for changes in the comments list.

* * * * *

Firebase Integration
--------------------

-   **Authentication**: Firebase Authentication is used for login and sign-up functionality.
-   **Firestore**: On user registration, their name and email are stored in Firestore.
-   **Remote Config**: The app fetches a `maskEmail` flag from Firebase Remote Config, which controls whether to hide user email addresses in the comments list.

* * * * *

API Integration
---------------

The app fetches a list of comments from `https://jsonplaceholder.typicode.com/comments` and displays them as cards on the home page.

* * * * *

Screens
-------

-   **Login Page**: Allows users to log in with their email and password.
-   **Sign-Up Page**: New users can sign up with their name, email, and password.
-   **Home Page**: Displays a list of comment cards, fetching data from the public API.
-   **Profile Page**: Displays the logged-in user's name and email.

* * * * *

Validators
----------

The `validators.dart` file contains helper functions for validating form inputs such as:

-   Email validation (email formatting)
-   Password validation (minimum length - 6,special characters, uppercase, lowercase and digits.)

* * * * *

Responsiveness
----------

The `size_config.dart` file contains SizeConfig class for ensuring responsiveness across different mobile screens:

* * * * *

Remote Config
-------------

The `remote_config_service.dart` file handles fetching and updating Firebase Remote Config values, specifically the `maskEmail` boolean, which toggles whether to mask user emails on the comment cards.

* * * * *


Conclusion
----------

This project demonstrates the use of Firebase services in a Flutter app, with a clean MVVM architecture and state management via Provider. It is a scalable structure that can be easily extended with more features in the future.
