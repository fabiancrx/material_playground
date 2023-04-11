A place to tweak your theme and see how it affects material widgets. Vendored from [flex_color_scheme](https://github.com/rydmike/flex_color_scheme/tree/master/example/lib/example_copy_paste_from_playground).
## Usage

Here is a complete example of how to run an application while supplying a custom theme via the material app. The `MaterialPlayground` contains most material widgets which permits to easily on a single page test and iterate when designing your app and most importantly, check that your changes do not have undesired side-effects.

```dart
void main() => runApp(const DemoApp());

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  ThemeMode themeMode = ThemeMode.system;

  void _changeThemeMode(ThemeMode mode) {
    setState(() {
      themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: const AppTheme().light,
      darkTheme: const AppTheme().dark,
      themeMode: themeMode,
      home: MaterialPlayground(themeMode: themeMode, onThemeModeChanged: _changeThemeMode),
    );
  }
}
```

## Credits

All the credit goes to [Mike Rydstrom](https://github.com/rydmike) and his awesome `flex_color_scheme`, from which this sample code was pulled out.