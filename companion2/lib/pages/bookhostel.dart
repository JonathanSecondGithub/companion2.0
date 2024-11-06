import 'package:flutter/material.dart';

class BookHostelPage extends StatelessWidget {
  final String year = "3rd";
  final String semester = "2nd Semester";
  final String courseOfStudy = "Bachelor of Computer Science";
  final String bookingStatus = "Not Booked";

  final List<Map<String, dynamic>> hostelBookings = [
    {
      "hostelName": "Sunshine Hostel",
      "roomNumber": "A201",
      "status": "Booked",
      "bookingDate": "2023-09-15"
    },
    {
      "hostelName": "Rainbow Hostel",
      "roomNumber": "B101",
      "status": "Not Booked",
      "bookingDate": "-"
    },
    {
      "hostelName": "Moonlight Hostel",
      "roomNumber": "C303",
      "status": "Booked",
      "bookingDate": "2022-08-30"
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
            Card(
              color: Colors.white10,
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
                      courseOfStudy,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Academic Year: $year',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    Text(
                      'Semester: $semester',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your Hostel Bookings',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ...hostelBookings
                .map((hostel) => HostelCard(hostel: hostel))
                .toList(),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Book Hostel'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                // TODO: Implement booking functionality
                print("Booking hostel for ongoing semester");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HostelCard extends StatelessWidget {
  final Map<String, dynamic> hostel;

  HostelCard({required this.hostel});

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Booked':
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.white, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hostel['hostelName'],
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(hostel['status']),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    hostel['status'],
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Room Number: ${hostel['roomNumber']}',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Booking Date: ${hostel['bookingDate']}',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
