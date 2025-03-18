# Flutter Layout Task

This project demonstrates how to dynamically generate a widget layout based on a JSON configuration using the **BLoC pattern**. The layout can consist of rows and columns, and each cell can contain an image, video, or URL. The project is structured to follow best practices for scalability, maintainability, and testability.

---

## Project Structure

The project is organized into the following directories:

```
lib/
├── core/                     # Core utilities and constants
│   └── utils/                # Utility functions
│       └── layout_json_data.dart  # JSON data for layout configuration
│
├── data/                     # Data layer (BLoC, models)
│   ├── bloc/                 # BLoC files
│   │   └── layout_config/    # Layout BLoC (events, states, bloc)
│   │       ├── layout_bloc.dart
│   │       ├── layout_event.dart
│   │       └── layout_state.dart
│   └── models/               # Data models
│       ├── cell_data_model.dart  # CellData model
│       └── layout_config_model.dart  # LayoutConfig model
│
├── presentation/             # UI layer (screens, widgets)
│   ├── screens/              # Screens
│   │   └── home_screen.dart  # HomeScreen widget
│   └── widgets/              # Reusable widgets
│       ├── layout_widget.dart  # DynamicLayout widget
│       └── video_player_widget.dart  # VideoPlayer widget
│
├── main.dart                 # Entry point of the application
│
test/                         # Unit and widget tests
```

---

## Features

1. **Dynamic Layout Generation**:
    - The app dynamically generates a layout based on a JSON configuration.
    - Supports **Rows**, **Columns**, **Images**, **Videos**, and **URLs**.

2. **BLoC Pattern**:
    - The **BLoC (Business Logic Component)** pattern is used to manage the state of the layout configuration.
    - The `LayoutBloc` handles loading the JSON configuration and emitting the layout state.

3. **Reusable Widgets**:
    - The `LayoutWidget` recursively builds the layout based on the configuration.
    - The `VideoPlayerWidget` handles video playback using the `video_player` package.

4. **Responsive Design**:
    - The layout adjusts to different screen sizes (portrait and landscape).

5. **Error Handling**:
    - The app includes basic error handling for invalid URLs or missing data.

---

## How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/Ritesh-056/flutter_layout_task.git
   cd flutter_layout_task
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

---

## Dependencies

The project uses the following dependencies:

- **flutter_bloc**: For state management using the BLoC pattern.
- **video_player**: For playing videos in the layout.
- **url_launcher**: For opening URLs in a web browser.
- **equatable**: For comparing the Dart Objects by overriding == and hashCode.

You can find the full list of dependencies in the `pubspec.yaml` file.

## Example JSON Configuration

The app uses a JSON configuration to define the layout. Here's an example:

```json
{
  "type": "Row",
  "flex": 1,
  "data": null,
  "children": [
    {
      "type": "Col",
      "flex": 8,
      "data": null,
      "children": [
        {
          "type": "Row",
          "flex": 4,
          "data": null,
          "children": [
            {
              "type": "Col",
              "flex": 1,
              "children": [],
              "data": {
                "type": "Image",
                "ext": "png",
                "value": "https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Google_Images_2015_logo.svg/1200px-Google_Images_2015_logo.svg.png"
              }
            },
            {
              "type": "Col",
              "flex": 2,
              "children": [],
              "data": {
                "type": "Video",
                "ext": "mp4",
                "value": "https://samplelib.com/lib/preview/mp4/sample-5s.mp4"
              }
            }
          ]
        }
      ]
    }
  ]
}
```

---

## Screenshots

Here are some screenshots of the app in action:

**Home Screen**: 
</br>
</br>
<img src="https://drive.google.com/uc?export=view&id=13LwdE0uGkaTymi8IFGx7wtQ0M9IXzBli" alt="Image" width="300" height="600">




