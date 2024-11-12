import 'package:flutter/material.dart';

class ThemeProvider extends InheritedWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const ThemeProvider({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
    required super.child,
  });

  /// Static method to access ThemeProvider from any descendant widget.
  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }

  /// Determines if the widget should notify dependents when the theme changes.
  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return oldWidget.isDarkMode != isDarkMode;
  }
}
