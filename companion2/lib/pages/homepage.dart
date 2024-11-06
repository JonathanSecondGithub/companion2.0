import 'package:companion2/pages/bookhostel.dart';
import 'package:companion2/pages/contactsdirectory.dart';
import 'package:companion2/pages/coursematerials.dart';
import 'package:companion2/pages/documentsrequest.dart';
import 'package:companion2/pages/groups.dart';
import 'package:companion2/pages/schoolmap.dart';
import 'package:companion2/pages/sessionreporting.dart';
import 'package:companion2/pages/studentid.dart';
import 'package:flutter/material.dart';
import 'attendancepage.dart';
import 'assignmentspage.dart';
import 'catspage.dart';
import 'feespage.dart';
import 'gradeshistorypage.dart';
import 'upcomingeventspage.dart';
import 'calendarpage.dart';
import 'timetablepage.dart';
import 'deferpage.dart';
import 'announcementspage.dart';
import 'complaintspage.dart';
// import 'documentsrequest.dart';
// import 'groups.dart';
// import 'coursematerials.dart';
// import 'schoolmap.dart';
// import 'contactsdirectory.dart';
// import 'studentid.dart';
// import 'bookhostelpage.dart';

class HomePage extends StatelessWidget {
  final String studentName = "John Doe";
  final String courseName = "Bachelor of Computer Science";
  final String yearOfStudy = "3rd Year";
  final String semester = "2nd Semester";

  final List<Map<String, String>> categories = [
    {
      "name": "Attendance",
      "emoji": "📊",
      "description": "Track your class attendance"
    },
    {
      "name": "Assignments",
      "emoji": "📝",
      "description": "View and submit assignments"
    },
    {
      "name": "CATs",
      "emoji": "🐱",
      "description": "Continuous Assessment Tests"
    },
    {
      "name": "Fees",
      "emoji": "💰",
      "description": "Check fee balances and payments"
    },
    {
      "name": "Grades",
      "emoji": "🎓",
      "description": "View your academic performance"
    },
    {
      "name": "Events",
      "emoji": "🎉",
      "description": "Stay updated on campus events"
    },
    {
      "name": "Calendar",
      "emoji": "📅",
      "description": "Academic and event calendar"
    },
    {"name": "Timetable", "emoji": "⏰", "description": "Your class schedule"},
    {
      "name": "Academic Requests",
      "emoji": "⏸️",
      "description": "Apply for requests"
    },
    {
      "name": "Discontinue",
      "emoji": "🛑",
      "description": "Process for discontinuation"
    },
    {
      "name": "Announcements",
      "emoji": "📢",
      "description": "Important university notices"
    },
    {
      "name": "Complaints",
      "emoji": "🗣️",
      "description": "Submit and track complaints"
    },
    {
      "name": "Session Report",
      "emoji": "📊",
      "description": "View session reports"
    },
    {
      "name": "Book Hostel",
      "emoji": "🏠",
      "description": "Reserve your accommodation"
    },
    {
      "name": "Co-curricular",
      "emoji": "🏅",
      "description": "Explore extracurricular activities"
    },
    {
      "name": "Groups",
      "emoji": "👥",
      "description": "Join and manage student groups"
    },
    {
      "name": "Course Materials",
      "emoji": "📚",
      "description": "Access study resources"
    },
    {"name": "Map", "emoji": "🗺️", "description": "Campus map and navigation"},
    {
      "name": "Store",
      "emoji": "🛒",
      "description": "University merchandise and supplies"
    },
    {
      "name": "Directory",
      "emoji": "📞",
      "description": "Contact information for staff"
    },
    {
      "name": "Apply for Documents",
      "emoji": "📄",
      "description": "Request official documents"
    },
    {"name": "ID", "emoji": "🆔", "description": "Student ID information"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
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
                      'Welcome, $studentName',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      courseName,
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    Text(
                      'Year: $yearOfStudy',
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
              'Explore the features',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white10,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.white, width: 1),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: Text(
                      categories[index]["emoji"]!,
                      style: TextStyle(fontSize: 32),
                    ),
                    title: Text(
                      categories[index]["name"]!,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      categories[index]["description"]!,
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                    onTap: () {
                      switch (categories[index]["name"]) {
                        case "Attendance":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AttendancePage()),
                          );
                          break;
                        case "Assignments":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AssignmentsPage()),
                          );
                          break;
                        case "CATs":
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CATsPage()),
                          );
                          break;
                        case "Fees":
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FeesPage()),
                          );
                          break;
                        case "Grades":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GradesHistoryPage()),
                          );
                          break;
                        case "Events":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpcomingEventsPage()),
                          );
                          break;
                        case "Calendar":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CalendarPage()),
                          );
                          break;
                        case "Timetable":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TimetablePage()),
                          );
                          break;
                        case "Academic Requests":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AcademicRequestsPage()),
                          );
                          break;
                        case "Announcements":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AnnouncementsPage()),
                          );
                          break;
                        case "Complaints":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComplaintsPage()),
                          );
                          break;
                        case "Session Report":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SessionReportingPage()), // Replace with your actual page
                          );
                          break;
                        case "Book Hostel":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookHostelPage()),
                          );
                          break;
                        case "Groups":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GroupsPage()),
                          );
                          break;
                        case "Course Materials":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CourseMaterialsPage()),
                          );
                          break;
                        case "Map":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SchoolMapPage()),
                          );
                          break;
                        case "Directory":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactsDirectoryPage()),
                          );
                          break;
                        case "Apply for Documents":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DocumentRequestPage()),
                          );
                          break;
                        case "ID":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentIDPage()),
                          );
                          break;
                        default:
                          break;
                      }
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
