import 'package:flutter/material.dart';
import 'package:multilanguagetest/language/Translations.dart';
import 'package:multilanguagetest/provider/AppModel.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  String lng;
  List<String> languages;

  @override
  void initState() {
    super.initState();
  }

  var style=TextStyle(
      fontFamily: 'Cairo',
      fontSize: 13.0,
      color: Colors.black,
      fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (context, model, _) {
      return Material(
          child: Scaffold(
            backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).wel_com),
        ),
        drawer: Container(
          color: Colors.green,
            margin: EdgeInsets.all(10),
            child: Drawer(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 5,
                    color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                        ),
                        Icon(
                          Icons.person_outline,
                          color: Colors.white,
                        ),
                        Text(AppLocalizations.of(context).wel_com,style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 13.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Padding(
                    child: Text(AppLocalizations.of(context).wel_com,style: style,),
                    padding: EdgeInsets.all(10),
                  ),
                  Divider(color: Colors.black12,thickness:0.3,),
                  Padding(
                    child: Text(AppLocalizations.of(context).wel_com,style: style,),
                    padding: EdgeInsets.all(10),
                  ),
                  Divider(color: Colors.black12,thickness:0.3,),
                  Padding(
                    child: Text(AppLocalizations.of(context).wel_com,style: style,),
                    padding: EdgeInsets.all(10),
                  ),
                  Divider(color: Colors.black12,thickness:0.3,),
                  Padding(
                    child: Text(AppLocalizations.of(context).wel_com,style: style,),
                    padding: EdgeInsets.all(10),
                  ),
                  Divider(color: Colors.black12,thickness:0.3,),
                  Padding(
                    child: Text(AppLocalizations.of(context).wel_com,style: style,),
                    padding: EdgeInsets.all(10),
                  ),
                  Divider(color: Colors.black12,thickness:0.3,),
                  getDropDownList(model),
                ],
              ),
            )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Text(AppLocalizations.of(context).wel_com,style: style,),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ));
    });
  }

  Widget getDropDownList(AppModel model) {
    List<String> languages = [
      AppLocalizations.of(context).arabic,
      AppLocalizations.of(context).english,
    ];
    return Container(
        padding: EdgeInsets.all(10),
        child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
          items: languages
              .map((user) => DropdownMenuItem<String>(
                    child: Text(user,style: style,),
                    value: user,
                  ))
              .toList(),
          onChanged: (String value) {
            setState(() {
              if (value == AppLocalizations.of(context).arabic) {
                lng = value;
                model.chngLng('ar', context);
              } else {
                lng = value;
                model.chngLng('en', context);
              }
            });
          },
          value: lng,
          isExpanded: false,
          hint: Text(AppLocalizations.of(context).select_language,
              style: style),
        )));
  }
}
