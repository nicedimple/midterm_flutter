import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sagarino_midterm',
      theme: ThemeData(
        primaryColor: Color(0xFFFF3D00),
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFF2196F3),
        ),
      ),
      home: DataListScreen(),
    );
  }
}

class DataListScreen extends StatefulWidget {
  @override
  _DataListScreenState createState() => _DataListScreenState();
}

class _DataListScreenState extends State<DataListScreen> {
  final List<Item> items = [
    Item(name: 'Dimple', details: '21 years old'),
    Item(name: 'Harry', details: 'Potter'),
    Item(name: 'William', details: 'Footballer'),
    Item(name: 'Angelo', details: 'Kuyaw'),
    Item(name: 'Jacob', details: 'Mamaw'),
    Item(name: 'Joshua', details: 'Networking pro'),
    Item(name: 'Axcel', details: 'Bawww'),
    Item(name: 'Jarred', details: 'Best in chatgpt'),
    Item(name: 'Mike', details: 'Hmmmm'),
    Item(name: 'Ronaldo', details: 'The best'),
  ];

  final Set<String> addedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sagarino_midterm'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: items.map((item) {
            return Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: addedItems.contains(item.name)
                  ? Colors.green[300]
                  : Colors.white, // Updated color
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF424242),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              print(item.details);
                            },
                            child: Text(addedItems.contains(item.name)
                                ? 'Visible'
                                : 'Details'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (addedItems.contains(item.name)) {
                            addedItems.remove(item.name);
                          } else {
                            addedItems.add(item.name);
                          }
                        });
                      },
                      child: Text(
                          addedItems.contains(item.name) ? 'Added' : 'Add'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: addedItems.contains(item.name)
                            ? Colors.green
                            : Color(0xFFFF3D00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Item {
  final String name;
  final String details;

  Item({required this.name, required this.details});
}
