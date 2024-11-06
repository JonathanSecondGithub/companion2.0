import 'package:companion2/pages/timetablepage.dart';
import 'package:flutter/material.dart';

class AcademicRequestsPage extends StatelessWidget {
  final String studentName = "John Doe";
  final String courseOfStudy = "Bachelor of Computer Science";
  final String semester = "1st Semester 2023/2024";

  final List<String> requestTypes = ["Defer", "Appeal", "Discontinue"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academic Requests'),
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
              'Submit a Request',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ...requestTypes.map((type) => RequestTypeCard(type: type)).toList(),
          ],
        ),
      ),
    );
  }
}

class RequestTypeCard extends StatelessWidget {
  final String type;

  RequestTypeCard({required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.white, width: 1),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RequestFormPage(requestType: type)),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

class RequestFormPage extends StatelessWidget {
  final String requestType;

  RequestFormPage({required this.requestType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$requestType Request'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Submit $requestType Request',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Reason',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white38),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Submit Request'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              onPressed: () {
                // TODO: Implement request submission
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
