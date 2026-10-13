import 'dart:math';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Play Dice',
      debugShowCheckedModeBanner: false,

      
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
      ),
      home: const PlayDice(),
    );
  }
}


class PlayDice extends StatefulWidget {
  const PlayDice({super.key});

  @override
  State<PlayDice> createState() => _PlayDiceState();
}

class _PlayDiceState extends State<PlayDice> {
 
  int value1 = 1;
  int value2 = 1;
  int total = 2;

 
  void roll() {
    
    setState(() {
      
      value1 = Random().nextInt(6) + 1;
      value2 = Random().nextInt(6) + 1;
      total = value1 + value2;
    });
  }

  // ---------- Logic: Reset Dice ----------
  void reset() {
    setState(() {
      value1 = 1;
      value2 = 1;
      total = 2;
    });
  }

  // ---------- UI Construction ----------
  @override
  Widget build(BuildContext context) {
    
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('🎲 Play Dice'),
        centerTitle: true,
        backgroundColor: colorScheme.surfaceContainerHighest,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: Main_axisAlignment_center,
            mainAxisSize: MainAxisSize.min,
            children: [
              
              Text(
                'Total is $total',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
              ),

              const SizedBox(height: 32),

             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _DiceCard(value: value1, colorScheme: colorScheme),
                  _DiceCard(value: value2, colorScheme: colorScheme),
                ],
              ),

              const SizedBox(height: 40),

              
              Row(
                children: [
                  
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: roll,
                      icon: const Icon(Icons.casino),
                      label: const Text('Roll'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: reset,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Reset'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _DiceCard extends StatelessWidget {
  final int value;
  final ColorScheme colorScheme;

  const _DiceCard({required this.value, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outlineVariant, width: 2),
      ),
      child: Text(
        '$value',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}


const MainAxisAlignment Main_axisAlignment_center = MainAxisAlignment.center;

