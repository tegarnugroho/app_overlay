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
          size: 180,
          primaryColor: Colors.green,
          secondaryColor: Colors.white,
          lapDuration: 1000,
          strokeWidth: 14,
          insideLoaderWidget: const FlutterLogo(size: 100),
        ),
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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'App Overlay Example App',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.show();
          context.hide(delayInSecond: 2);
          context.show(type: AppOverlayType.success);
        },
        tooltip: 'Show',
        child: const Icon(Icons.shower),
      ),
    );
  }
}
