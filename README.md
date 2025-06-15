# Campus Compass

Campus Compass is a cross-platform application developed using the Flutter framework, designed to enhance campus management and communication for both teachers and students. The application integrates Firebase for authentication and real-time database functionality, providing a robust and scalable solution for collaborative group management.

## Table of Contents

- [Features](#features)
- [Architecture Overview](#architecture-overview)
- [Key Components](#key-components)
- [Installation & Setup](#installation--setup)
- [Usage](#usage)
- [Contributing](#contributing)


---

## Features

- **User Authentication:** Secure sign-in and sign-out for teachers and students using Firebase Authentication.
- **Group Management:** Teachers can create, manage, and delete groups. Students can join groups using a unique code.
- **Role-based Interfaces:** Distinct home pages and navigation tailored for students and teachers.
- **Real-time Updates:** Group information and membership are updated in real time using Cloud Firestore.
- **Modern UI/UX:** Responsive design with a clean, intuitive interface, leveraging Flutter's Material UI and animation support (Lottie).
- **Cross-Platform Support:** Deployable on web, Windows, and Linux platforms.

---

## Architecture Overview

Campus Compass adopts a modular structure following Flutter’s best practices:
- **`/lib/pages/`:** Contains main UI pages for student and teacher experiences.
- **Platform-specific folders (`/linux`, `/windows`, `/web`):** Manage desktop and web builds via CMake and platform configuration files.
- **Firebase Integration:** Back-end logic is handled via Cloud Functions (see `/functions/index.js`) and real-time data through Firestore.

The application uses a clear separation of concerns, where UI logic, business logic, and platform-specific code are isolated for maintainability and scalability.

---

## Key Components

### 1. Teacher Home Page (`lib/pages/teacher_home_page.dart`)
- Allows teachers to create and manage groups.
- Provides a guided section to help educators navigate features.
- Integrates Firebase Auth for user sessions and Firestore for group data persistence.
- Includes a bottom navigation bar for seamless navigation.

### 2. Student Home Page (`lib/pages/student_home_page.dart`)
- Enables students to join groups via a unique code.
- Displays joined groups and associated activities.
- Utilizes StreamBuilder for real-time group data updates.

### 3. Firebase Functions (`functions/index.js`)
- Scaffolded for future backend logic, such as custom triggers and HTTPS callable functions.

### 4. Platform Builds
- **Web:** Managed via `web/index.html` and associated Flutter build files.
- **Desktop:** Platform-specific build configurations in `linux/` and `windows/` directories, using CMake for build management.

---

## Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/adithyasd10/Final.git
   cd Final
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Set up Firebase:**
   - Create a Firebase project and register your app.
   - Add the required configuration files (`google-services.json` for Android, `GoogleService-Info.plist` for iOS, and web config).
   - Enable Authentication and Firestore in the Firebase console.

4. **Run the application:**
   ```bash
   flutter run
   ```

   To build for web or desktop, use:
   ```bash
   flutter run -d chrome
   flutter run -d windows
   flutter run -d linux
   ```

---

## Usage

- **Teachers:** Sign in, create groups, and manage your classroom’s digital workspace. Share group codes with students for joining.
- **Students:** Sign in, join groups using provided codes, and participate in group activities.

The application features intuitive navigation and in-app guides to help users maximize platform benefits.

---

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request. For major changes, open an issue first to discuss your proposed changes.

---
