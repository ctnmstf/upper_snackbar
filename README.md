# Upper Snackbar

A beautiful, customizable, and animated snackbar package for Flutter that displays notifications at the top of the screen.

[![pub package](https://img.shields.io/pub/v/upper_snackbar.svg)](https://pub.dev/packages/upper_snackbar)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

![Upper Snackbar Demo](https://raw.githubusercontent.com/ctnmstf/upper_snackbar/main/screenshots/example.gif)

## Features

✨ **Easy to Use** - Simple API with sensible defaults  
🎨 **Highly Customizable** - Customize colors, icons, borders, gradients, and more  
🎯 **Predefined Types** - Built-in success, error, warning, and info styles  
📍 **Flexible Positioning** - Display at top-center, top-left, or top-right  
⚡ **Smooth Animations** - Beautiful slide-in animations  
🎭 **Action Buttons** - Add optional action buttons  
👆 **Interactive** - Tap to dismiss or trigger callbacks  
🎪 **Gradient Support** - Use gradients for backgrounds  
🔧 **Full Control** - Control duration, dismissibility, and animation speed

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  upper_snackbar: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Usage

Import the package:

```dart
import 'package:upper_snackbar/upper_snackbar.dart';
```

Show a simple info snackbar:

```dart
UpperSnackbar().showInfo(
  context,
  message: 'This is an info message!',
);
```

### Predefined Types

The package comes with four predefined types:

```dart
// Success
UpperSnackbar().showSuccess(
  context,
  message: 'Operation completed successfully!',
);

// Error
UpperSnackbar().showError(
  context,
  message: 'Something went wrong!',
);

// Warning
UpperSnackbar().showWarning(
  context,
  message: 'This action cannot be undone!',
);

// Info
UpperSnackbar().showInfo(
  context,
  message: 'Did you know?',
);
```

### With Action Button

Add an action button to your snackbar:

```dart
UpperSnackbar().showSuccess(
  context,
  message: 'File deleted successfully',
  actionLabel: 'UNDO',
  onActionPressed: () {
    // Handle undo action
    print('Undo pressed!');
  },
);
```

### Different Positions

Display the snackbar at different positions:

```dart
// Top Center (Default)
UpperSnackbar().showInfo(
  context,
  message: 'Centered at top',
  position: SnackbarPosition.top,
);

// Top Left
UpperSnackbar().showInfo(
  context,
  message: 'Top left position',
  position: SnackbarPosition.topLeft,
);

// Top Right
UpperSnackbar().showInfo(
  context,
  message: 'Top right position',
  position: SnackbarPosition.topRight,
);
```

### Custom Styling

Customize every aspect of the snackbar:

```dart
UpperSnackbar().show(
  context,
  message: 'Custom styled snackbar',
  type: SnackbarType.custom,
  style: SnackbarStyle(
    backgroundColor: Colors.pink,
    textColor: Colors.white,
    iconColor: Colors.white,
    icon: Icons.favorite,
    borderRadius: 20.0,
    elevation: 10.0,
  ),
);
```

### With Border

Add a border to your snackbar:

```dart
UpperSnackbar().show(
  context,
  message: 'Snackbar with border',
  type: SnackbarType.custom,
  style: SnackbarStyle(
    backgroundColor: Colors.white,
    textColor: Colors.deepOrange,
    iconColor: Colors.deepOrange,
    icon: Icons.notifications_active,
    border: Border.all(color: Colors.deepOrange, width: 2),
  ),
);
```

### Gradient Background

Use a gradient for the background:

```dart
UpperSnackbar().show(
  context,
  message: 'Beautiful gradient!',
  type: SnackbarType.custom,
  style: const SnackbarStyle(
    gradient: LinearGradient(
      colors: [Colors.purple, Colors.deepPurple, Colors.indigo],
    ),
    textColor: Colors.white,
    iconColor: Colors.white,
    icon: Icons.auto_awesome,
  ),
);
```

### Control Duration

Set how long the snackbar stays visible:

```dart
// Long duration (5 seconds)
UpperSnackbar().showSuccess(
  context,
  message: 'This will stay for 5 seconds',
  duration: 5,
);

// Short duration (1 second)
UpperSnackbar().showError(
  context,
  message: 'Quick message!',
  duration: 1,
);
```

### Animation Speed

Customize the animation duration:

```dart
UpperSnackbar().show(
  context,
  message: 'Slow animation',
  type: SnackbarType.info,
  animationDuration: 800, // milliseconds
);
```

### Non-dismissible Snackbar

Prevent dismissal by tapping:

```dart
UpperSnackbar().show(
  context,
  message: 'Cannot dismiss by tapping',
  type: SnackbarType.error,
  dismissible: false,
  duration: 3,
);
```

### With Tap Callback

Handle tap events:

```dart
UpperSnackbar().showInfo(
  context,
  message: 'Tap me!',
  onTap: () {
    print('Snackbar was tapped!');
  },
);
```

### Hide Programmatically

Manually hide the snackbar:

```dart
// Show snackbar
UpperSnackbar().showInfo(context, message: 'Hello!');

// Hide it manually
UpperSnackbar().hide();
```

## Parameters

### Main Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `message` | `String` | required | The message to display |
| `type` | `SnackbarType` | `info` | Type of snackbar (success, error, warning, info, custom) |
| `style` | `SnackbarStyle?` | `null` | Custom style configuration |
| `duration` | `int` | `3` | Duration in seconds before auto-dismiss |
| `position` | `SnackbarPosition` | `top` | Position of the snackbar |
| `animationDuration` | `int` | `400` | Animation duration in milliseconds |
| `dismissible` | `bool` | `true` | Whether the snackbar can be dismissed by tapping |
| `onTap` | `VoidCallback?` | `null` | Callback when snackbar is tapped |
| `actionLabel` | `String?` | `null` | Label for action button |
| `onActionPressed` | `VoidCallback?` | `null` | Callback when action button is pressed |
| `showCloseIcon` | `bool` | `true` | Whether to show close icon |

### SnackbarStyle Properties

| Property | Type | Description |
|----------|------|-------------|
| `backgroundColor` | `Color?` | Background color |
| `textColor` | `Color?` | Text color |
| `iconColor` | `Color?` | Icon color |
| `icon` | `IconData?` | Icon to display |
| `borderRadius` | `double?` | Border radius |
| `elevation` | `double?` | Material elevation |
| `padding` | `EdgeInsets?` | Internal padding |
| `margin` | `EdgeInsets?` | External margin |
| `textStyle` | `TextStyle?` | Custom text style |
| `width` | `double?` | Custom width |
| `border` | `Border?` | Border configuration |
| `boxShadow` | `List<BoxShadow>?` | Custom shadows |
| `gradient` | `Gradient?` | Gradient background |

## Example App

Check out the [example app](example/) for a comprehensive demo of all features.

To run the example:

```bash
cd example
flutter run
```

## Contributing

Contributions are welcome! Please read our [contributing guidelines](CONTRIBUTING.md) before submitting a pull request.

## Issues

If you encounter any issues or have feature requests, please file them in the [issue tracker](https://github.com/ctnmstf/upper_snackbar/issues).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Created with ❤️ by Mustafa Çetin

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a list of changes.
