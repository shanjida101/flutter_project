import 'package:flutter/material.dart';


class DonorListScreen extends StatelessWidget {
  final List<Map<String, String>> donors = [
    {
      'name': 'Trajib',
      'group': 'O+',
      'mobile': '1234567890',
      'address': 'Dhaka'
    },
    {
      'name': 'Rahim',
      'group': 'A+',
      'mobile': '0987654321',
      'address': 'Chittagong'
    },
    {
      'name': 'Karim',
      'group': 'B+',
      'mobile': '1122334455',
      'address': 'Khulna'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donor List')),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: donors.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                  '${donors[index]['name']} (Grp: ${donors[index]['group']})'),
              subtitle: Text('Tap for details'),
              leading: Icon(Icons.bloodtype, color: Colors.red),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        //DonorDetailsScreen(donor: donors[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}