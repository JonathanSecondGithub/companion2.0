import 'package:flutter/material.dart';

class GradesHistoryPage extends StatelessWidget {
  final String courseOfStudy = "Bachelor of Computer Science";

  final List<Map<String, dynamic>> academicYears = [
    {
      "year": "2022/2023",
      "semesters": [
        {
          "name": "1st Semester",
          "units": [
            {"name": "Introduction to Programming", "grade": "A"},
            {"name": "Calculus I", "grade": "B+"},
            {"name": "Physics for Computer Scientists", "grade": "A-"},
            {"name": "Communication Skills", "grade": "A"},
          ]
        },
        {
          "name": "2nd Semester",
          "units": [
            {"name": "Data Structures", "grade": "A"},
            {"name": "Linear Algebra", "grade": "B"},
            {"name": "Digital Logic", "grade": "A-"},
            {"name": "Probability and Statistics", "grade": "B+"},
          ]
        }
      ]
    },
    {
      "year": "2023/2024",
      "semesters": [
        {
          "name": "1st Semester",
          "units": [
            {"name": "Object-Oriented Programming", "grade": "A"},
            {"name": "Database Systems", "grade": "A-"},
            {"name": "Computer Networks", "grade": "B+"},
            {"name": "Discrete Mathematics", "grade": "A-"},
          ]
        }
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grades History'),
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
                      'Grades History',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ...academicYears
                .map((year) => AcademicYearCard(yearData: year))
                .toList(),
          ],
        ),
      ),
    );
  }
}

class AcademicYearCard extends StatelessWidget {
  final Map<String, dynamic> yearData;

  AcademicYearCard({required this.yearData});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.white, width: 1),
      ),
      child: ExpansionTile(
        title: Text(
          'Academic Year: ${yearData['year']}',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        children: [
          ...(yearData['semesters'] as List)
              .map((semester) => SemesterCard(semesterData: semester))
              .toList(),
        ],
      ),
    );
  }
}

class SemesterCard extends StatelessWidget {
  final Map<String, dynamic> semesterData;

  SemesterCard({required this.semesterData});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.white38, width: 1),
      ),
      child: ExpansionTile(
        title: Text(
          semesterData['name'],
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white70),
        ),
        children: [
          ...(semesterData['units'] as List)
              .map((unit) => UnitGradeItem(unitData: unit))
              .toList(),
        ],
      ),
    );
  }
}

class UnitGradeItem extends StatelessWidget {
  final Map<String, dynamic> unitData;

  UnitGradeItem({required this.unitData});

  Color _getGradeColor(String grade) {
    switch (grade[0]) {
      case 'A':
        return Colors.green;
      case 'B':
        return Colors.blue;
      case 'C':
        return Colors.yellow;
      case 'D':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        unitData['name'],
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
      trailing: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: _getGradeColor(unitData['grade']),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          unitData['grade'],
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
