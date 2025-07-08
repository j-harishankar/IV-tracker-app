# Campus Compass

Campus Compass is a cross-platform application developed using the Flutter framework, designed to enhance campus management and communication for both teachers and students. The application integrates Firebase for authentication and real-time database functionality, providing a robust and scalable solution for collaborative group management.

## 🖼️ Screenshots

| ![Screenshot 1](https://media.licdn.com/dms/image/v2/D5622AQF_cOi1IuYJ2g/feedshare-shrink_2048_1536/B56ZdyT_9GG0Ao-/0/1749969536695?e=1755129600&v=beta&t=xpQyjPl2xhy_dUXbaue7UTQAEhRujWjFnGM5CPq96EM) | ![Screenshot 2](https://media.licdn.com/dms/image/v2/D5622AQGlsVfK-PleLA/feedshare-shrink_2048_1536/B56ZdyT_8aHoA0-/0/1749969536846?e=1755129600&v=beta&t=0SxL3_p5JMw79gQEWFVYX4z7p7ThPknRKKActB7b_0Q) |
| --- | --- |
| ![Screenshot 3](https://media.licdn.com/dms/image/v2/D5622AQFGhFMKPAZjzQ/feedshare-shrink_2048_1536/B56ZdyT_8cH8Ao-/0/1749969536356?e=1755129600&v=beta&t=oh6_q3aEl7b0R1OMXqo6OV6q9fWTdB4YiuOzbujlTQw) | ![Screenshot 4](https://media.licdn.com/dms/image/v2/D5622AQFxAc4Xb8B0ew/feedshare-shrink_2048_1536/B56ZdyT_9BGoAs-/0/1749969537321?e=1755129600&v=beta&t=9ej4D4FPHOKB0-6hoMv4670I_7jYrZcGeZo1pAnEW4M) |
| ![Screenshot 5](https://media.licdn.com/dms/image/v2/D5622AQGu4YX7LXrOGw/feedshare-shrink_2048_1536/B56ZdyT_89GoAw-/0/1749969536564?e=1755129600&v=beta&t=_0FRESXosr2xDxyd8Fm8-ZbqBcS5_SM-f5as34MMauw) | ![Screenshot 6](https://media.licdn.com/dms/image/v2/D5622AQFEF82zOi5IiQ/feedshare-shrink_2048_1536/B56ZdyT_89HUAs-/0/1749969536370?e=1755129600&v=beta&t=KK96Jfk5J8myZCHaNbMc56w2v3XTrFVYCczkw-VVBj8) |
| ![Screenshot 7](https://media.licdn.com/dms/image/v2/D5622AQGqJEyaEOEGGA/feedshare-shrink_2048_1536/B56ZdyT_9cH8Aw-/0/1749969536806?e=1755129600&v=beta&t=dMF8ak47oZ9zBtAUKUFi95CQaJoRUCwzgfrD6Y9lCVI) | ![Screenshot 8](https://media.licdn.com/dms/image/v2/D5622AQFZWKCpJoZ9fA/feedshare-shrink_2048_1536/B56ZdyT_9TGQAs-/0/1749969536413?e=1755129600&v=beta&t=DHy8edYBg3GoLmhJSnVvUg95KThVbm2nCrn5lPR_syk) |

---

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
