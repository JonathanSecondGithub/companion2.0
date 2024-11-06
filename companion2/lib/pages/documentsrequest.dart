import 'package:flutter/material.dart';

class DocumentRequestPage extends StatelessWidget {
  final String studentName = "John Doe";
  final String studentID = "ABC123456";
  final String courseOfStudy = "Bachelor of Computer Science";
  final String universityName = "ABC University";

  final List<String> documentTypes = [
    "Transcript",
    "Recommendation Letter",
    "Certificate of Good Conduct",
    "Course Completion Certificate",
    "Other"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Documents'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            SizedBox(height: 20),
            Text(
              'Request Official Documents',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Student Information Card
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
                      studentName,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      studentID,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                          letterSpacing: 2),
                    ),
                    SizedBox(height: 8),
                    Text(
                      universityName,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 4),
                    Text(
                      courseOfStudy,
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select Document Type',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            // Dropdown to select document type
            Card(
              color: Colors.white10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.white, width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButtonFormField<String>(
                  dropdownColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  iconEnabledColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  items: documentTypes.map((String document) {
                    return DropdownMenuItem<String>(
                      value: document,
                      child: Text(
                        document,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    // TODO: Handle document selection
                    print("Selected document: $value");
                  },
                  hint: Text(
                    'Choose Document',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Additional Comments (Optional)',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            // Comments input field
            Card(
              color: Colors.white10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.white, width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Enter any specific details or comments...',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Submit Request'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                // TODO: Implement request submission
                print("Request submitted");
              },
            ),
            SizedBox(height: 20),
            Text(
              'Once submitted, your request will be processed by the administration.',
              style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
