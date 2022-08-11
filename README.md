# What is `Application-introduction-screens`

This project was the introductory screen of the application I developed when the user first opened the application. I gave up on the project. I am publishing this introductory screen so that I can contribute to the world of Flutter.

- If the user is logging into the application for the first time, the introduction screen appears.
- As long as the user does not pass the promotion, she will encounter the introduction screen every time she opens the application.
- After the user passes the introduction, they are directed to the login or sign up screens. User accounts are hosted through Firebase.
- If the user's account is open, they are directed to the application home page, and if their account is not open, they are directed to the login page.
- Whether the user passes the promotion or not is recorded on the user's device with Hive and Secure Storage.

Just download the codes and adapt them to your project.

# `pub.dev` Packages You Need To Download

- animated_text_kit
- flutter_lints
- get
- ezanimation
- assets_audio_player
- alert
- email_validator
- flutter_secure_storage

# Information

The introduction screen is made with the paging system `GetX`. If you are going to add a new page:
1. Prepare the demo screen.
2. Add the page to the `welcomeMain.dart` file.
3. Add the `GetX` page ID that will go to the page before the last page you added when the next button is pressed.
4. That's it!
