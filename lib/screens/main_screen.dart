import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController controller = TextEditingController();
  bool _onMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsappChatter'),
      ),
      body: Column(
        children: <Widget>[
          Text('Number'),
          InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              print(number.phoneNumber);
            },
            onInputValidated: (bool value) {
              print(value);
            },
            selectorConfig: SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: TextStyle(color: Colors.black),
            textFieldController: controller,
            formatInput: false,
            keyboardType:
                TextInputType.numberWithOptions(signed: true, decimal: true),
            inputBorder: OutlineInputBorder(),
            onSaved: (PhoneNumber number) {
              print('On Saved: $number');
            },
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Switch(
                value: _onMessage,
                onChanged: (bool newValue) {
                  setState(() {
                    _onMessage = newValue;
                  });
                },
              ),
              Spacer(),
              Text('Add Message'),
            ],
          ),
          Text('Message'),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
