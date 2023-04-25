import 'package:factory_checksheet/preview_page.dart';
import 'package:flutter/material.dart';

class CheckSheet extends StatefulWidget {
  @override
  State<CheckSheet> createState() => _CheckSheet();
}

class _CheckSheet  extends State<CheckSheet> {
  List<Map> categories = [
    {"name": "Daily Check cheet"},
    {"name": "Weekly Chek Sheet"},
    {"name": "Monthly Chek Sheet"},
  ];


  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MaintenanceChecklistPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MaintenanceChecklistPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MaintenanceChecklistPage()),
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
        appBar: AppBar(
          title: Center(
            child: Text(
              'Type of CheckSheet',
              style: TextStyle(fontSize: 16),
            ),
          ),
          backgroundColor: Colors.green,
          leading: IconButton(
            tooltip: "navigate before",
            onPressed: () {
              Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>MaintenanceChecklistPage()));
            },
            icon: Icon(Icons.navigate_before),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Expanded(
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
          ),
      ),
    );
  }
}