# BS23_Flutter_Task
Discover most starred Flutter repos! Scalable Flutter app w/ modular architecture, state management &amp; clean code principles. Leverages GitHub API &amp; displays name, description &amp; star count.

## Project Structure
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

## Screenshots

Here are some screenshots of the project in action:

### Dark Mode
<div style="display: flex; justify-content: space-between;">
<div>
 <img src="screenshots/dark_mode/git_repo_list.png" alt="Screenshot 1" width="250"/>
 <p>Git Repo List (Verstical Scrollable)</p>
</div>
<div>
 <img src="screenshots/dark_mode/git_repo_details.png" alt="Screenshot 2" width="250"/>
 <p>Git Repo Details with User Data at top</p>
</div>
<div>
 <img src="screenshots/dark_mode/end_drawer.png" alt="Screenshot 3" width="250"/>
 <p>End Drawer with toggle options for App Theme, Sort Order and Sort Option</p>
</div>
</div>

### Light Mode
<div style="display: flex; justify-content: space-between;">
<div>
 <img src="screenshots/light_mode/git_repo_list.png" alt="Screenshot 1" width="250"/>
 <p>Git Repo List (Verstical Scrollable)</p>
</div>
<div>
 <img src="screenshots/light_mode/git_repo_details.png" alt="Screenshot 2" width="250"/>
 <p>Git Repo Details with User Data at top</p>
</div>
<div>
 <img src="screenshots/light_mode/end_drawer.png" alt="Screenshot 3" width="250"/>
 <p>End Drawer with toggle options for App Theme, Sort Order and Sort Option</p>
</div>
</div>