import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard Manage Store')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              color: Colors.green[100],
              child: ListTile(
                title: const Text('Total Saldo'),
                subtitle: const Text('Rp 10.500.000'),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: Colors.blue[100],
              child: ListTile(
                title: const Text('Total Pemasukan'),
                subtitle: const Text('Rp 15.000.000'),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: Colors.red[100],
              child: ListTile(
                title: const Text('Total Pengeluaran'),
                subtitle: const Text('Rp 4.500.000'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
