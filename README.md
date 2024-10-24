
# Food Delivery App - Flutter Implementation

## Overview

This Flutter project implements a simple food delivery app interface with the following main features:
- Home screen displaying a **vertical list of food items**.
- You can change the **products view** by taping on icon provided just besides the **products view** in **dashboard**
- A **detailed list of food items**.
- A **food item details bottom sheet** for viewing more information.
- A **cart screen** to manage added food items.
- Basic **state management** to add/remove food items to/from the cart.

All states are managed locally, and external APIs are not implemented for this proof of concept.

## Key Features

1. **Home Screen**:
    - Horizontal scrolling list of food items.
    - Vertical list of food items with basic details.

2. **Food Item Details**:
    - Bottom sheet view for individual food item details.
    - Includes food name, description, price, and nutrition information (calories, protein, carbs, etc.).

3. **Cart Screen**:
    - Ability to add food items to the cart.
    - Ability to remove food items from the cart.
    - Dynamic updating of total cost based on the number of items in the cart.

4. **Local State Management**:
    - State is maintained locally without the use of an external API.
    - Manage cart state locally using state management solutions such as Stacked, and traditional SetState.

## Requirements

- **Flutter** SDK (3.24.3)
- Dart language
- Third-party libraries can be used for state management and other functionalities:
    - **Stacked** for state management.

## Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/noorj-in/food_app.git
   cd food_app
   ```

2. **Install dependencies**:

   Run `flutter pub get` to install all required packages and dependencies.

3. **Run the app**:

   ```bash
   flutter run
   ```

## Usage

- **Horizontal list of food items**: Displays featured items in a scrollable format.
- **Vertical list of food items**: Complete list of available items.
- **Details bottom sheet**: Tap on a food item to see more details in a bottom sheet.
- **Cart functionality**: Add or remove items from the cart and update the total cost.


## Third-party Libraries

Used third-party libraries for:
- State management: **Stacked**.
- Carousel images: **carousel_sliders**.
- Responsive UI: **flutter_screenutil**.
- Navigation: **go_router**.

## Future Enhancements

- Integration with external APIs for fetching live food data.
- Implementing authentication and user profile.
- Enhancing the search and filter options for food items.

## Contributions

Feel free to contribute by submitting pull requests or raising issues for enhancements and bug fixes.

