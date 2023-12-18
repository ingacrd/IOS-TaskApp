# Task Manager iOS App

This iOS app made in Swift language, is a simple task manager that allows users to create, view, and manage tasks. The app includes features such as task listing, searching, updating, and deleting.

## Table of Contents

- [TaskTableViewCell](#tasktableviewcell)
- [enumSegue](#enumsegue)
- [TaskProvider](#taskprovider)
- [UsersProvider](#usersprovider)
- [TaskModel](#taskmodel)
- [UserModel](#usermodel)
- [ViewController](#viewcontroller)
- [SecondViewController](#secondviewcontroller)
- [loginViewController](#loginviewcontroller)
- [RegisterViewController](#registeriewcontroller)

## TaskTableViewCell

### Description

The `TaskTableViewCell` is a custom table view cell used for displaying individual tasks in the task list. It includes a description label, an instruction label, and a switch to mark the task as done.

### Features

- Display task details including description, instructions, and done status.
- Toggle task completion using a switch.
- Customized cell appearance based on the task's completion status.

## enumSegue

### Description

The `enumSegue` file defines named segues used for navigation between view controllers.

### Features

- Centralized management of segue identifiers for improved code readability.
- Includes segues for transitioning between different views.

## TaskProvider

### Description

The `TaskProvider` class is responsible for managing tasks, including generating mock data, filtering tasks based on search criteria, and storing all tasks.

### Features

- Generate mock data for testing purposes.
- Filter tasks based on a search query.
- Centralized storage for all tasks.

## UsersProvider

### Description

The `UsersProvider` class manages user data, storing information about registered users.

### Features

- Stores user information for authentication purposes.
- Used in the login process to verify user credentials.

## TaskModel

### Description

The `TaskModel` class represents a task entity, including properties such as description, instructions, and completion status.

### Features

- Define properties for task details.
- Initialize tasks with provided values.

## UserModel

### Description

The `UserModel` class represents a user entity, containing properties for the username and password.

### Features

- Define properties for user details.
- Initialize users with a username and password.

## ViewController

### Description

The `ViewController` is the main view controller responsible for displaying the list of tasks. It includes features for searching, selecting, and navigating to a detailed view.

### Features

- Display a welcome message for the logged-in user.
- Initialize and populate the task list.
- Search for tasks based on user input.

## SecondViewController

### Description

The `SecondViewController` allows users to view and edit individual tasks. It includes features for saving changes, deleting tasks, and refreshing the task list.

### Features

- Display task details for editing.
- Save changes to existing tasks or add new tasks.
- Delete tasks and refresh the task list.

## loginViewController

### Description

The `loginViewController` handles user authentication, allowing users to log in and navigate to the main task view.

### Features

- Authenticate users based on provided credentials.
- Transition to the main task view upon successful login.
- Implement a see-password feature for password visibility.

## RegisterViewController

### Description

The `RegisterViewController` enables users to register new accounts by providing a username and password.

### Features

- Register new users with a username and password.
- Transition back to the login view after successful registration.
- Implement a see-password feature for password visibility.
