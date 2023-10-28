
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Color Palette Generator',
      home: ColorPaletteGenerator(),
    );
  }
}

class ColorPaletteGenerator extends StatefulWidget {
  const ColorPaletteGenerator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ColorPaletteGeneratorState createState() => _ColorPaletteGeneratorState();
}

class _ColorPaletteGeneratorState extends State<ColorPaletteGenerator> {
  final RandomColor _randomColor = RandomColor();
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
        title: const Text('Color Palette Generator'),
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _generatePalette,
                // color: Colors.blue,
                // textColor: Colors.white,
                // padding: EdgeInsets.all(16.0),
                child: const Text(
                  'Generate Palette',
                  style: TextStyle(
                    color: Colors.white,
                    // color: Colors.blue,
                  ),
                  ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _colors
                      .map((color) => Container(
                            width: 50,
                            height: 50,
                            color:color,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
     ),
     );
  }
}


