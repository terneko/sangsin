import 'package:flutter/material.dart';
import 'package:sangsin/utils/app_styles.dart';

class SelectionTable extends StatefulWidget {
  const SelectionTable({super.key});

  @override
  _SelectionTableState createState() => _SelectionTableState();
}

class _SelectionTableState extends State<SelectionTable> {
  int? selectedRow; // Store the selected row index

  // Sample data
  final List<Map<String, dynamic>> data = [
    {"size": '1"', "quantity": 6, "price": "THB 100"},
    {"size": '1"', "quantity": 12, "price": "THB 120"},
    {"size": '1.5"', "quantity": 6, "price": "THB 100"},
    {"size": '1.5"', "quantity": 12, "price": "THB 120"},
    {"size": '2"', "quantity": 6, "price": "THB 120"},
    {"size": '2.5"', "quantity": 6, "price": "THB 140"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark, // Set background to black
      appBar: AppBar(
        title: const Text("ID Photo Size and Price"),
        backgroundColor: AppTheme.dark,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Table Header
            Container(
              color: Colors.grey[900],
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: Text("Subject",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Expanded(
                      child: Text("Amount",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Expanded(
                      child: Text("Price",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ),

            // Table Rows
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedRow == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedRow =
                            isSelected ? null : index; // Toggle selection
                      });
                    },
                    child: Container(
                      color: isSelected
                          ? Colors.blueGrey
                          : AppTheme.dark, // Change row color on selection
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(data[index]["size"],
                                style: const TextStyle(color: Colors.white)),
                          ),
                          Expanded(
                            child: Text(data[index]["quantity"].toString(),
                                style: const TextStyle(color: Colors.white)),
                          ),
                          Expanded(
                            child: Text(data[index]["price"],
                                style: const TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
