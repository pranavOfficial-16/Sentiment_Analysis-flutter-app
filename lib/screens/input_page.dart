import 'package:flutter/material.dart';
import 'package:sentiment_analysis/constants.dart';
import 'package:http/http.dart' as http;
import '../components/result_print.dart';
import 'dart:convert';

String? inputText;
bool check = false;
dynamic dataJSON;

class InputPage extends StatefulWidget {
  static const String id = 'input_screen';
  InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final inputController = TextEditingController();
  bool? validate;

  void _submit() async {
    check = true;
    // call REST service and extract JSON body
    var host = 'https://sentiment-analysis-rest-api.herokuapp.com/predict/';
    inputText ??= '';
    var response = await http.get(Uri.parse(host + inputText!.trim()));
    var resp = response.body;
    dataJSON = await jsonDecode(resp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Hero(
            tag: title,
            child: Material(
              type: MaterialType.transparency,
              child: Text(
                title,
                style: myFont,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              const Text(
                'NLP Sentiment Analyzer',
                style: headFont,
                textAlign: TextAlign.start,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                child: TextFormField(
                  controller: inputController,
                  maxLines: null,
                  onChanged: (value) {
                    inputText = value;
                  },
                  style: const TextStyle(
                    fontFamily: 'ComicNeue',
                    fontSize: 20,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    errorText: validate == true ? 'Field is empty' : null,
                    errorStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'ComicNeue',
                    ),
                    labelText: 'Enter text to analyze',
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'ComicNeue',
                      color: Colors.white,
                    ),
                    fillColor: nextmainColor,
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                    inputController.text.trim().isEmpty
                        ? validate = true
                        : validate = false;
                    _submit();
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 2,
                  ),
                  child: Text(
                    'Submit',
                    style: buttonFont,
                  ),
                ),
              ),
              check && validate == false
                  ? Result_print()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'images/thinking.jpg',
                          fit: BoxFit.fill,
                          height: 400,
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
