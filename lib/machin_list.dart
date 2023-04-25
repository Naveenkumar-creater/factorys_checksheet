import 'package:factory_checksheet/checksheet_page1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class ListPage extends StatefulWidget {
  @override
  State<ListPage> createState() => _ListPage();
}

class _ListPage extends State<ListPage> {


  String _scanBarcode = 'Unknown';

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  List<Map> categories = [
    {"name": "Machine 1"},
    {"name": "Machine 2"},
    {"name": "Machine 3"},
    {"name": "Machine 4"},
    {"name": "Machine 5"},
  ];

  final User user = FirebaseAuth.instance.currentUser!;

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CheckSheet()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CheckSheet()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CheckSheet()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CheckSheet()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CheckSheet()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize( //wrap with PreferredSize
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            title: Row(
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                   CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/User Profile.png'),
                  ),
                SizedBox(width: 20,),
                Text(user.email!,style: TextStyle(fontSize: 16),),
              ],
            ),
            backgroundColor: Colors.green,
            actions: [
              IconButton(
                  onPressed: () =>scanQR(), icon: Icon(Icons.qr_code_scanner_outlined)),
              if (user != null) // Display user information if available
                PopupMenuButton(
                  itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry>[
                    PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text(user.email!),
                      ),
                    ),
                    PopupMenuDivider(),
                    PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("Sign Out"),
                      ),
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                      },
                    ),
                  ],
                  icon: Icon(Icons.person),
                ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'Scan Result: $_scanBarcode',
                style: TextStyle(fontSize: 20),
              ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF3c71f2),
                  ),
                  child: Center(
                    child: Text(
                      "Total Machines: ${categories.length}",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _navigateToPage(index);
                      },
                      child: Card(
                        margin:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Center(
                            child: Text(categories[index]["name"]),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}