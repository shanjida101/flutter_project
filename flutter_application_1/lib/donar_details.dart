import 'package:flutter/material.dart';

class DonorDetailsScreen extends StatelessWidget {
  final Map<String, String> donor;

  const DonorDetailsScreen({Key? key, required this.donor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donor Details')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${donor['name']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Mobile: ${donor['mobile']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Address: ${donor['address']}',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
