# Storage Options Documentation



## Overview

This document consists of various ways we can store App data in iOS

1. UserDefaults
Use Case: Best for storing small, simple data like user settings or preferences.
Data Types: Supports Bool, Int, Float, Double, String, URL, and Data.
    Pros: We can use this for storing basic user data like user preferences since it is simple and we have a very small user data.

2. File Storage
Use Case: Store more complex or larger files like images, documents, or custom objects.
Data Types: Any type that can be serialized (usually using Data or Codable).
    Cons: This will be stored in device and since MockItUp has a capability for user to upload larege audio/vide files, it wouldn't be recomended to store it on local.

3. Core Data
Use Case: Ideal for managing complex, relational data with support for queries and data models. Provides an object-oriented interface to the database.
Data Types: Custom types defined in the data model.
    Don't have use case to store complex relational data in the app.

4. SQLite
Use Case: Ideal for apps that need structured relational data without the overhead of Core Data.
Data Types: Custom tables and fields.
    Would be using NoSQL database over SQLite

5. CloudKit
Use Case: Store data in iCloud, suitable for sharing data between devices or users.
Data Types: Supports custom record types.
    Cons: This will use users iCloud so might want to use other methods but this can still be explored.

6. Keychain
Use Case: Store sensitive data such as passwords or tokens securely.
Data Types: String or Data.
    We can save passwords for authentication in keychain.

9. Firebase Storage
Use Case: Store large binary files like images, videos, and other types of files. It integrates with Firebase Authentication for secure access to the files.
Data Types: Files (images, videos, PDFs, etc.).
    For storing audios and videos.


For MockItUp, we will be using combination of UserDefaults, Keychain and Firebase storage options.
