import 'package:companion2/pages/timetablepage.dart';
import 'package:flutter/material.dart';

class BookHostelPage extends StatelessWidget {
  final String studentName = "John Doe";
  final String courseOfStudy = "Bachelor of Computer Science";
  final String semester = "1st Semester 2023/2024";

  final List<Map<String, dynamic>> hostels = [
    {
      "name": "Sunshine Hall",
      "type": "Mixed",
      "capacity": 200,
      "available": 50,
      "pricePerSemester": 1500,
    },
    {
      "name": "Moonlight Hall",
      "type": "Female Only",
      "capacity": 150,
      "available": 30,
      "pricePerSemester": 1700,
    },
    {
      "name": "Starlight Hall",
      "type": "Male Only",
      "capacity": 180,
      "available": 40,
      "pricePerSemester": 1600,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Hostel'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            StudentInfoCard(
              studentName: studentName,
              courseOfStudy: courseOfStudy,
              semester: semester,
              yearOfStudy: '',
            ),
            SizedBox(height: 20),
            Text(
              'Available Hostels',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ...hostels.map((hostel) => HostelCard(hostel: hostel)).toList(),
          ],
        ),
      ),
    );
  }
}

class HostelCard extends StatelessWidget {
  final Map<String, dynamic> hostel;

  HostelCard({required this.hostel});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.white, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hostel['name'],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Type: ${hostel['type']}',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
            Text(
              'Capacity: ${hostel['capacity']}',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
            Text(
              'Available Rooms: ${hostel['available']}',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
            Text(
              'Price per Semester: \$${hostel['pricePerSemester']}',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Book Now'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              onPressed: () {
                // TODO: Implement booking functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
