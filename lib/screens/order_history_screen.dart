import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Order {
  final String id;
  final String date;
  final String status;
  final double price;

  Order({
    required this.id,
    required this.date,
    required this.status,
    required this.price,
  });
}

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Order> orders = [
      Order(
          id: '001',
          date: 'Feb 20, 2024',
          status: 'Clothes Received',
          price: 450),
      Order(id: '002', date: 'Feb 18, 2024', status: 'Washing', price: 300),
      Order(id: '003', date: 'Feb 15, 2024', status: 'Pending', price: 500),
      Order(
          id: '004',
          date: 'Feb 12, 2024',
          status: 'Clothes Returned',
          price: 420),
      Order(id: '005', date: 'Feb 10, 2024', status: 'Canceled', price: 200),
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OrderCard(order: orders[index]);
        },
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(order.status);
    final currencyFormatter =
        NumberFormat.currency(locale: "en_ZM", symbol: "ZMW ");

    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          leading: CircleAvatar(
            backgroundColor: statusColor.withValues(alpha: 0.1),
            radius: 18, // Adjusted size for a compact look
            child: Icon(_getStatusIcon(order.status),
                color: statusColor, size: 20),
          ),
          title: Text(
            'Order #${order.id}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          subtitle: Row(
            children: [
              Text(
                order.date,
                style: const TextStyle(color: Colors.black54, fontSize: 13),
              ),
            ],
          ),
          trailing: Column(
            children: [
              Text(
                currencyFormatter.format(order.price),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(width: 8), // Keeps spacing consistent
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  order.status,
                  style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tapped on Order #${order.id}')),
            );
          },
        ),
        const Divider(height: 0, thickness: 0.5),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Clothes Received':
        return Colors.green;
      case 'Washing':
        return Colors.blue;
      case 'Pending':
        return Colors.orange;
      case 'Clothes Returned':
        return Colors.purple;
      case 'Canceled':
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Clothes Received':
        return Icons.check_circle;
      case 'Washing':
        return Icons.local_laundry_service;
      case 'Pending':
        return Icons.hourglass_bottom;
      case 'Clothes Returned':
        return Icons.reply;
      case 'Canceled':
        return Icons.cancel;
      default:
        return Icons.help;
    }
  }
}
