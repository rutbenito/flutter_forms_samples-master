import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class Formulari2 extends StatefulWidget {
  const Formulari2({Key? key}) : super(key: key);

  @override
  State<Formulari2> createState() {
    return _Formulari2State();
  }
}

class _Formulari2State extends State<Formulari2> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  int currentStep = 0;
  bool isCompleted = false;
  TextEditingController adressa = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobil = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController cognom = TextEditingController();

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;
            if (isLastStep) {
              print('Completat');
            } else {
              setState(() => currentStep += 1);
            }
          },
          onStepTapped: (step) => setState(() => currentStep = step),
          onStepCancel:
              currentStep == 0 ? null : () => setState(() => currentStep -= 1),
          controlsBuilder: (context, ControlsDetails controlsDetails) {
            final isLastStep = currentStep == getSteps().length - 1;
            return Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text(isLastStep ? 'Confirmar' : 'Continuar'),
                      onPressed: controlsDetails.onStepContinue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      child: Text('Enrere'),
                      onPressed: controlsDetails.onStepCancel,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text('Dades'),
          content: Container(
            child: Column(children: [
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: adressa,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Adreça',
                ),
                minLines: 3, // Establece el número mínimo de líneas
                maxLines: 15, // Establece el número máximo de líneas
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: mobil,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mòbil',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ]),
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text('Client'),
          content: Container(
            child: Column(children: [
              TextField(
                controller: nom,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nom',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: cognom,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Cognom',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ]),
          ),
        ),
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: Text('Actualitzar'),
          content: const Center(
            child: Text(
              'Actualizat',
              style: TextStyle(
                fontWeight: FontWeight.bold, // Pone el texto en negrita
                fontSize:
                    18, // Ajusta el tamaño del texto según tus necesidades
              ),
            ),
          ),
        )
      ];
}
