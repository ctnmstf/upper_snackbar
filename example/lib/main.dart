import 'package:flutter/material.dart';
import 'package:upper_snackbar/upper_snackbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upper Snackbar Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UpperSnackbarDemo(),
    );
  }
}

class UpperSnackbarDemo extends StatelessWidget {
  const UpperSnackbarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upper Snackbar Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Basic Snackbars',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildButton(
              context,
              'Show Success',
              Colors.green,
              () {
                UpperSnackbar().showSuccess(
                  context,
                  message: 'Operation completed successfully!',
                );
              },
            ),
            const SizedBox(height: 8),
            _buildButton(
              context,
              'Show Error',
              Colors.red,
              () {
                UpperSnackbar().showError(
                  context,
                  message: 'Something went wrong! Please try again.',
                );
              },
            ),
            const SizedBox(height: 8),
            _buildButton(
              context,
              'Show Warning',
              Colors.orange,
              () {
                UpperSnackbar().showWarning(
                  context,
                  message: 'This action cannot be undone!',
                );
              },
            ),
            const SizedBox(height: 8),
            _buildButton(
              context,
              'Show Info',
              Colors.blue,
              () {
                UpperSnackbar().showInfo(
                  context,
                  message: 'Did you know? You can customize everything!',
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'With Action Button',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildButton(
              context,
              'Snackbar with Action',
              Colors.purple,
              () {
                UpperSnackbar().showSuccess(
                  context,
                  message: 'File deleted successfully',
                  actionLabel: 'UNDO',
                  onActionPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Undo pressed!')),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Different Positions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildButton(
              context,
              'Top Center (Default)',
              Colors.indigo,
              () {
                UpperSnackbar().showInfo(
                  context,
                  message: 'This is centered at the top',
                  position: SnackbarPosition.top,
                );
              },
            ),
            const SizedBox(height: 8),
            _buildButton(
              context,
              'Top Left',
              Colors.teal,
              () {
                UpperSnackbar().showInfo(
                  context,
                  message: 'Top left position',
                  position: SnackbarPosition.topLeft,
                );
              },
            ),
            const SizedBox(height: 8),
            _buildButton(
              context,
              'Top Right',
              Colors.cyan,
              () {
                UpperSnackbar().showInfo(
                  context,
                  message: 'Top right position',
                  position: SnackbarPosition.topRight,
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Custom Styles',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildButton(
              context,
              'Custom Colors',
              Colors.pink,
              () {
                UpperSnackbar().show(
                  context,
                  message: 'Custom pink snackbar',
                  type: SnackbarType.custom,
                  style: const SnackbarStyle(
                    backgroundColor: Colors.pink,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    icon: Icons.favorite,
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            _buildButton(
              context,
              'With Border',
              Colors.deepOrange,
              () {
                UpperSnackbar().show(
                  context,
                  message: 'Snackbar with custom border',
                  type: SnackbarType.custom,
                  style: SnackbarStyle(
                    backgroundColor: Colors.white,
                    textColor: Colors.deepOrange,
                    iconColor: Colors.deepOrange,
                    icon: Icons.notifications_active,
                    border: Border.all(color: Colors.deepOrange, width: 2),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            _buildButton(
              context,
              'Gradient Background',
              Colors.purple,
              () {
                UpperSnackbar().show(
                  context,
                  message: 'Beautiful gradient background!',
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
              },
            ),
            const SizedBox(height: 8),
            _buildButton(
              context,
              'Rounded Corners',
              Colors.amber,
              () {
                UpperSnackbar().show(
                  context,
                  message: 'Extra rounded corners',
                  type: SnackbarType.warning,
                  style: const SnackbarStyle(
                    borderRadius: 30.0,
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            _buildButton(
              context,
              'Without Close Icon',
              Colors.brown,
              () {
                UpperSnackbar().showInfo(
                  context,
                  message: 'This one has no close icon',
                  showCloseIcon: false,
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Duration & Animation',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildButton(
              context,
              'Long Duration (5s)',
              Colors.green,
              () {
                UpperSnackbar().showSuccess(
                  context,
                  message: 'This will stay for 5 seconds',
                  duration: 5,
                );
              },
            ),
            const SizedBox(height: 8),
            _buildButton(
              context,
              'Short Duration (1s)',
              Colors.red,
              () {
                UpperSnackbar().showError(
                  context,
                  message: 'Quick message!',
                  duration: 1,
                );
              },
            ),
            const SizedBox(height: 8),
            _buildButton(
              context,
              'Slow Animation',
              Colors.blue,
              () {
                UpperSnackbar().show(
                  context,
                  message: 'Slow and smooth animation',
                  type: SnackbarType.info,
                  animationDuration: 800,
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Advanced Features',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildButton(
              context,
              'Non-dismissible',
              Colors.red.shade900,
              () {
                UpperSnackbar().show(
                  context,
                  message: 'Tap me won\'t dismiss (wait for timer)',
                  type: SnackbarType.error,
                  dismissible: false,
                  duration: 3,
                );
              },
            ),
            const SizedBox(height: 8),
            _buildButton(
              context,
              'With Tap Callback',
              Colors.deepPurple,
              () {
                UpperSnackbar().showInfo(
                  context,
                  message: 'Tap me to see a message!',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Snackbar was tapped!')),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 8),
            _buildButton(
              context,
              'Long Text Example',
              Colors.blueGrey,
              () {
                UpperSnackbar().showWarning(
                  context,
                  message:
                      'This is a very long message that demonstrates how the snackbar handles multi-line text content gracefully.',
                  duration: 5,
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String text,
    Color color,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
