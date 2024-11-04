#  State Management

## The various states an app can enter on iOS:

    1. Not Running
        The app is not currently running. This could be because it hasn’t been launched or was terminated by the system or user.
    2. Inactive
        The app is in the foreground but isn’t receiving events (e.g., when there’s an incoming call or when the Control Center is open). This state is usually brief before transitioning to Active or Background.
    3. Active
        The app is in the foreground and actively receiving events. This is the normal state for apps that are open and in use.
    4. Background
        The app is no longer in the foreground but is still running code. Apps enter this state when the user presses the Home button or switches to another app.
        Two Background Substates:
            Execution: The app has background tasks that are still running (e.g., downloading data).
            Suspended: The app is in memory but isn’t executing code. The system can terminate it at any time if memory is low.
    5. Suspended
        The app is in memory but not executing code. This is a paused state where the app remains in the background without running any tasks. If the system needs more memory, it may terminate suspended apps to free up resources.
        

## Various states that need to be considered for MockItUp:

    1. InActive: The app is transitioning between states (e.g., when the user receives a phone call).
        Actions:
        Pause ongoing recording or analysis tasks to avoid data corruption or resource issues.
        Save any partially recorded data if needed, especially if this state transition might be longer than expected.

    2. Background: The app is running but not in the foreground.
        Actions:
            -> Stop or pause the AVCaptureSession to conserve battery and comply with iOS policies on background usage for camera and microphone.
            -> Save any current progress or temporary files, such as partial analysis results or session data, to resume where the user left off.
            -> Store minimal state information (e.g., last feedback point or recording position) in persistent storage like UserDefaults or a local database.
    3. Active / Resume: The app has returned to the foreground.
        Action: 
            -> Re-initialize AVCaptureSession and resume video or audio capturing.
            -> Check if the app’s analysis models or services need to be reloaded or refreshed.
            -> Reload the last recorded state, and provide the user with an option to resume or restart their session.
    4. Suspended State: The app is in the background and not executing code.
        Actions:
            -> Ensure all essential state data (e.g., last session data) is saved, as the system may terminate the app without further notice.
            -> Use BackgroundTasks if needed to handle specific tasks (e.g., data upload or background processing) that can complete even if the app isn’t actively in use.

