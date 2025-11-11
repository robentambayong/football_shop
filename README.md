# Football Shop - PBD Individual Assignment
### Roben Joseph B Tambayong

## Assignment 8: Flutter Navigation, Layouts, Forms, and Input Elements

### 1. Explain the difference between `Navigator.push()` and `Navigator.pushReplacement()` in Flutter. In what context of your application is each best used?

The key difference is how they manage the navigation stack (the "history" of pages).

* `Navigator.push()`: This method adds a new page (route) on top of the current stack. The user can press the back button to "pop" the new page and return to the one before it.
    * In My App: I used `push()` when the user taps the "Create Product" card on the home page. This pushes the `ProductFormPage` on top of `MyHomePage`, allowing the user to fill out the form and then press the back arrow to return to the home page.

* `Navigator.pushReplacement()`: This method replaces the current page with a new one. The old page is removed from the stack, so the user cannot go back to it.
    * In My App: I used `pushReplacement()` in the drawer's "Home" button. If the user is on the `ProductFormPage` and clicks "Home" in the drawer, we replace the form page with the home page. This prevents a confusing stack build-up (for example: `Home -> Form -> Home -> Form`) and makes the navigation feel more logical.

### 2. How do you use hierarchy widget like `Scaffold`, `AppBar`, dan `Drawer` to build a consistent page structure in the your application?

These widgets are the primary tools for a consistent look and feel.

1.  **`Scaffold`**: This is the base for every page. I use `Scaffold` as the root widget for both `MyHomePage` and `ProductFormPage`. It provides a standard structure for placing common UI elements.
2.  **`AppBar`**: This is a property of `Scaffold` (`appBar: ...`). By placing an `AppBar` in the `Scaffold` of both pages, I ensure that every page has a familiar top bar with a title.
3.  **`Drawer`**: This is also a property of `Scaffold` (`drawer: ...`). By creating one `LeftDrawer` widget and adding it to the `Scaffold` of both `MyHomePage` and `ProductFormPage`, I guarantee that every page has the exact same slide-out menu with the same navigation links, making the app's navigation predictable.

Using this hierarchy (`Scaffold` as the parent, with `AppBar` and `Drawer` as its properties) is the key to making the app's structure consistent.

### 3. In the context of user interface design, what do you think is the advantages of using layout widget like `Padding`, `SingleChildScrollView`, and `ListView` when displaying form elements? Provide usage examples from your application.

These widgets are essential for creating a clean, functional, and user-friendly form.

* **`Padding`**:
    * **Advantage:** Its advantage is creating "breathing room" or whitespace. It prevents UI elements from looking cramped and touching the edges of the screen or each other. This makes the form much easier to read and visually appealing.
    * **Example:** I wrapped every `TextFormField` (like "Product Name" and "Price") in a `Padding(padding: const EdgeInsets.all(8.0), ...)` to give each field space.

* **`SingleChildScrollView`**:
    * **Advantage:** It prevents "pixel overflow" errors. When the user taps a text field, the keyboard pops up and takes up screen space. Without this widget, the form fields at the bottom might be inaccessible or cause a yellow/black striped error. `SingleChildScrollView` wraps the form and automatically makes it scrollable if the content (the form + the keyboard) is too tall for the screen.
    * **Example:** In `product_form.dart`, the entire `Form` widget is the child of `SingleChildScrollView` to ensure the user can always scroll to the "Save" button, even with the keyboard open.

* **`ListView`**:
    * **Advantage:** It provides a scrollable list of items. It is highly efficient for displaying an unknown number of items, but in this context, it's used for a simple, scrollable menu.
    * **Example:** I used `ListView` as the main child of my `LeftDrawer`. This allows me to add menu items ("Home", "Add Product") vertically. If I were to add 10 more links later, the `ListView` would automatically allow the user to scroll through them.

### 4. How do you set the `color theme` so that your Football Shop have a visual identity that is consistent with the shop brand.

I established a consistent visual identity in two ways:

1.  **App-Wide Theme (`main.dart`):** I set a global theme in the `MaterialApp` widget. By defining `ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo))`, Flutter automatically generates a full color palette based on "indigo."
2.  **Consistent Usage:**
    * **Automatic:** In `MyHomePage`, the `AppBar`'s `backgroundColor` is set to `Theme.of(context).colorScheme.primary`. This automatically uses the "primary" color (derived from indigo) from the global theme.
    * **Explicit:** In `ProductFormPage`, I explicitly set `backgroundColor: Colors.indigo` for the `AppBar` and the "Save" button's `ButtonStyle`.

By using the same `Colors.indigo` (either as a seed or explicitly), the `AppBar` on every page, the main buttons, and the drawer header all share the same core brand color, making the app's visual identity consistent.

---

## Assignment 8: Flutter Navigation, Layouts, Forms, and Input Elements

### 1. Explain the difference between `Navigator.push()` and `Navigator.pushReplacement()` in Flutter. In what context of your application is each best used?

