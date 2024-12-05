import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final BoxDecoration _inputBoxStyle = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  );

  final TextEditingController _inputController = TextEditingController();
  String? _chosenCurrency;
  double _result = 0.0;

  final Map<String, double> _exchangeRates = {
    'Euro': 0.85,
    'Riel': 4100.0,
    'Dong': 23000.0,
  };

  @override
  void initState() {
    super.initState();
    _chosenCurrency = _exchangeRates.keys.first; 
  }

  void _calculateConversion() {
    final double enteredAmount = double.tryParse(_inputController.text) ?? 0.0;
    setState(() {
      _result = enteredAmount * (_exchangeRates[_chosenCurrency] ?? 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.attach_money,
                size: 70,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              const Text(
                "Currency Converter",
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              const SizedBox(height: 40),
              const Text(
                "Enter Amount in USD:",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _inputController,
                decoration: InputDecoration(
                  prefixText: '\$ ',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.lightGreenAccent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'e.g., 100',
                  hintStyle: const TextStyle(color: Colors.white70),
                ),
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                onChanged: (_) => _calculateConversion(),
              ),
              const SizedBox(height: 30),
              const Text(
                "Select Currency:",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: _chosenCurrency,
                dropdownColor: Colors.orangeAccent,
                items: _exchangeRates.keys.map((String currency) {
                  return DropdownMenuItem<String>(
                    value: currency,
                    child: Text(currency, style: const TextStyle(color: Colors.black)),
                  );
                }).toList(),
                onChanged: (String? newCurrency) {
                  setState(() {
                    _chosenCurrency = newCurrency;
                    _calculateConversion();
                  });
                },
              ),
              const SizedBox(height: 30),
              const Text(
                "Converted Amount:",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: _inputBoxStyle,
                child: Text(
                  _result.toStringAsFixed(2),
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
