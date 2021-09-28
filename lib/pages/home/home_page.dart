import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vocascan_mobile/api/schemas/endpoint_language_package.dart';
import 'package:vocascan_mobile/constants/colors.dart';
import 'package:vocascan_mobile/pages/widgets/add_vocabulary.dart';
import 'package:vocascan_mobile/services/api_client.dart';
import 'package:vocascan_mobile/services/storage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StorageService _storageService = StorageService.getInstance();
  ApiClientService _apiClientService = ApiClientService.getInstance();

  String _email = "";
  String _username = "";

  @override
  initState() {
    super.initState();

    setState(() {
      _initState();
    });
  }

  _initState() async {
    _email = (await _storageService.get("email"))!;
    _username = (await _storageService.get("username"))!;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<List<EndpointLanguagePackage>?> _endpointLanguagePackage = _apiClientService
        .endpointGet<List<EndpointLanguagePackage>>("languagePackage");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        leading: Icon(Icons.menu),
      ),
      body: FutureBuilder(future: _endpointLanguagePackage,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done) {

          }

          if(!snapshot.hasData){
            return Center(child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    height: size.height * 0.25,
                    width: size.height * 0.25,
                    child: SvgPicture.asset(
                      "assets/images/illustrations/undraw_empty.svg",
                    )
                ),

              ],)
            );
          }

          return Center(child: CircularProgressIndicator(
            strokeWidth: 5,
            backgroundColor: primary,
            color: PrimaryLightColor,
          ));
        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AddVocabularyPopup(),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: primary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              accountEmail: Text(
                _email,
                style: TextStyle(color: Colors.black),
              ),
              accountName: Text(
                _username,
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                    )),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(tr("settings")),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
