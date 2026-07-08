# Habity - Daily Habit Tracker

A clean and minimal Flutter application that helps users build consistent daily habits through a simple and intuitive interface. The app allows users to create habits, track their daily progress, and maintain consistency with automatic daily resets.

Designed with a focus on clean architecture, smooth user experience, and maintainable code, this project demonstrates the implementation of local data persistence, state management, and reusable UI components.

---

## Features

* Create new daily habits
* Mark habits as completed
* Real-time daily progress indicator
* Automatic daily reset based on the current date
* Local data storage using Hive
* Clean and minimal Material 3 interface
* Smooth checklist animations
* Friendly empty state when no habits are available

---

## Tech Stack

* **Flutter**
* **Dart**
* **Provider** (State Management)
* **Hive & Hive Flutter** (Local Database)
* **Material 3**

---

## Project Structure

```text
lib/
├── models/
├── providers/
├── screens/
├── widgets/
├── utils/
└── main.dart
```

---

## Architecture

The application follows a simple layered architecture:

* **Models** – Define the data structure (`Habit`)
* **Providers** – Handle business logic and state management
* **Screens** – Main application pages
* **Widgets** – Reusable UI components

This structure keeps the code modular, maintainable, and easy to extend.

---

## Daily Reset Logic

Each habit stores the date of its last update.

Whenever the application starts, it checks whether the stored date matches the current date. If a new day has begun, all habit completion statuses are automatically reset while preserving the habit list.

---

## Getting Started

### Clone the repository

```bash
git clone https://github.com/Zaharaaz/Habity.git
```

### Install dependencies

```bash
flutter pub get
```

### Generate Hive Adapter

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Run the application

```bash
flutter run
```

---

## Future Improvements

* Dark mode support
* Weekly and monthly statistics
* Local notifications and reminders
* Cloud synchronization
* Habit categories and filtering
* Streak tracking and achievements

