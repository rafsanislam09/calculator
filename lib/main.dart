import 'package:flutter/material.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
    const CalculatorApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Flutter Calculator',
        theme: ThemeData(
            primarySwatch: Colors.blue,
        ),
        home: const CalculatorHomePage(),
        );
    }
}

class CalculatorHomePage extends StatefulWidget {
    const CalculatorHomePage({super.key});

    @override
    CalculatorHomePageState createState() => CalculatorHomePageState();
}

class CalculatorHomePageState extends State<CalculatorHomePage> {
    String output = "0";
    String _output = "0";
    double num1 = 0.0;
    double num2 = 0.0;
    String operand = "";
    String expression = "";

    void buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
        _output = "0";
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
        expression = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X") {
        if (operand.isEmpty) {
            num1 = double.parse(_output);
            operand = buttonText;
            _output = "0";
            expression += buttonText;
        }
    } else if (buttonText == ".") {
        if (_output.contains(".")) {
            return;
        } else {
            _output = _output + buttonText;
            expression += buttonText;
        }
    } else if (buttonText == "=") {
        num2 = double.parse(_output);
        if (operand == "+") {
            _output = (num1 + num2).toString();
        }
        if (operand == "-") {
            _output = (num1 - num2).toString();
        }
        if (operand == "X") {
            _output = (num1 * num2).toString();
        }
        if (operand == "/") {
            _output = (num1 / num2).toString();
        }
        expression += " = $_output";
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
    } else {
        if (_output == "0") {
            _output = buttonText;
        } else {
            _output = _output + buttonText;
        }
        expression += buttonText;
    }

    setState(() {
        output = _output;
    });
  }

    Widget buildButton(String buttonText) {
        return Expanded(
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(24.0),
            ),
            child: Text(
            buttonText,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () => buttonPressed(buttonText),
        ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text('Calculator'),
        ),
        body: Column(
            children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0,
                ),
                child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Text(
                    expression,
                    style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    ),
                ),
                ),
            ),
            const Divider(),
            Expanded(
                child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 12.0,
                ),
                child: Text(
                    output,
                    style: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    ),
                ),
                ),
            ),
            Column(
                children: [
                Row(
                    children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/"),
                    ],
                ),
                Row(
                    children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("X"),
                    ],
                ),
                Row(
                    children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),
                    ],
                ),
                Row(
                    children: [
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+"),
                    ],
                ),
                Row(
                    children: [
                    buildButton("CLEAR"),
                    buildButton("="),
                    ],
                )
                ],
            )
            ],
        ),
        );
    }
}
