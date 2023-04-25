import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() =>  _HomePageState();
}

class  _HomePageState extends State<HomePage> {
  List<Map> catageroies = [
    {"name": "Oil Level", "isCheck": null},
    {"name": "Pressure Level", "isCheck": null},
    {"name": "Tempreatur Level", "isCheck": null},
    {"name": "Hydraulic Oil Level", "isCheck": null},
    {"name": "Speed", "isCheck": null},
  ];


  void toggleCheckbox(int index, bool value) {
    setState(() {
      if (value) {
        catageroies[index]["isCheck"] = true;
      } else {
        catageroies[index]["isCheck"] = false;
      }
    });

    if (!value) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          final TextEditingController _textFieldController = TextEditingController();
          return AlertDialog(
            title: Text('Enter a value'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: 'Enter a value'),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'CheckSheet',
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: Colors.green,
          leading: IconButton(
            tooltip: "navigate before",
            onPressed: () {
              Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>HomePage()));
            },
            icon: Icon(Icons.navigate_before),
          ),
        ),
      body: ListView.builder(
        itemCount: catageroies.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(child: Text(catageroies[index]["name"])),
                    ElevatedButton(
                      child: Text('Yes'),
                      style: ElevatedButton.styleFrom(
                        primary: catageroies[index]['isCheck'] == true
                            ? Colors.green
                            : Colors.grey,
                      ),
                      onPressed: () {
                        toggleCheckbox(index, true);
                      },
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      child: Text('No'),
                      style: ElevatedButton.styleFrom(
                        primary: catageroies[index]['isCheck'] == false
                            ? Colors.red
                            : Colors.grey,
                      ),
                      onPressed: () {
                        toggleCheckbox(index, false);
                      },
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
