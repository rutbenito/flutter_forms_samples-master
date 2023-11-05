import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
//import 'package:flutter_fast_forms_example/form_array_item.dart';

//import 'custom_form_field.dart';

class Formulari4 extends StatelessWidget {
  const Formulari4({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Fast Form 2';

    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
        return CupertinoApp(
          title: title,
          home: FormPage(title: title),
        );

      case TargetPlatform.android:
      default:
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
                        borderSide:
                            BorderSide(color: Colors.grey[700]!, width: 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.red[500]!, width: 2),
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
          FastChoiceChips(
            name: 'choice_chips',
            labelText: 'Escollir llenguatge',
            alignment: WrapAlignment.center,
            chipPadding: const EdgeInsets.all(8.0),
            chips: [
              FastChoiceChip(
                avatar: const FlutterLogo(),
                selected: true,
                value: 'Flutter',
              ),
              FastChoiceChip(
                avatar: const Icon(Icons.android_sharp, size: 16.0),
                value: 'Android',
              ),
              FastChoiceChip(
                selected: true,
                value: 'Chrome OS',
              ),
            ],
            validator: (value) => value == null || value.isEmpty
                ? 'Siusplau, seleccioni tan sols una opció'
                : null,
          ),
  const FastSwitch(
            name: 'switch',
            labelText: 'Switch',
            titleText: 'Això és un switch',
            contentPadding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
          ),
          FastTextField(
            name: 'text_field',
            labelText: 'Data',
            placeholder: 'MM/YYYY',
            keyboardType: TextInputType.datetime,
            maxLength: 7,
            prefix: const Icon(Icons.calendar_today),
            buildCounter: inputCounterWidgetBuilder,
            inputFormatters: const [],
            validator: Validators.compose([
              Validators.required((value) => 'Field is required'),
              Validators.minLength(
                  7,
                  (value, minLength) =>
                      'El camp ha de tenir almenys $minLength caràcters')
            ]),
          ),
         const FastDropdown<String>(
            name: 'dropdown',
            labelText: 'Camp dropdown',
            items: ['Vilassar de Mar', 'Cabrera', 'Mataró', 'Llavaneres'],
            initialValue: 'Cabrera',
          ),
          FastRadioGroup<String>(
            name: 'radio_group',
            labelText: 'Model radiogrup',
            options: const [
              FastRadioOption(title: Text('Opció 1'), value: 'option-1'),
              FastRadioOption(title: Text('Opció 2'), value: 'option-2'),
              FastRadioOption(title: Text('Opció 3'), value: 'option-3'),
            ],
          ),
        ],
      ),
    ];
  }

}