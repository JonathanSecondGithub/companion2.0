import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpcomingEventsPage extends StatelessWidget {
  final List<Map<String, dynamic>> events = [
    {
      "name": "Annual Tech Symposium",
      "date": DateTime(2024, 8, 15, 9, 0),
      "location": "Main Auditorium",
      "description":
          "A gathering of industry experts discussing the latest trends in technology.",
      "isRegistered": false,
    },
    {
      "name": "Career Fair 2024",
      "date": DateTime(2024, 9, 5, 10, 0),
      "location": "University Sports Complex",
      "description":
          "Meet potential employers and explore career opportunities.",
      "isRegistered": true,
    },
    {
      "name": "Hackathon Challenge",
      "date": DateTime(2024, 10, 1, 8, 0),
      "location": "Computer Science Building",
      "description": "48-hour coding challenge to solve real-world problems.",
      "isRegistered": false,
    },
    {
      "name": "Alumni Networking Night",
      "date": DateTime(2024, 11, 12, 18, 30),
      "location": "University Club",
      "description":
          "Connect with successful alumni and build your professional network.",
      "isRegistered": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Events'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Text(
              'Upcoming Student Events',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ...events.map((event) => EventCard(event: event)).toList(),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Map<String, dynamic> event;

  EventCard({required this.event});

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
              event['name'],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.white70, size: 16),
                SizedBox(width: 8),
                Text(
                  DateFormat('MMMM d, yyyy').format(event['date']),
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.white70, size: 16),
                SizedBox(width: 8),
                Text(
                  DateFormat('h:mm a').format(event['date']),
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.white70, size: 16),
                SizedBox(width: 8),
                Text(
                  event['location'],
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              event['description'],
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text(event['isRegistered'] ? 'Registered' : 'Register'),
              style: ElevatedButton.styleFrom(
                foregroundColor:
                    event['isRegistered'] ? Colors.white : Colors.black,
                backgroundColor:
                    event['isRegistered'] ? Colors.green : Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              onPressed: event['isRegistered']
                  ? null
                  : () {
                      // TODO: Implement registration functionality
                      print("Registering for event: ${event['name']}");
                    },
            ),
          ],
        ),
      ),
    );
  }
}
