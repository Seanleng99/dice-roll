import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(DiceRoll());
}

class DiceRoll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Dice Roll!',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _imageArray = const [
    'dice1.png',
    'dice2.png',
    'dice3.png',
    'dice4.png',
    'dice5.png',
    'dice6.png'
  ];
  var _randomIntForDiceOne = Random().nextInt(6);
  var _randomIntForDiceTwo = Random().nextInt(6);

  AudioCache _audioCache;

  @override
  void initState() {
    _audioCache = AudioCache(
        prefix: 'audio/',
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.RELEASE));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Roll the Dice!',
          style: TextStyle(fontFamily: 'Lobster'),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 50, 25, 50),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Image.asset(
                  'images/diceeLogo.png',
                  height: 125,
                  width: 125,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(
                  'The sum is ' +
                      (_randomIntForDiceOne + _randomIntForDiceTwo + 2)
                          .toString(),
                  style: TextStyle(
                    fontFamily: 'Lobster',
                    fontSize: 20,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset(
                    'images/' + _imageArray[_randomIntForDiceOne],
                    height: 120,
                    width: 120,
                  ),
                  Image.asset(
                    'images/' + _imageArray[_randomIntForDiceTwo],
                    height: 120,
                    width: 120,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: RaisedButton(
                  onPressed: rollDice,
                  child: Text(
                    'Let\'s Roll!',
                    style: TextStyle(fontFamily: 'Lobster'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void rollDice() {
    setState(() {
      _randomIntForDiceOne = Random().nextInt(6);
      _randomIntForDiceTwo = Random().nextInt(6);
      _audioCache
          .play('audio/Shake And Roll Dice-SoundBible.com-591494296.mp3');
    });
  }
}
