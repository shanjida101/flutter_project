import 'package:flutter/material.dart';

void main() {
  runApp(BloodDonationApp());
}

class BloodDonationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donation',
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage(),
    );
  }
}

// Home Page
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = [
    WelcomeScreen(),
    DonorListScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blood Donation')),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Donor List'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Welcome Page
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to Blood Donors Community',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// Donor List Page
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
    return ListView.builder(
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
                      DonorDetailsScreen(donor: donors[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// Donor Details Page
class DonorDetailsScreen extends StatelessWidget {
  final Map<String, String> donor;

  DonorDetailsScreen({required this.donor});

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

// Profile Page
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}