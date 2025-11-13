import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:upper_snackbar/upper_snackbar.dart';

void main() {
  setUp(() {
    // Clean up before each test
    UpperSnackbar().hide();
  });

  tearDown(() {
    // Clean up after each test
    UpperSnackbar().hide();
  });

  group('UpperSnackbar', () {
    testWidgets('should display snackbar with message',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      UpperSnackbar().showInfo(
                        context,
                        message: 'Test message',
                        duration: 1,
                      );
                    },
                    child: const Text('Show Snackbar'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Snackbar'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Test message'), findsOneWidget);

      // Clean up
      UpperSnackbar().hide();
      await tester.pumpAndSettle();
    });

    testWidgets('should display success snackbar with correct icon',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      UpperSnackbar().showSuccess(
                        context,
                        message: 'Success message',
                        duration: 1,
                      );
                    },
                    child: const Text('Show Success'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Success'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Success message'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);

      UpperSnackbar().hide();
      await tester.pumpAndSettle();
    });

    testWidgets('should display error snackbar with correct icon',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      UpperSnackbar().showError(
                        context,
                        message: 'Error message',
                        duration: 1,
                      );
                    },
                    child: const Text('Show Error'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Error'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Error message'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);

      UpperSnackbar().hide();
      await tester.pumpAndSettle();
    });

    testWidgets('should display warning snackbar with correct icon',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      UpperSnackbar().showWarning(
                        context,
                        message: 'Warning message',
                        duration: 1,
                      );
                    },
                    child: const Text('Show Warning'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Warning'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Warning message'), findsOneWidget);
      expect(find.byIcon(Icons.warning_amber_outlined), findsOneWidget);

      UpperSnackbar().hide();
      await tester.pumpAndSettle();
    });

    testWidgets('should display close icon when showCloseIcon is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      UpperSnackbar().showInfo(
                        context,
                        message: 'Test message',
                        showCloseIcon: true,
                        duration: 1,
                      );
                    },
                    child: const Text('Show Snackbar'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Snackbar'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byIcon(Icons.close), findsOneWidget);

      UpperSnackbar().hide();
      await tester.pumpAndSettle();
    });

    testWidgets('should hide close icon when showCloseIcon is false',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      UpperSnackbar().showInfo(
                        context,
                        message: 'Test message',
                        showCloseIcon: false,
                        duration: 1,
                      );
                    },
                    child: const Text('Show Snackbar'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Snackbar'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byIcon(Icons.close), findsNothing);

      UpperSnackbar().hide();
      await tester.pumpAndSettle();
    });

    testWidgets('should display action button when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      UpperSnackbar().showSuccess(
                        context,
                        message: 'Action test',
                        actionLabel: 'UNDO',
                        onActionPressed: () {},
                        duration: 1,
                      );
                    },
                    child: const Text('Show Snackbar'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Snackbar'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('UNDO'), findsOneWidget);

      UpperSnackbar().hide();
      await tester.pumpAndSettle();
    });

    testWidgets('should dismiss snackbar when close icon is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      UpperSnackbar().showInfo(
                        context,
                        message: 'Test message',
                        duration: 10,
                      );
                    },
                    child: const Text('Show Snackbar'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Snackbar'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Test message'), findsOneWidget);

      // Tap close icon
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(find.text('Test message'), findsNothing);
    });

    testWidgets('should use custom icon from style',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      UpperSnackbar().show(
                        context,
                        message: 'Custom icon',
                        type: SnackbarType.custom,
                        style: const SnackbarStyle(
                          icon: Icons.favorite,
                        ),
                        duration: 1,
                      );
                    },
                    child: const Text('Show Snackbar'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Snackbar'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byIcon(Icons.favorite), findsOneWidget);

      UpperSnackbar().hide();
      await tester.pumpAndSettle();
    });

    test('SnackbarStyle copyWith should work correctly', () {
      const style = SnackbarStyle(
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );

      final copiedStyle = style.copyWith(
        backgroundColor: Colors.blue,
      );

      expect(copiedStyle.backgroundColor, Colors.blue);
      expect(copiedStyle.textColor, Colors.white);
    });

    test('UpperSnackbar should be singleton', () {
      final instance1 = UpperSnackbar();
      final instance2 = UpperSnackbar();

      expect(identical(instance1, instance2), true);
    });
  });

  group('SnackbarType', () {
    test('should have all required types', () {
      expect(SnackbarType.values.length, 5);
      expect(SnackbarType.values.contains(SnackbarType.success), true);
      expect(SnackbarType.values.contains(SnackbarType.error), true);
      expect(SnackbarType.values.contains(SnackbarType.warning), true);
      expect(SnackbarType.values.contains(SnackbarType.info), true);
      expect(SnackbarType.values.contains(SnackbarType.custom), true);
    });
  });

  group('SnackbarPosition', () {
    test('should have all required positions', () {
      expect(SnackbarPosition.values.length, 3);
      expect(SnackbarPosition.values.contains(SnackbarPosition.top), true);
      expect(SnackbarPosition.values.contains(SnackbarPosition.topLeft), true);
      expect(SnackbarPosition.values.contains(SnackbarPosition.topRight), true);
    });
  });
}
