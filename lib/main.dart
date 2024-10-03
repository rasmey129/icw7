import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FadingTextAnimation(),
    );
  }
}

class FadingTextAnimation extends StatefulWidget {
  @override
  _FadingTextAnimationState createState() => _FadingTextAnimationState();
}

class _FadingTextAnimationState extends State<FadingTextAnimation> {
  bool _isVisible = true; 
  bool _showFrame = false; 

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fading Text and Image Frame '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: toggleVisibility, 
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: const Text(
                  'Hello, Flutter!',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Container(
              decoration: _showFrame? BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 8), 
                      borderRadius: BorderRadius.circular(23), 
                    )
                  : null, 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16), 
                child: Image.network(
                  'https://cdn-7.motorsport.com/images/amp/YKEZbVX0/s1000/ferrari-499p-1.jpg', 
                  width: 200,   
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          SwitchListTile( //essentially the same thing as SwitchMe but built into flutter
              title: const Text('Show Frame'),
              value: _showFrame, 
              onChanged: (bool value) {
                setState(() {
                  _showFrame = value;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
