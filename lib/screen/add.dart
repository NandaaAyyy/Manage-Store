import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  String kategori = 'Pemasukan';
  String keterangan = '';
  double nominal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Transaksi')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: kategori,
                items: ['Pemasukan', 'Pengeluaran']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => setState(() => kategori = val!),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nominal'),
                keyboardType: TextInputType.number,
                onChanged: (val) => nominal = double.tryParse(val) ?? 0,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Keterangan'),
                onChanged: (val) => keterangan = val,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Transaksi Ditambahkan!')),
                    );
                  }
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
