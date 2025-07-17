import 'package:flutter/material.dart';
void main() {
  runApp(const CrossFadeDemoApp());
}

class CrossFadeDemoApp extends StatelessWidget {
  const CrossFadeDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimatedCrossFade Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CrossFadeDemoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CrossFadeDemoPage extends StatefulWidget {
  const CrossFadeDemoPage({Key? key}) : super(key: key);

  @override
  State<CrossFadeDemoPage> createState() => _CrossFadeDemoPageState();
}

class _CrossFadeDemoPageState extends State<CrossFadeDemoPage> {
  bool _showFirst = true;

  // Example image URLs (replace with your own if desired)
  final String _firstImage = 'https://images.unsplash.com/photo-1518717758536-85ae29035b6d?auto=format&fit=crop&w=400&q=80'; // Dog
  final String _secondImage = 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg'; // Cat

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double imageWidth = screenWidth * 0.8;
    final double imageHeight = imageWidth * 2 / 3;

    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedCrossFade Demo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              const Text(
                'AnimatedCrossFade',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              // AnimatedCrossFade widget demo
              AnimatedCrossFade(
                firstChild: Image.network(_firstImage, key: const ValueKey('dog'), width: imageWidth, height: imageHeight, fit: BoxFit.cover),
                secondChild: Image.network(_secondImage, key: const ValueKey('cat'), width: imageWidth, height: imageHeight, fit: BoxFit.cover),
                crossFadeState: _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond, // Attribute 1
                duration: const Duration(seconds: 1), // Attribute 2
                alignment: Alignment.center, // Attribute 3
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showFirst = !_showFirst;
                  });
                },
                child: Text(_showFirst ? 'Show Cat' : 'Show Dog'),
              ),
              const SizedBox(height: 16),
              // Attribute notes for presentation
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Demo Attributes:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('1. duration: Controls animation speed (default: 200ms, here: 1s)'),
                    Text('2. crossFadeState: Which child is shown (showFirst/showSecond)'),
                    Text('3. alignment: How children are aligned (default: topCenter, here: center)'),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
