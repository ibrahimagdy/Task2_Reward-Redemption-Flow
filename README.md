# Drop Me Rewards Redemption Flow - Task 2

## Overview
This Flutter application provides a comprehensive rewards redemption system for Drop Me users. The app allows users to browse available rewards, check their points balance, and redeem rewards with a smooth, animated user experience.

## System Design Architecture 🎨
The project follows **Clean Architecture** principles with the following structure:

```
lib/
├── core/
│   ├── helpers/
│   │   ├── extensions.dart          # Navigation & utility extensions
│   │   └── spacing.dart             # Responsive spacing helpers
│   ├── routes/
│   │   ├── app_routes.dart          # Route generation logic
│   │   └── routes_name.dart         # Route constants
│   ├── theming/
│   │   ├── color_manager.dart       # App color constants
│   │   ├── font_weight_helper.dart  # Typography weights
│   │   └── text_styles.dart         # Reusable text styles
│   └── widgets/
│       ├── app_text_button.dart     # Custom button component
│       ├── custom_snack_bar.dart    # Custom snackbar notifications
│       ├── error_state_widget.dart  # Error handling widget
│       └── loading_progress_indicator.dart # Loading states
├── features/
│   └── rewards/
│       ├── data/
│       │   ├── models/
│       │   │   └── reward_model.dart      # Reward data model
│       │   └── repo/
│       │       └── rewards_repo.dart      # Data repository
│       ├── logic/
│       │   ├── rewards_cubit.dart         # Business logic (Cubit)
│       │   ├── rewards_state.dart         # State management (Freezed)
│       │   └── rewards_state.freezed.dart # Generated freezed file
│       └── ui/
│           ├── rewards_list_screen.dart           # Main rewards list
│           ├── reward_details_screen.dart         # Reward details
│           ├── redemption_success_screen.dart     # Success feedback
│           └── widgets/
│               ├── confirmation_dialog.dart       # Redemption confirmation
│               ├── redeem_button_section.dart     # Redeem action button
│               ├── reward_card.dart               # Individual reward card
│               ├── reward_image_section.dart      # Reward visual display
│               ├── reward_info_section.dart       # Reward information
│               └── user_points_header.dart        # Points balance header
└── main.dart
```

### Installation Steps 📥

1. **Clone the repository**
   ```bash
   git clone https://github.com/ibrahimagdy/Task2_Reward-Redemption-Flow.git
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

## Demo 📸

https://github.com/user-attachments/assets/925a93a9-2691-43ea-9901-9b95870fbb28

## Screenshots 📲
<img width="450" height="866" alt="Screenshot 2025-07-30 at 7 07 38 AM" src="https://github.com/user-attachments/assets/ec1f0e53-11ca-4eeb-932b-190049413472" />
<img width="468" height="866" alt="Screenshot 2025-07-30 at 7 08 17 AM" src="https://github.com/user-attachments/assets/5ac3a232-68ba-4b81-a22d-37102cd7610e" />
<img width="470" height="866" alt="Screenshot 2025-07-30 at 7 09 48 AM" src="https://github.com/user-attachments/assets/5a123e68-bc52-4510-ba5b-80c0bd36caf1" />
<img width="466" height="866" alt="Screenshot 2025-07-30 at 7 10 13 AM" src="https://github.com/user-attachments/assets/80d43018-7295-4988-ad56-7ef37bf42196" />
<img width="466" height="866" alt="Screenshot 2025-07-30 at 7 10 54 AM" src="https://github.com/user-attachments/assets/c4230dc9-9825-45f5-b21a-01e5f51a3da7" />


## Features 📚
- **Rewards Browsing**: Display available rewards with points requirements
- **Points Management**: Track user points balance with visual feedback
- **Reward Redemption**: Complete redemption flow with confirmation dialog
- **Animated UI**: Sequential card animations and smooth transitions
- **Responsive Design**: Optimized for different screen sizes
- **State Management**: Robust state handling with loading, success, and error states
- **User Feedback**: Custom snack bars and success screens

## Dependencies 🧩
- **flutter_screenutil**: Responsive UI design
- **flutter_bloc**: State management (Cubit pattern)
- **freezed**: Immutable state classes
- **freezed_annotation**: Freezed annotations
- **build_runner**: Code generation

## Key Implementation Choices ✍️

### 1. **State Management - BLoC/Cubit with Freezed**
- **Why**: Chosen for type-safe state management and immutable state classes
- **Implementation**: Used Cubit with Freezed for clean state definitions
- **Benefits**: Predictable state changes, easy testing, and comprehensive state coverage

### 2. **Clean Architecture with Feature-Based Structure**
- **Structure**: Organized by features with clear separation of concerns
- **Data Layer**: Repository pattern for data access
- **Logic Layer**: Cubit for business logic
- **UI Layer**: Screens and reusable widgets
- **Benefits**: Scalable, maintainable, and testable codebase

### 3. **Animated User Experience**
- **Sequential Animations**: Cards appear one after another with smooth transitions
- **Hover Effects**: Interactive card animations on tap
- **Loading States**: Professional loading indicators during async operations
- **Benefits**: Enhanced user engagement and modern feel

### 4. **Comprehensive Error Handling**
- **Insufficient Points**: Clear error messages for redemption failures
- **Loading States**: Visual feedback during async operations
- **Retry Mechanisms**: Easy recovery from errors
- **Benefits**: Robust user experience with graceful error handling

### 5. **Modular Widget Architecture**
- **Reusable Components**: Consistent UI elements across screens
- **Custom Widgets**: Specialized components for specific use cases
- **Separation of Concerns**: Each widget has a single responsibility
- **Benefits**: Easy maintenance and consistent design system

## Challenges Faced & Solutions 🧠

### 1. **Challenge**: Creating smooth sequential animations for the rewards list
**Solution**:
- Implemented multiple `AnimationController`s for individual card animations
- Used staggered timing with `Future.delayed` for sequential appearance
- Added proper animation disposal to prevent memory leaks

### 2. **Challenge**: Managing complex state transitions during redemption flow
**Solution**:
- Used Freezed unions for type-safe state management
- Implemented separate loading states for different operations
- Created comprehensive state handling with proper error recovery

### 3. **Challenge**: Designing responsive UI without specific design mockups
**Solution**:
- Used Flutter ScreenUtil for consistent scaling across devices
- Implemented modern design patterns with cards, gradients, and shadows
- Created intuitive user flow based on common e-commerce patterns

## Mock Data ⚠️
The application uses hardcoded mock data for rewards:
- **5 Sample Rewards**: Including vouchers, merchandise, and food discounts
- **User Points**: Starting balance of 1000 points
- **Categories**: Discounts, Products, Clothing, Food

🚨🚨 This can be easily replaced with real API calls when backend integration is required.
