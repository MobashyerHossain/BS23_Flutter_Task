<div align="center">
  <img src="screenshots/icons/starflare.png" alt="App Logo" width="150"/>
  <h1>StarFlare</h1>
</div>

# StarFlare
Discover most starred Flutter repos! Scalable Flutter app w/ modular architecture, state management &amp; clean code principles. Leverages GitHub API &amp; displays name, description &amp; star count.

## Project Details
In this project, I utilized various tools and methodologies to ensure efficiency and reliability:

1. **GetX as the Preferred State Manager**: Leveraged GetX for its simplicity and robustness in managing application state.

2. **Get_storage for Local Storage**: Utilized Get_storage as the preferred local storage solution, providing seamless access to persistent data akin to shared preferences.

3. **SQLite for Local Database**: Employed SQLite as the local database to store fetched data from APIs, effectively mitigating redundant API calls and enhancing overall performance.

4. **GetX Repository Pattern**: Implemented the GetX Repository pattern, ensuring a clear and effective abstraction layer between the API client and the application, facilitating better maintainability and scalability.

5. **Application Flavors**: Utilized 3 App Flavors—DEV, QA, and PROD—for distinct environments: 
   - *Development*: Facilitates rapid development and debugging.
   - *Quality Check*: Ensures thorough testing and validation before deployment.
   - *Production*: For the final release version, ensuring stability and reliability in a production environment.

These measures collectively contribute to the robustness, scalability, and maintainability of the project.


## Project Structure
Here is the basic structure followed thoughout the project.

- lib
    - app
        -main_dev.dart
        -main_qa.dart
        -main_prod.dart
    - core
        - constants
            - api_constants.dart
            - color_constants.dart
            - db_constants.dart
            - list_constants.dart
            - string_constants.dart
        - utils
            - dependency_injection.dart
    - data
        - enums
            - git_repo
                - enums of git_repo
        - models
            - git_repo
                - git_repo.dart
                - git_user.dart
                - others
        - repositories
            - git_repo_repository.dart
            - git_user_repository.dart
    - global
        - controllers
            - shared_pref_controller.dart
        - widgets
            - helpers
            - others widgets
    - modules
        - git_repo
            - business_logic
                - git_repo_binding.dart
                - git_repo_controller.dart
            - local_widgets
            - screens
    - routes
        - app_pages.dart
        - app_routes.dart
    - services
        - database
        - providers

## Project Architecure
This Flutter project follows a modular structure for better organization and scalability. Here's a brief overview of its structure:

- lib: This is the main directory for the project's Dart code.
  - app: Contains different main files for various environments (development, QA, production).
  - core: Houses essential components used throughout the project.
    - constants: Holds constant values like API endpoints, colors, database names, etc.
    - utils: Contains utility functions and classes, such as dependency injection setup.
  - data: Deals with data-related operations.
    - enums: Enumerations used within data operations, organized by domain (e.g., git_repo).
    - models: Data models representing entities like git repositories and users.
    - repositories: Classes responsible for handling data retrieval and manipulation from different sources (e.g., APIs, databases).
  - global: Contains global-level components.
    - controllers: Controllers for managing shared preferences and other global states.
    - widgets: Reusable widgets and helper functions.
  - modules: Modular components of the application.
    - git_repo: A module focusing on git repositories.
      - business_logic: Contains classes for binding and controlling business logic related to git repositories.
      - local_widgets: Local widgets specific to the git repository module.
      - screens: Screens related to git repositories.
  - routes: Handles navigation and routing within the application.
    - app_pages.dart: Defines all available routes in the application.
    - app_routes.dart: Contains functions to navigate between routes.
  - services: External services utilized by the application.
    - database: Database-related services.
    - providers: Services providing data to different parts of the application.

## App Screenshots
Here are some screenshots of the Application in action:

### Dark Mode / Light Mode
<div align="center">
<img src="screenshots/dark_mode/git_repo_list.png" width="45%" style="padding: 0 20px;"><img src="screenshots/light_mode/git_repo_list.png" width="45%" style="padding: 0 20px;">
<p style="text-align: center;">Git Repo List (Verstical Scrollable)</p>
</div>

<div align="center">
<img src="screenshots/dark_mode/git_repo_details.png" width="45%" style="padding: 0 20px;"><img src="screenshots/light_mode/git_repo_details.png" width="45%" style="padding: 0 20px;">
<p style="text-align: center;">Git Repo Details with User Data at top</p>
</div>

<div align="center">
<img src="screenshots/dark_mode/end_drawer.png" width="45%" style="padding: 0 20px;"><img src="screenshots/light_mode/end_drawer.png" width="45%" style="padding: 0 20px;">
<p style="text-align: center;">End Drawer with toggle options for App Theme, Sort Order and Sort Option</p>
</div>

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request.

## License
This project is licensed under the [MIT License](LICENSE).