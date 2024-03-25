import 'package:app_overlay/app_overlay.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Overlay',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AppOverlay.init(
        defaultLoadingDecoration: LoadingDecoration(
          size: 60,
          primaryColor: Theme.of(context).colorScheme.primary,
          secondaryColor: Colors.transparent,
          lapDuration: 1000,
          strokeWidth: 12,
        ),
        backgroundColor: Colors.white,
        child: const MyHomePage(title: 'App Overlay Example'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'App Overlay Example App',
            ),
            ElevatedButton(
              onPressed: () {
                AppOverlay.show(
                  type: AppOverlayType.loading,
                  footer: ElevatedButton(onPressed: () {
                    AppOverlay.hide();
                  }, child: const Text('Hide')),
                );
              },
              child: const Text('Show loading widget'),
            ),
            ElevatedButton(
              onPressed: () {
                AppOverlay.show(
                  type: AppOverlayType.custom,
                  customWidget: AlertDialog(
                    title: const Text('Custom Widget'),
                    content: const Text('This is a custom widget.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          AppOverlay.hide();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Show dialog without context'),
            ),
          ],
        ),
      ),
    );
  }
}
