import 'sources/form1.dart';
import 'sources/form2.dart';
import 'package:example/sources/form3.dart';
import 'sources/form4.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'code_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter FormBuilder Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        FormBuilderLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: FormBuilderLocalizations.supportedLocales,
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CodePage(
      title: 'Flutter Form Builder: Rut Benito',
      child: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Formulari 1'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CodePage(
                      title: 'Formulari 1',
                      child: Formulari1(),
                    );
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Formulari 2'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CodePage(
                      title: 'Formulari 2',
                      child: Formulari2(),
                    );
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Formulari 3'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CodePage(
                      title: 'Formulari 3',
                      child: Formulari3(),
                    );
                  },
                ),
              );
            },
          ),
         
          const Divider(),
          ListTile(
            title: const Text('Formulari 4'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CodePage(
                      title: 'Formulari 4',
                      child: Formulari4(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
