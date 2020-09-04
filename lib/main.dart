import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multilanguagetest/MainPage.dart';
import 'package:multilanguagetest/language/Translations.dart';
import 'package:multilanguagetest/provider/AppModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider.value(
        value: AppModel(),
        child: Consumer<AppModel>(builder: (context, model, child) {
          return new MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Multi-Language Test',
                theme: ThemeData(
                  primarySwatch: Colors.green,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                routes: <String, WidgetBuilder>{
                  'main_page': (BuildContext context) => MainPage(),
                },
                locale: new Locale(Provider.of<AppModel>(context).locale, ''),
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate
                ],
                supportedLocales: AppLocalizations.delegate.supportedLocales,
                home: MainPage(
              ));
        }));
  }
}
