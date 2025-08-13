hereimport 'package:flutter/material.dart';

void main() {
  runApp(const ApplicationForVisitApp());
}

class ApplicationForVisitApp extends StatelessWidget {
  const ApplicationForVisitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application for Visit',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const VisaApplicationForm(),
    );
  }
}

class VisaApplicationForm extends StatefulWidget {
  const VisaApplicationForm({super.key});

  @override
  State<VisaApplicationForm> createState() => _VisaApplicationFormState();
}

class _VisaApplicationFormState extends State<VisaApplicationForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String passportNumber = '';
  String country = '';
  String purpose = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Visa Application Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter your name' : null,
                onSaved: (value) => name = value!,
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Passport Number'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter your passport number'
                    : null,
                onSaved: (value) => passportNumber = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Country'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter country' : null,
                onSaved: (value) => country = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Purpose'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter purpose' : null,
                onSaved: (value) => purpose = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Successfully submitted!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