The key difference is how they manage the **navigation stack** (the "history" of pages).

* **`Navigator.push()`**: This method **adds** a new page (route) on top of the current stack. The user can press the back button to "pop" the new page and return to the one before it.
    * **In My App:** I used `push()` when the user taps the **"Create Product" card** on the home page. This pushes the `ProductFormPage` on top of `MyHomePage`, allowing the user to fill out the form and then press the back arrow to return to the home page.

* **`Navigator.pushReplacement()`**: This method **replaces** the current page with a new one. The old page is removed from the stack, so the user cannot go back to it.
    * **In My App:** I used `pushReplacement()` in the **drawer's "Home" button**. If the user is on the `ProductFormPage` and clicks "Home" in the drawer, we replace the form page with the home page. This prevents a confusing stack build-up (e.g., `Home -> Form -> Home -> Form`) and makes the navigation feel more logical.

### 2. How do you use hierarchy widget like `Scaffold`, `AppBar`, dan `Drawer` to build a consistent page structure in the your application?

These widgets are the primary tools for a consistent look and feel.

1.  **`Scaffold`**: This is the base for every page. I use `Scaffold` as the root widget for both `MyHomePage` and `ProductFormPage`. It provides a standard structure for placing common UI elements.
2.  **`AppBar`**: This is a property of `Scaffold` (`appBar: ...`). By placing an `AppBar` in the `Scaffold` of both pages, I ensure that every page has a familiar top bar with a title.
3.  **`Drawer`**: This is also a property of `Scaffold` (`drawer: ...`). By creating one `LeftDrawer` widget and adding it to the `Scaffold` of both `MyHomePage` and `ProductFormPage`, I guarantee that every page has the exact same slide-out menu with the same navigation links, making the app's navigation predictable.

Using this hierarchy (`Scaffold` as the parent, with `AppBar` and `Drawer` as its properties) is the key to making the app's structure consistent.

### 3. In the context of user interface design, what do you think is the advantages of using layout widget like `Padding`, `SingleChildScrollView`, and `ListView` when displaying form elements? Provide usage examples from your application.

These widgets are essential for creating a clean, functional, and user-friendly form.

* **`Padding`**:
    * **Advantage:** Its advantage is creating "breathing room" or whitespace. It prevents UI elements from looking cramped and touching the edges of the screen or each other. This makes the form much easier to read and visually appealing.
    * **Example:** I wrapped every `TextFormField` (like "Product Name" and "Price") in a `Padding(padding: const EdgeInsets.all(8.0), ...)` to give each field space.

* **`SingleChildScrollView`**:
    * **Advantage:** It prevents "pixel overflow" errors. When the user taps a text field, the keyboard pops up and takes up screen space. Without this widget, the form fields at the bottom might be inaccessible or cause a yellow/black striped error. `SingleChildScrollView` wraps the form and automatically makes it scrollable if the content (the form + the keyboard) is too tall for the screen.
    * **Example:** In `product_form.dart`, the entire `Form` widget is the child of `SingleChildScrollView` to ensure the user can always scroll to the "Save" button, even with the keyboard open.

* **`ListView`**:
    * **Advantage:** It provides a scrollable list of items. It is highly efficient for displaying an unknown number of items, but in this context, it's used for a simple, scrollable menu.
    * **Example:** I used `ListView` as the main child of my `LeftDrawer`. This allows me to add menu items ("Home", "Add Product") vertically. If I were to add 10 more links later, the `ListView` would automatically allow the user to scroll through them.

### 4. How do you set the `color theme` so that your Football Shop have a visual identity that is consistent with the shop brand.

I established a consistent visual identity in two ways:

1.  **App-Wide Theme (`main.dart`):** I set a global theme in the `MaterialApp` widget. By defining `ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo))`, Flutter automatically generates a full color palette based on "indigo."
2.  **Consistent Usage:**
    * **Automatic:** In `MyHomePage`, the `AppBar`'s `backgroundColor` is set to `Theme.of(context).colorScheme.primary`. This automatically uses the "primary" color (derived from indigo) from the global theme.
    * **Explicit:** In `ProductFormPage`, I explicitly set `backgroundColor: Colors.indigo` for the `AppBar` and the "Save" button's `ButtonStyle`.

By using the same `Colors.indigo` (either as a seed or explicitly), the `AppBar` on every page, the main buttons, and the drawer header all share the same core brand color, making the app's visual identity consistent.

---

# Assignment 7: Basic Elements of Flutter

### 1. Explain what a widget tree is in Flutter and how parent-child relationships work between widgets.

A widget tree is the fundamental structure of a Flutter application's UI. It's a hierarchical arrangement of widgets that describes how the interface should look and behave.

* **Parent-Child Relationship:** Every widget (except the root) is contained within another widget, known as its **parent**. The contained widget is called the **child**, or **children**, if the parent accepts a list.
* **How it works:** Parents are responsible for managing their children's layout, size, and position on the screen. For example, a `Column` widget (parent) arranges its `Text` and `Icon` widgets (children) vertically. The `build` method of a widget returns its child, which in turn returns its own child, forming a "tree" structure that Flutter renders.

