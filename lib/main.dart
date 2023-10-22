import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Palette Generator',
      home: ColorPaletteGenerator(),
    );
  }
}

class ColorPaletteGenerator extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ColorPaletteGeneratorState createState() => _ColorPaletteGeneratorState();
}

class _ColorPaletteGeneratorState extends State<ColorPaletteGenerator> {
  RandomColor _randomColor = RandomColor();
  List<Color> _colors = [];

  void _generatePalette() {
    List<Color> newPalette = [];
    for (int i = 0; i < 5; i++) {
      newPalette.add(_randomColor.randomColor());
    }
    setState(() {
      _colors = newPalette;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Palette Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _generatePalette,
              // color: Colors.blue,
              // textColor: Colors.white,
              // padding: EdgeInsets.all(16.0),
              child: Text(
                'Generate Palette',
                style: TextStyle(
                  color: Colors.white,
                  // color: Colors.blue,
                ),
                ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _colors
                  .map((color) => Container(
                        width: 50,
                        height: 50,
                        color: color,
                      ))
                  .toList(),
            ),
          ],
        ),
     ),
     );
  }
}
