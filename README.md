# Asteroid Near-Earth Radar

## Project Description

**Asteroid Near-Earth Radar** is a Dart-based command-line application that retrieves and displays information about near-Earth asteroids. The project demonstrates how Dart can be used to connect to an API, process JSON data, and present useful information in a simple and organized terminal interface.

## Objectives

The project aims to:

- Develop a Dart-based asteroid information application
- Retrieve asteroid data from an API
- Process and handle JSON data
- Practice REST API integration
- Develop a command-line interface using Dart
- Apply proper error handling
- Organize the application using multiple Dart packages

## Features

- Retrieves information about near-Earth asteroids
- Connects to a REST API
- Processes JSON responses
- Displays asteroid information through the command line
- Handles API and application errors
- Provides organized terminal output
- Uses separate packages for API, CLI, and terminal formatting

## Technologies Used

| Technology | Purpose |
|------------|---------|
| **Dart** | Main programming language |
| **REST API** | Retrieves asteroid information |
| **JSON** | Data format used by the API |
| **Dart CLI** | Provides the command-line interface |
| **Git & GitHub** | Version control and project repository |

## Project Structure

```text
Asteroid_Near-Earth_Radar_Workspace/
│
├── asteroid_workspace/
│   │
│   ├── asteroid_api/
│   │   ├── lib/
│   │   ├── test/
│   │   └── pubspec.yaml
│   │
│   ├── asteroid_cli/
│   │   ├── bin/
│   │   ├── lib/
│   │   ├── test/
│   │   └── pubspec.yaml
│   │
│   ├── terminal_colors/
│   │   ├── lib/
│   │   ├── test/
│   │   └── pubspec.yaml
│   │
│   ├── pubspec.yaml
│   └── pubspec.lock
│
└── README.md
```

## Requirements

Before running the project, make sure you have the following installed:

- [Dart SDK](https://dart.dev/get-dart)
- [Git](https://git-scm.com/)
- Internet connection

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/rastybillones8-creator/Asteroid_Near-Earth_Radar_Workspace.git
```

### 2. Go to the Project Directory

```bash
cd Asteroid_Near-Earth_Radar_Workspace
```

### 3. Go to the Dart Workspace

```bash
cd asteroid_workspace
```

### 4. Install Dependencies

```bash
dart pub get
```

## How to Run

To run the asteroid command-line application:

```bash
dart run asteroid_cli
```

## Sample Output

```text
--- ASTEROID NEAR-EARTH RADAR ---

Asteroid Information

Name: [Asteroid Name]
Date: [Date]
Estimated Diameter: [Diameter]
Velocity: [Velocity]
Miss Distance: [Distance]
```

> **Note:** The actual output may vary depending on the asteroid data retrieved from the API.

## Project Purpose

This project was developed to demonstrate practical skills in:

- Dart programming
- REST API integration
- JSON data processing
- Command-line application development
- Package organization
- Error handling

## Author

**Rasty Billones**

BSIT 3rd Year  
Palawan State University – Taytay Campus

## Repository

GitHub Repository:

https://github.com/rastybillones8-creator/Asteroid_Near-Earth_Radar_Workspace