### 2. List all the widgets you used in this project and explain their functions.

* **MaterialApp:** The root widget that provides core Material Design functionality, like navigation (routes) and theme data for the entire app.
* **MyApp:** The main application widget (a `StatelessWidget`) that holds and returns the `MaterialApp`.
* **MyHomePage:** A `StatelessWidget` that defines the structure of the main app page.
* **Scaffold:** A parent widget that provides the standard mobile app layout structure, including an `AppBar` and a `body`.
* **AppBar:** The toolbar displayed at the top of the `Scaffold`, containing the app's title.
* **SingleChildScrollView:** A parent widget that allows its child (the `Column`) to be scrolled if its content is too large for the screen.
* **Padding:** A parent widget that adds empty space (padding) around its child.
* **Column:** A parent widget that arranges its list of children vertically.
* **Text:** A child widget used to display a string of text with a specific style.
* **GridView:** A parent widget that arranges its children in a 2D scrollable grid. We used `GridView.count` to specify a fixed number of columns (3).
* **ShopCard:** Our custom `StatelessWidget` that serves as the reusable button.
* **Material:** A widget that provides the "physical" properties of Material Design, such as elevation, shape, and, in our case, the background `color`.
* **InkWell:** A widget that makes its child "splash" and respond to touch gestures, specifically the `onTap` event.
* **Container:** A utility widget used within the `InkWell` to add `padding` and define the content area.
* **Center:** A parent widget that centers its child within itself.
* **Icon:** A child widget that displays a graphical icon (e.fs., `Icons.inventory`).

### 3. What is the function of the MaterialApp widget? Explain why this widget is often used as the root widget.

The **`MaterialApp`** widget is a high-level convenience widget that wraps a number of features commonly required for applications following Material Design guidelines.

**Functions:**
* **Theming:** It provides a `theme` (using `ThemeData`) that all descendant widgets can access to maintain a consistent visual style (colors, fonts, etc.).
* **Navigation:** It manages the app's "stack" of screens (routes), allowing us to navigate between pages using `Navigator`.
* **Localization:** It sets up support for different languages and regional formats.

It's used as the **root widget** because it establishes the foundational context (like theme and navigation) that almost every other widget in the app needs to function correctly. Without it, widgets like `Scaffold` or `AppBar` would not work as expected.

### 4. Explain the difference between StatelessWidget and StatefulWidget. When would you choose one over the other?

The key difference is **state**.

* StatelessWidget is immutable. Its properties (like the `name` in the `ShopCard`) are set once when it's created and cannot change. It only has a `build` method, which runs when its parent widget rebuilds or its input properties change.
    * Use When: We need a widget that just displays information based on its configuration and doesn't need to change internally. (for example, an `Icon`, a `Text` label, or `ShopCard`).

* StatefulWidget is mutable. It can change its own internal state over its lifetime. It's composed of two classes: the `Widget` itself and a companion `State` object. When the internal state changes (by calling `setState()`), Flutter reruns the `build` method of the `State` object to update the UI.
    * Use When: We need a widget to react to user input, update based on a timer, or manage data that changes. (for example, a checkbox, a text input field, or a counter).

### 5. What is BuildContext and why is it important in Flutter? How is it used in the build method?

A `BuildContext` is an object that tells a widget where it is in the widget tree. Every widget's `build` method receives a `BuildContext` parameter.

**Why it's important:**
* **Location:** It provides a handle to the widget's exact position in the tree hierarchy.
* **Service Look-up:** It's used to "look up" and access parent widgets or services. This is how widgets find the app's `Theme` (`Theme.of(context)`) or a `Scaffold` (`ScaffoldMessenger.of(context)`). They are essentially asking, "Starting from my location (`context`), find the nearest `Theme` data up the tree."

**How it's used in `build`:**

The `build(BuildContext context)` method uses its `context` parameter to interact with the rest of the app. In my `ShopCard`, I used `Theme.of(context)` to get the theme and `ScaffoldMessenger.of(context)` to find the nearest `Scaffold` controller and show a `SnackBar` on it.

### 6. Explain the concept of a “hot reload” in Flutter and how it differs from a “hot restart”.

Both are features that dramatically speed up development.

* **Hot Reload:** This is the fast one. When we save our code, Flutter injects the updated code files directly into the running Dart Virtual Machine (VM). The app's state is preserved. The framework just reruns the `build` methods of the affected widgets.
    * Use for: Quickly testing UI changes, like changing colors, text, or layout.

* **Hot Restart:** This is slower. It destroys the current app state and restarts the entire application from the beginning (rerunning `main()`). It's much faster than a full "cold boot" because it doesn't re-compile the app, but it resets all our variables and navigation.
    * Use for: When our code changes are too significant for a hot reload (like changing state definitions or `main()`) or when we need to test the app's initial startup flow.