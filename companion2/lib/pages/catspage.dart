import 'package:flutter/material.dart';

class CATsPage extends StatelessWidget {
  final String year = "3rd";
  final String semester = "2nd Semester";
  final String courseOfStudy = "Bachelor of Computer Science";

  final List<Map<String, dynamic>> cats = [
    {
      "course": "Mathematics",
      "cat1": 85,
      "cat2": 78,
      "average": 81.5,
    },
    {
      "course": "Physics",
      "cat1": 92,
      "cat2": 88,
      "average": 90.0,
    },
    {
      "course": "Computer Science",
      "cat1": 76,
      "cat2": 82,
      "average": 79.0,
    },
    {
      "course": "English",
      "cat1": 88,
      "cat2": 90,
      "average": 89.0,
    },
    {
      "course": "Chemistry",
      "cat1": 79,
      "cat2": 85,
      "average": 82.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CATs Results'),
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
              'Your CATs Performance',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ...cats.map((cat) => CATCard(cat: cat)).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('View Detailed Analysis'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                // TODO: Implement detailed analysis view
                print("Viewing detailed analysis");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CATCard extends StatelessWidget {
  final Map<String, dynamic> cat;

  CATCard({required this.cat});

  Color _getPerformanceColor(double average) {
    if (average >= 80) return Colors.green;
    if (average >= 60) return Colors.orange;
    return Colors.red;
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
            Text(
              cat['course'],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CAT 1: ${cat['cat1']}',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'CAT 2: ${cat['cat2']}',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _getPerformanceColor(
                        (cat['average'] as num).toDouble()),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${cat['average']}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            LinearProgressIndicator(
              value: (cat['average'] as num).toDouble() / 100,
              backgroundColor: Colors.white24,
              valueColor: AlwaysStoppedAnimation<Color>(
                  _getPerformanceColor((cat['average'] as num).toDouble())),
            ),
          ],
        ),
      ),
    );
  }
}
