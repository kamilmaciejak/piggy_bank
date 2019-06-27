import 'dart:math';

import 'package:flutter/material.dart';
import 'package:piggy_bank/screens/widgets/builders.dart';
import 'package:piggy_bank/screens/widgets/custom_raised_button.dart';

class GameScreen extends StatefulWidget {
  static const routeName = '/game';
  static const screenTitle = 'Game';

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final _random = new Random();
  int _total = 100;
  int _result = 50;
  List<int> _results1 = [20, 10, 20];
  List<int> _results2 = [20, 10, 20];
  bool _isPlayStep = true;

  @override
  void initState() {
    super.initState();
  }

  void _increase(int index, value) {
    final newTotal = _results1.reduce((a, b) => a + b) + value;
    final newValue = _results1[index] + value;
    if (newTotal <= _result) {
      setState(() {
        _results1[index] = newValue;
      });
    }
  }

  void _decrease(int index, value) {
    final newValue = _results1[index] - value;
    if (newValue > 0) {
      setState(() {
        _results1[index] = newValue;
      });
    }
  }

  int _next(int max) => 1 + _random.nextInt(max);

  int _count(List<int> list) => list.reduce((a, b) => a + b);

  bool _isEnabled() =>
      !_results1.contains(0) &&
      _count(_results1) == _result &&
      _total - _result >= 3;

  void _play(BuildContext context) {
    final _result2 = _total - _result;
    setState(() {
      _results2[0] = _next(_result2 - 2);
      _results2[1] = _next(_result2 - _results2[0] - 1);
      _results2[2] = _result2 - _results2[0] - _results2[1];

      for (int i = 0; i < _results1.length; i++) {
        if (_results1[i] > _results2[i]) {
          _results1[i] += _results2[i];
          _results2[i] = 0;
        } else if (_results1[i] < _results2[i]) {
          _results2[i] += _results1[i];
          _results1[i] = 0;
        }
      }
      _result = _count(_results1);
      _isPlayStep = false;
    });
  }

  void _continue(BuildContext context) {
    setState(() {
      _isPlayStep = true;
    });
  }

  Column _buildResultView() {
    final children = <Widget>[
      Text(
        'Result: $_result - ${_total - _result}',
        style: TextStyle(fontSize: 34, color: Colors.blue),
      ),
      SizedBox(height: 12),
    ];
    for (int i = 0; i < _results1.length; i++) {
      children.add(
        _buildResultRow(i),
      );
      children.add(SizedBox(height: 4));
    }
    return Column(
      children: children,
    );
  }

  Row _buildResultRow(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 40,
          child: Text(
            '${_results1[index]}',
            style: TextStyle(fontSize: 34, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
        ),
        Column(
          children: [
            CustomRaisedButton(
              onPressed: (context) => _decrease(index, 5),
              text: '-5',
              enabled: _isPlayStep,
              padding: const EdgeInsets.all(24),
              shape: const CircleBorder(),
            ),
            SizedBox(height: 4),
            CustomRaisedButton(
              onPressed: (context) => _decrease(index, 1),
              text: '-1',
              enabled: _isPlayStep,
              padding: const EdgeInsets.all(20),
              shape: const CircleBorder(),
            ),
          ],
        ),
        Column(
          children: [
            CustomRaisedButton(
              onPressed: (context) => _increase(index, 5),
              text: '+5',
              enabled: _isPlayStep,
              padding: const EdgeInsets.all(24),
              shape: const CircleBorder(),
            ),
            SizedBox(height: 4),
            CustomRaisedButton(
              onPressed: (context) => _increase(index, 1),
              text: '+1',
              enabled: _isPlayStep,
              padding: const EdgeInsets.all(20),
              shape: const CircleBorder(),
            ),
          ],
        ),
        SizedBox(
          width: 40,
          child: Text(
            _isPlayStep ? '?' : '${_results2[index]}',
            style: TextStyle(fontSize: 34, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GameScreen.screenTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildResultView(),
              SizedBox(height: 24),
              buildVisibleWidget(
                CustomRaisedButton(
                  onPressed: _play,
                  text: 'Play',
                  enabled: _isEnabled(),
                ),
                _isPlayStep,
              ),
              buildVisibleWidget(
                CustomRaisedButton(
                  onPressed: _continue,
                  text: 'OK',
                ),
                !_isPlayStep,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
