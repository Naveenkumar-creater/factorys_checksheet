import 'package:factory_checksheet/checksheet_page1.dart';
import 'package:flutter/material.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
class MaintenanceChecklistItem {
  final String text;
  bool isChecked;

  MaintenanceChecklistItem(this.text, this.isChecked);
}

class MaintenanceChecklistPage extends StatefulWidget {
  @override
  _MaintenanceChecklistPageState createState() =>
      _MaintenanceChecklistPageState();
}

class _MaintenanceChecklistPageState extends State<MaintenanceChecklistPage> {
  bool _isPreviewMode = false;

  final List<MaintenanceChecklistItem> _checklistItems = [
    MaintenanceChecklistItem('Check oil level', false),
    MaintenanceChecklistItem('Check coolant level', false),
    MaintenanceChecklistItem('Check brake pads', false),
    MaintenanceChecklistItem('Check tire pressure', false),
    MaintenanceChecklistItem('Check battery condition', false),
  ];

  void _togglePreviewMode() {
    setState(() {
      _isPreviewMode = !_isPreviewMode;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: const Text('Maintenance Checklist'),
        ),
        body: _isPreviewMode ? _buildPreview() : _buildChecklist(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: _togglePreviewMode,
          child: _isPreviewMode
              ? const Icon(
            Icons.edit,
          )
              : const Icon(Icons.preview),
        ),
      ),
    );
  }

  Widget _buildChecklist() {
    return ListView.builder(
      itemCount: _checklistItems.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(_checklistItems[index].text),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _checklistItems[index].isChecked = true;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: _checklistItems[index].isChecked
                        ? MaterialStateProperty.all<Color>(Colors.green)
                        : MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _checklistItems[index].isChecked = false;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: _checklistItems[index].isChecked == false
                        ? MaterialStateProperty.all<Color>(Colors.red)
                        : MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                  child: const Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPreview() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Preview Checklist',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.grey),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _checklistItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_checklistItems[index].text),
                trailing: _checklistItems[index].isChecked
                    ? const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                )
                    : const Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>CheckSheet()));
            },
            child: const Text('Submit Checklist'),
          ),
        ],
      ),
    );
  }
}
