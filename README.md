# App Overlay Package

A Flutter package for displaying App Overlays with loading, success, error, and custom Overlays.

## Installation

Add the following dependency to your `pubspec.yaml`:

```yaml
dependencies:
  app_overlay: any
```

Then run:

```bash
flutter pub get
```

## Usage

Import the package in your Dart file:

```dart
import 'package:app_overlay/app_overlay.dart';
```

Initialize the package with optional default loading decoration:

```dart
AppOverlay.init(
  child: YourWidget(),
  defaultLoadingDecoration: LoadingDecoration(
    size: 180,
    primaryColor: Colors.purple,
    secondaryColor: Colors.white,
    lapDuration: 1000,
    strokeWidth: 14,
    insideLoaderWidget: const FlutterLogo(size: 100),
  ),
  backgroundColor: Colors.white, // Optional background color
);
```

Show App Overlay with a customizable message:

```dart
AppOverlay.show(
  context,
  message: 'Loading data...',
  type: OverlayType.loading,
);
```

Hide App Overlay after a delay:

```dart
AppOverlay.hide(delayInSecond: 2);
```

## Customization

You can customize the default loading decoration and pass custom widgets to the App Overlay.

For more details on customization, refer to the documentation and example usage in the [example](example) folder.

## License

This package is released under the MIT License. See [LICENSE](LICENSE) for more details.

This updated documentation reflects the changes made to the `AppOverlay` class and provides clear instructions on how to use the package, including the initialization step.
