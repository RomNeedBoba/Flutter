import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  double? _temperature; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.thermostat, size: 64, color: Colors.blue),
            SizedBox(height: 16),
            Text('Converter', style: TextStyle(fontSize: 18)),
            SizedBox(height: 32),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enter Temperature in Celsius:'),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'e.g., 25',
                      errorText: _temperature == null ? null : _validateInput(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _temperature = double.tryParse(value);
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    _temperature == null
                        ? 'Enter a valid temperature'
                        : 'Temperature in Fahrenheit: ${(_temperature! * 9 / 5) + 32}',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _validateInput() {
    if (_temperature == null) {
      return 'Invalid number';
    }
    return null;
  }
}
