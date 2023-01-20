import 'package:flutter/material.dart';
import 'package:number_mask/number_mask.dart';

/// This is an example of how to use the number_mask package.
/// The fields in the form are masked using the NumberMask input formatter,
/// which is provided a user-defined [pattern] as a named parameter.
/// The [pattern] is a string that contains the characters to be displayed
/// and the characters to be masked - which are denoted with (#).
/// Example: (###) ###-#### Ext. ###
///
/// The following is a basic example of how to use the NumberMask input formatter:
/// TextFormField(
///   inputFormatters: [
///     NumberMask(pattern: '(###) ###-#### Ext. ###'),
///   ],
/// )

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NumberMask Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('NumberMask Demo'),
        ),
        body: const ExampleForm(),
      ),
    );
  }
}

class ExampleForm extends StatefulWidget {
  const ExampleForm({super.key});

  @override
  State<ExampleForm> createState() => _ExampleFormState();
}

class _ExampleFormState extends State<ExampleForm> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _ssnController = TextEditingController();
  final _creditCardController = TextEditingController();
  final _dateController = TextEditingController();
  final _zipController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set initial values for the text fields.
    //! Setting values in the controller will not trigger the input formatters.
    _phoneController.text = '(123) 456-7890 Ext. 123';
    _ssnController.text = '123-45-6789';
    _creditCardController.text = '1234 5678 9012 3456 - 789';
    _dateController.text = '01/19/2023';
    _zipController.text = '12345-6789';
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _ssnController.dispose();
    _creditCardController.dispose();
    _dateController.dispose();
    _zipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Define the patterns for the text fields.
    // The pattern is a string that contains the characters to be displayed
    // and the characters to be masked, which are denoted with (#).
    var phonePattern = '(###) ###-#### Ext. ###';
    var ssnPattern = '###-##-####';
    var creditCardPattern = '#### #### #### #### - ###';
    var datePattern = '##/##/####';
    var zipPattern = '#####-####';

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: phonePattern,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [NumberMask(pattern: phonePattern)],
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _ssnController,
                decoration: InputDecoration(
                  labelText: 'Social Security Number',
                  hintText: ssnPattern,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [NumberMask(pattern: ssnPattern)],
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _creditCardController,
                decoration: InputDecoration(
                  labelText: 'Credit Card',
                  hintText: creditCardPattern,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [NumberMask(pattern: creditCardPattern)],
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  hintText: datePattern,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [NumberMask(pattern: datePattern)],
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _zipController,
                decoration: InputDecoration(
                  labelText: 'Zip Code',
                  hintText: zipPattern,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [NumberMask(pattern: zipPattern)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
