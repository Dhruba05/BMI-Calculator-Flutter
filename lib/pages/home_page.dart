import 'dart:math';

import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'styled_textList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedGender = 0, _height = 170, _age = 23, _weight = 65;
  double _bmi = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI CALCULATOR"),
      ),
      body: _buildUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _bmi = _weight / pow(_height / 100, 2);
          });
        },
        elevation: 6,
        child: const Icon(
          Icons.calculate,
          size: 40,
        ),
      ),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        _genderSelector(),
        _heighInput(),
        _weightAndAgeInput(),
        _bmiResult(),
        const styled_textList()
      ],
    );
  }

  Widget _genderSelector() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,

        //for row main axis is horizontal left to right
        children: [
          Column(
            children: [
              IconButton(
                iconSize: 60,
                onPressed: () {
                  setState(() {
                    _selectedGender = 0;
                  });
                },
                icon: Icon(
                  Icons.male,
                  color: _selectedGender == 0
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black,
                ),
              ),
              const Text("Male")
            ],
          ),
          Column(
            children: [
              IconButton(
                iconSize: 60,
                onPressed: () {
                  setState(() {
                    _selectedGender = 1;
                  });
                },
                icon: Icon(
                  Icons.female,
                  color: _selectedGender == 1
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black,
                ),
              ),
              const Text("Female")
            ],
          )
        ],
      ),
    );
  }

  Widget _heighInput() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          const Text(
            "Height",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Slider(
              value: _height.toDouble(),
              min: 0.0,
              max: 300.0,
              divisions: 300,
              onChanged: (value) {
                setState(() {
                  _height = value.toInt();
                });
              }),
          Text(
            "$_height cm",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  } //_heighInput func ends

  Widget _weightAndAgeInput() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [_weightInput(), _ageInput()],
    );
  }

  Widget _weightInput() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        children: [
          const Text(
            "Weight",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          ItemCount(
            buttonSizeHeight: 30,
            buttonSizeWidth: 55,
            initialValue: _weight,
            minValue: 60,
            maxValue: 250,
            onChanged: (value) {
              setState(() {
                _weight = value.toInt();
              });
            },
            decimalPlaces: 0,
            textStyle: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }

  Widget _ageInput() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        children: [
          const Text(
            "Age",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          ItemCount(
            buttonSizeHeight: 30,
            buttonSizeWidth: 60,
            initialValue: _age,
            minValue: 1,
            maxValue: 100,
            onChanged: (value) {
              setState(() {
                _age = value.toInt();
              });
            },
            decimalPlaces: 0,
            textStyle: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }

  Widget _bmiResult() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Text(
        "BMI : ${_bmi.toStringAsFixed(1)}",
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
