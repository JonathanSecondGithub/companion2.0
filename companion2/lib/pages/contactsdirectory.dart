import 'package:flutter/material.dart';

class ContactsDirectoryPage extends StatelessWidget {
  final String schoolName = "ABC University";

  final List<Map<String, dynamic>> contacts = [
    {
      "name": "Dr. John Doe",
      "title": "Dean of Students",
      "email": "johndoe@abcuniversity.edu",
      "phone": "+254 712 345678",
      "office": "Main Admin Building, Room 101"
    },
    {
      "name": "Prof. Jane Smith",
      "title": "Head of Computer Science",
      "email": "janesmith@abcuniversity.edu",
      "phone": "+254 723 456789",
      "office": "CS Building, Room 202"
    },
    {
      "name": "Ms. Emily Brown",
      "title": "Registrar",
      "email": "emilybrown@abcuniversity.edu",
      "phone": "+254 733 567890",
      "office": "Main Admin Building, Room 203"
    },
    {
      "name": "Mr. Tom White",
      "title": "Head Librarian",
      "email": "tomwhite@abcuniversity.edu",
      "phone": "+254 744 678901",
      "office": "Main Library, Room 304"
    },
    {
      "name": "Ms. Lisa Green",
      "title": "Finance Officer",
      "email": "lisagreen@abcuniversity.edu",
      "phone": "+254 755 789012",
      "office": "Finance Office, Room 105"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts Directory'),
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
                      schoolName,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Important Contacts Directory',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Key Contacts',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ...contacts
                .map((contact) => ContactCard(contact: contact))
                .toList(),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Add New Contact'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                // TODO: Implement new contact addition
                print("Adding new contact");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final Map<String, dynamic> contact;

  ContactCard({required this.contact});

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
              contact['name'],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              contact['title'],
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.email, color: Colors.white70, size: 16),
                SizedBox(width: 5),
                Text(
                  contact['email'],
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.phone, color: Colors.white70, size: 16),
                SizedBox(width: 5),
                Text(
                  contact['phone'],
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.white70, size: 16),
                SizedBox(width: 5),
                Text(
                  contact['office'],
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
