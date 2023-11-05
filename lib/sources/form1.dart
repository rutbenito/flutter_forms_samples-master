import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Formulari1 extends StatefulWidget {
  const Formulari1({Key? key}) : super(key: key);

  @override
  State<Formulari1> createState() {
    return _Formulari1State();
  }
}

class _Formulari1State extends State<Formulari1> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _speedHasError = false;

  var speedOptions = ['10km/h', '20km/h', '30km/h'];

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FormBuilder(
            key: _formKey,
            // enabled: false,
            onChanged: () {
              _formKey.currentState!.save();
              debugPrint(_formKey.currentState!.value.toString());
            },
            autovalidateMode: AutovalidateMode.disabled,
            initialValue: const {
              'speed_rdb': 'above 40km/h',
              'remarks': '',
              'speed_cb': '10km/h',
            },
            skipDisabled: true,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 15),
                FormBuilderRadioGroup<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Please provide the speed of vehicle',
                  ),
                  initialValue: null,
                  orientation: OptionsOrientation.vertical,
                  name: 'speed_rdb',
                  onChanged: _onChanged,
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                  options: ['above 40km/h', 'below 40km/h', '0km/h']
                      .map((lang) => FormBuilderFieldOption(
                            value: lang,
                            child: Text(lang),
                          ))
                      .toList(growable: false),
                  controlAffinity: ControlAffinity.leading,
                ),
                SizedBox(height: 20),
                FormBuilderTextField(
                  name: 'remarks',
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Enter remarks'),
                  // valueTransformer: (text) => num.tryParse(text),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.max(70),
                  ]),
                  // initialValue: '12',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 20),
                FormBuilderDropdown<String>(
                  name: 'speed_cb',
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Please provide the speed of vehicle',
                    suffix: _speedHasError
                        ? const Icon(Icons.error)
                        : const Icon(Icons.check),
                    hintText: 'Select speed',
                  ),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                  items: speedOptions
                      .map((speed) => DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: speed,
                            child: Text(speed),
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _speedHasError = !(_formKey.currentState?.fields['speed']
                              ?.validate() ??
                          false);
                    });
                  },
                  valueTransformer: (val) => val?.toString(),
                ),
                SizedBox(height: 20),
                FormBuilderCheckboxGroup<String>(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:
                          'Please provide the speed of vehicle past 1 hour'),
                  name: 'speed_chb',
                  //initialValue: const ['20km/h'],
                  orientation: OptionsOrientation.vertical,
                  options: const [
                    FormBuilderFieldOption(value: '20km/h'),
                    FormBuilderFieldOption(value: '30km/h'),
                    FormBuilderFieldOption(value: '40km/h'),
                    FormBuilderFieldOption(value: '50km/h'),
                  ],
                  onChanged: _onChanged,
                  separator: const VerticalDivider(
                    width: 10,
                    thickness: 5,
                    color: Colors.red,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.minLength(1),
                    FormBuilderValidators.maxLength(3),
                  ]),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      debugPrint(_formKey.currentState?.value.toString());
                    } else {
                      debugPrint(_formKey.currentState?.value.toString());
                      debugPrint('validation failed');
                    }
                  },
                  child: const Text('Submit',
                      style: TextStyle(
                        color: Color.fromARGB(255, 20, 20, 20),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: OutlinedButton(
                onPressed: () {
                  _formKey.currentState?.reset();
                },
                child: Text(
                  'Reset',
                  style: TextStyle(
                    color: Color.fromARGB(255, 20, 20, 20),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
