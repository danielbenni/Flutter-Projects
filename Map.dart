// main.dart
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  bool isOffline = false;

  @override
  void initState() {
    super.initState();
    // Check connectivity when the app starts
    checkConnectivity();
    // Listen for connectivity changes
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        isOffline = result == ConnectivityResult.none;
      });
    });
  }

  // Check current connectivity status
  Future<void> checkConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    setState(() {
      isOffline = result == ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        title: const Text('Maps'),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 20),
          Icon(Icons.mic),
          SizedBox(width: 20),
          Icon(Icons.qr_code_scanner)
        ],
        bottom: isOffline ? buildOfflineBanner() : null,
      ),
    );
  }

  // Helper method to create the offline banner
  PreferredSize buildOfflineBanner() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(20),
      child: Container(
        color: Colors.black,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: const Center(
          child: Text(
            'No network connection is detected please ensure your network connection',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
