import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
//import 'package:flutter_fast_forms_example/form_array_item.dart';
//import 'custom_form_field.dart';

class Formulari3 extends StatelessWidget {
  const Formulari3({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Fast Form';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: const Color.fromARGB(255, 110, 56, 142),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color.fromARGB(255, 110, 56, 142),
      ),
      home: FormPage(title: title),
    );
  }
}

class FormPage extends StatelessWidget {
  FormPage({super.key, required this.title});

  final formKey = GlobalKey<FormState>();
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 4.0,
        shadowColor: theme.shadowColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FastForm(
                formKey: formKey,
                inputDecorationTheme: InputDecorationTheme(
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[700]!, width: 1),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red[500]!, width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                children: _buildForm(context),
                onChanged: (value) {
                  // ignore: avoid_print
                  print('Form changed: ${value.toString()}');
                },
              ),
              ElevatedButton(
                child: const Text('Reset'),
                onPressed: () => formKey.currentState?.reset(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildForm(BuildContext context) {
    return [
      FastFormSection(
        padding: const EdgeInsets.all(16.0),
        header: const Padding(
          padding: EdgeInsets.all(12.0),
        ),
        children: [
          FastAutocomplete<String>(
            name: 'autocomplete',
            labelText: 'Autocompletar ciutat',
            options: const ['Barcelona', 'Badalona', 'Masnou', 'Premià de Mar'],
          ),
          FastDatePicker(
            name: 'date_picker',
            labelText: 'Escollir data',
            firstDate: DateTime(1970),
            lastDate: DateTime(2040),
          ),
          FastDateRangePicker(
            name: 'date_range_picker',
            labelText: 'Escollir període de temps',
            firstDate: DateTime(1970),
            lastDate: DateTime(2040),
          ),
          const FastTimePicker(
            name: 'time_picker',
            labelText: 'Escollir hora',
          ),
          const FastChipsInput(
            name: 'input_chips',
            labelText: 'Llenguatges',
            contentPadding: const EdgeInsets.all(16.0),
            initialValue: [
              'HTML',
              'CSS',
              'React',
              'Dart',
              'TypeScript',
              'Angular',
              'Flutter'
            ],
          ),
        ],
      ),
    ];
  }
}
