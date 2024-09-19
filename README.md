
## **Flutter Ayatnesia Qur'an Search**

## Table of Contents
- [**Flutter Ayatnesia Qur'an Search**](#flutter-ayatnesia-quran-search)
- [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Demo App](#demo-app)
- [Getting Started with AyatNesia Qur'an Search](#getting-started-with-ayatnesia-quran-search)
  - [Prerequisites](#prerequisites)
  - [Clone the Repository](#clone-the-repository)
  - [Install Dependencies](#install-dependencies)
- [Run the Project](#run-the-project)
  - [(Optional) Generate Native Splash Screen](#optional-generate-native-splash-screen)
- [Troubleshooting](#troubleshooting)
- [Additional Information](#additional-information)
- [Developed By 👨‍💻](#developed-by-)
- [Technologies Used ⚙](#technologies-used-)
- [Dependencies 📦](#dependencies-)
- [Assets](#assets)


### Overview
Flutter Ayatnesia Qur'an Search is a mobile application developed using Flutter, which serves as my final project for completing a Computer Science degree at Nahdlatul Ulama University, Blitar.

This application features a search capability for the text of Qur'anic verses in Indonesian translation, utilizing both lexical and semantic similarity measurements. Flutter Ayatnesia is designed to meet the needs of users looking for relevant Qur'anic verses, whether based on keyword similarity or semantic meaning, by leveraging the Al-Qur'an dataset provided by the Indonesian Ministry of Religious Affairs (Kemenag). This makes it easier for the Indonesian public to find verses that best match their needs.

The search feature and Qur'anic data management are integrated through a REST API that I developed in the project "[FastAPI Ayatnesia](https://github.com/utrodus/fastapi-ayatnesia)." The Qur'an dataset, which includes Arabic text, translations, and brief interpretations, is sourced from the [Al Qur'an Kemenag](https://quran.kemenag.go.id/), ensuring that the data is valid and reliable.

**Key Features:**
- **Lexical Search:** Find Qur'anic verses based on keywords or phrases using TF-IDF and cosine similarity methods.
- **Semantic Search:** Discover verses based on the meaning of words using word embeddings with the FastText model.
- **Combined Search:** A blend of lexical and semantic searches that allows for searching verses using both keywords and semantic meanings simultaneously.
- **Relevance Calculation:** Search results include relevance scores based on three methods: lexical, semantic, and combined.
- **Brief Interpretation by Kemenag:** The application also features brief interpretations by Kemenag, making it easier for users to read and understand the interpretation of each verse.

### Demo App

https://github.com/user-attachments/assets/8534e8a1-ed60-46e6-be83-beaf548a67dc

---

## Getting Started with AyatNesia Qur'an Search

Follow these steps to set up and run the **AyatNesia Qur'an Search** project in your local development environment.

### Prerequisites

Ensure you have installed the following prerequisites:

1. **Flutter SDK**: Version `>=3.1.0`
2. **Dart SDK**: Included with the Flutter SDK.
3. **Git**: For cloning the repository.
4. **Code Editor**: [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio) is recommended.

### Clone the Repository

1. Open a terminal or command prompt.
2. Run the following command to clone the repository to your local machine:

    ```bash
    git clone https://github.com/utrodus/flutter-ayatnesia-quran-search
    ```

3. Navigate to the cloned project directory:

    ```bash
    cd flutter-ayatnesia-quran-search
    ```

### Install Dependencies

Once the repository is successfully cloned, the next step is to install all the dependencies required by the project:

1. Run the following command to download and install all the necessary Flutter packages:

    ```bash
    flutter pub get
    ```

## Run the Project

After all dependencies are installed and the splash screen is generated, you can run the project with the following steps:

0. First of all before you run Ayatnesia Qur'an Search project, make sure you have **Setup and Run** [Ayatnesia API](https://github.com/utrodus/fastapi-ayatnesia) in your machine
1. Connect your Android or iOS device to your computer, or run an emulator.
2. Run the following command to start the application:

    ```bash
    flutter run
    ```

The project will be compiled and run on the connected device or emulator.

### (Optional) Generate Native Splash Screen

This project uses the `flutter_native_splash` package to generate a native splash screen. Follow these steps to generate the native splash screen:

1. Run the following commands in the terminal:

    ```bash
    flutter clean
    flutter pub get
    flutter pub run flutter_native_splash:create
    ```

## Troubleshooting

If you encounter issues while running the project, try the following steps:

- Ensure all prerequisites are installed correctly.
- Run `flutter doctor` to check for any issues with your Flutter installation.
- If there are dependency issues, run `flutter pub get` again.
- Check the `pubspec.yaml` file to ensure there are no syntax errors or incorrect package versions.

If you have trouble with pod install, try running the following command:
```bash
sudo arch -x86_64 gem install ffi
```
```bash
cd ios
```

```bash
arch -x86_64 pod install
```

## Additional Information
For more information on how to use Flutter, visit the [official Flutter documentation](https://flutter.dev/docs).

--- 

## Developed By 👨‍💻

| Role      | Team                                | Status | Joined At        |
| --------- | ----------------------------------- | :----: | ---------------- |
| Developer | Utrodus - <contact.utrodus@gmail.com> | Active | Project kick-off |

## Technologies Used ⚙

| Dart       | Flutter   |
| ---------- | --------- |
| **3.16.9** | **3.2.6** |

## Dependencies 📦

<details>
<summary><strong>Package Dependencies</strong></summary>

| Package                    | Version       | Description                                                                                                       |
|----------------------------|---------------|-------------------------------------------------------------------------------------------------------------------|
| animate_do                 | ^3.0.2        | A package used to add attractive animations to widgets.                                                           |
| cupertino_icons            | ^1.0.2        | iOS style icons for use in the application.                                                                       |
| dartz                      | ^0.10.1       | A library providing functional data structures like `Either`, `Option`, and more.                                 |
| dio                        | ^5.2.1+1      | An HTTP client supporting interceptors, cancellation, and other advanced features for API communication.          |
| flutter                    | sdk: flutter  | A framework for building natively compiled applications for mobile, web, and desktop from a single codebase.      |
| flutter_staggered_animations| ^1.1.1       | A library for adding staggered animations to lists of widgets.                                                    |
| flutter_screenutil         | ^5.8.4        | A package for handling screen responsiveness in Flutter.                                                          |
| get                        | ^4.6.6        | A simple yet powerful state management library for Flutter applications.                                          |
| ionicons                   | ^0.2.2        | A package providing a variety of Ionicons style icons.                                                            |
| logger                     | ^2.4.0        | A library for logging within Flutter applications.                                                                |
| lottie                     | ^3.1.2        | A package for displaying Lottie animations, compiled from After Effects.                                          |
| get_storage                | 2.1.1         | A simple and fast data storage package for Flutter.                                                               |

</details>

<details>
<summary><strong>Development Dependencies</strong></summary>

| Dev Dependency            | Version       | Description                                                                                                       |
|---------------------------|---------------|-------------------------------------------------------------------------------------------------------------------|
| flutter_lints             | ^4.0.0        | Linting rules for Flutter projects.                                                                               |
| flutter_native_splash     | ^2.2.17       | Generates native splash screens for Flutter applications.                                                         |
| flutter_test              | sdk: flutter  | A package for writing unit tests and widget tests in Flutter.                                                     |

</details>

## Assets

- **Images**: 
  - Stored in the `assets/img/` directory.
- **Animations**:
  - Stored in the `assets/animation/` directory.
- **Fonts**:
  - **Poppins**:
    - Bold (700): `assets/fonts/Poppins-Bold.ttf`
    - SemiBold (600): `assets/fonts/Poppins-SemiBold.ttf`
    - Medium (500): `assets/fonts/Poppins-Medium.ttf`
    - Regular (400): `assets/fonts/Poppins-Regular.ttf`
  - **LPMQ-IsepMisbah**:
    - Regular (400): `assets/fonts/LPMQ-IsepMisbah.ttf`


