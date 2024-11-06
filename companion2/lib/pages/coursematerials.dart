import 'package:flutter/material.dart';

class CourseMaterialsPage extends StatelessWidget {
  final String year = "3rd";
  final String semester = "2nd Semester";
  final String courseOfStudy = "Bachelor of Computer Science";

  final List<Map<String, dynamic>> courseMaterials = [
    {
      "course": "Mathematics",
      "materialTitle": "Linear Algebra Lecture Notes",
      "uploadDate": "2024-07-15",
      "status": "Available",
      "fileType": "PDF"
    },
    {
      "course": "Physics",
      "materialTitle": "Quantum Mechanics Textbook",
      "uploadDate": "2024-07-20",
      "status": "Available",
      "fileType": "eBook"
    },
    {
      "course": "Computer Science",
      "materialTitle": "Algorithm Design Slides",
      "uploadDate": "2024-07-25",
      "status": "Available",
      "fileType": "PPT"
    },
    {
      "course": "English",
      "materialTitle": "Literature Course Reading",
      "uploadDate": "2024-07-22",
      "status": "Unavailable",
      "fileType": "PDF"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Materials'),
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
              'Your Course Materials',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ...courseMaterials
                .map((material) => CourseMaterialCard(material: material))
                .toList(),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Upload New Material'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                // TODO: Implement material upload functionality
                print("Uploading new course material");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CourseMaterialCard extends StatelessWidget {
  final Map<String, dynamic> material;

  CourseMaterialCard({required this.material});

  Color _getStatusColor(String status) {
    return status == 'Available' ? Colors.green : Colors.red;
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
                  material['course'],
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(material['status']),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    material['status'],
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              material['materialTitle'],
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'File Type: ${material['fileType']}',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
            SizedBox(height: 8),
            Text(
              'Uploaded on: ${material['uploadDate']}',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
