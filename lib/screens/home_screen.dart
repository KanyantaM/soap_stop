// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:soap_stop/screens/cart.dart';
import 'package:soap_stop/widgets/laundry_option_box.dart';
import 'package:soap_stop/models/laundry_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'wash';

  final List<LaundryItem> laundryOptions = [
    LaundryItem(
      title: 'Small Box',
      price: 'K50',
      description: 'For small loads.',
      imageSize: 50.0,
      service: Service.wash,
    ),
    LaundryItem(
      title: 'Iron',
      price: 'K60',
      description: 'For ironing services.',
      imageSize: 60.0,
      service: Service.iron,
    ),
    LaundryItem(
      title: 'Dry-Clean',
      price: 'K100',
      description: 'For dry cleaning.',
      imageSize: 70.0,
      service: Service.dry_clean,
    ),
    LaundryItem(
      title: 'Bedding Box',
      price: 'K150',
      description: 'For beddings and linens.',
      imageSize: 90.0,
      service: Service.beddings,
    ),
    LaundryItem(
      title: 'Medium Box',
      price: 'K80',
      description: 'Regular laundry load.',
      imageSize: 70.0,
      service: Service.wash,
    ),
    LaundryItem(
      title: 'Large Box',
      price: 'K120',
      description: 'Bigger laundry load.',
      imageSize: 90.0,
      service: Service.wash,
    ),
  ];

  final Map<String, String> categoryEmojis = {
    'wash': '💧',
    'iron': '🔥',
    'dry_clean': '👔',
    'beddings': '🛏️',
  };

  List<LaundryItem> get filteredOptions {
    return laundryOptions
        .where((option) => option.service.name == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final categories = categoryEmojis.keys.toList();

    return Scaffold(
      body: LiquidPullToRefresh(
        color: Colors.blue,
        onRefresh: () => Future.delayed(const Duration(seconds: 2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Filters
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: categories.map((category) {
                  final isSelected = category == _selectedCategory;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Row(
                        children: [
                          Text(categoryEmojis[category]!),
                          const SizedBox(width: 8),
                          Text(category.replaceAll("_", " ")),
                        ],
                      ),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                      selectedColor: Colors.blue,
                      backgroundColor: Colors.grey[200],
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Choose a Laundry Box',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            // Laundry Options
            Expanded(
              child: ListView.builder(
                itemCount: filteredOptions.length,
                itemBuilder: (context, index) {
                  final item = filteredOptions[index];
                  return LaundryOptionBox(
                    item: item,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.wash, color: Colors.white, size: 28),
      ),
    );
  }
}
