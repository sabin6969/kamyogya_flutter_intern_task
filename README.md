```markdown
# Project Overview

This Flutter project aims to demonstrate the implementation of various features including making API requests, handling errors, managing state using Bloc, and displaying notifications.

Implementation Details

 Step 1: API Endpoint Input Screen

- Design the UI as per the provided Figma design.
- Implement text field for user to input API endpoint.
- Upon clicking "Done", the app should hit the API endpoint using Dio package.
- Handle errors gracefully and display appropriate messages to the user.

Step 2: Displaying Data from API

- Implement a separate screen to display data fetched from the API.
- Use Bloc for state management.
- Initially, display only the first data item.
- Every 5 seconds, fetch and display a new data item.
- After displaying three data items, stops adding more data.

Step 3: Displaying Notification

- After displaying all three data items, waits for 5 seconds.
- Display a pop-up notification using flutter_local_notifications package.

 Project Structure

The project structure should follow Flutter best practices, with separate folders for different components such as screens, blocs, repositories, services, etc.

 Dependencies

- Flutter SDK
- Dio package for making network requests
- Bloc package for state management
- flutter_local_notifications package for displaying notifications

 Project Setup

 Prerequisites

1. Flutter SDK: 
Ensure you have Flutter installed on your machine. Follow the instructions on the [official Flutter website](https://flutter.dev/docs/get-started/install) to install Flutter for your specific operating system.

2. Git: 
Make sure Git is installed on your machine to clone the project repository from GitHub.

Steps

1. **Clone the Repository**:

   Clone the project repository from GitHub:

   ```bash
   git clone https://github.com/sabin6969/kamyogya_flutter_intern_task.git
   ```

2. **Navigate to Project Directory**:

   Change into the project directory:

   ```bash
   cd kamyogya_flutter_intern_task
   ```

3. **Install Dependencies**:

   Fetch and install the project dependencies:

   ```bash
   flutter pub get
   ```

4. **Run the Application**:

   Connect your device or emulator and run the application:

   ```bash
   flutter run
   ```

### Additional Configuration

- If you encounter any issues related to dependencies or project setup, refer to the official documentation for Flutter and the specific packages being used.

- Ensure your Flutter environment is properly configured and up-to-date:

  ```bash
  flutter doctor
  ```

Now you have successfully set up the Flutter project on your local machine and can begin development or testing.
```