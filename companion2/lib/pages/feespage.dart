import 'package:flutter/material.dart';

class FeesPage extends StatelessWidget {
  final String year = "2023/2024";
  final String semester = "2nd Semester";
  final String courseOfStudy = "Bachelor of Computer Science";

  final Map<String, dynamic> feeBreakdown = {
    "Tuition Fee": 5000.00,
    "Library Fee": 200.00,
    "Technology Fee": 300.00,
    "Student Activity Fee": 150.00,
    "Health Insurance": 500.00,
  };

  final double totalFees = 6150.00;
  final double paidAmount = 4500.00;

  @override
  Widget build(BuildContext context) {
    double balanceRemaining = totalFees - paidAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text('Fees Breakdown'),
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
              'Fees Breakdown',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ...feeBreakdown.entries
                .map((entry) => FeeItem(title: entry.key, amount: entry.value))
                .toList(),
            SizedBox(height: 20),
            Card(
              color: Colors.white10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.white, width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    FeeSummaryItem(
                        title: 'Total Fees', amount: totalFees, isTotal: true),
                    SizedBox(height: 8),
                    FeeSummaryItem(title: 'Paid Amount', amount: paidAmount),
                    SizedBox(height: 8),
                    FeeSummaryItem(
                        title: 'Balance Remaining',
                        amount: balanceRemaining,
                        isBalance: true),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Make Payment'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                // TODO: Implement payment functionality
                print("Initiating payment process");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FeeItem extends StatelessWidget {
  final String title;
  final double amount;

  FeeItem({required this.title, required this.amount});

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
              '\$${amount.toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class FeeSummaryItem extends StatelessWidget {
  final String title;
  final double amount;
  final bool isTotal;
  final bool isBalance;

  FeeSummaryItem(
      {required this.title,
      required this.amount,
      this.isTotal = false,
      this.isBalance = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight:
                isTotal || isBalance ? FontWeight.bold : FontWeight.normal,
            color: isBalance ? Colors.red : Colors.white,
          ),
        ),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isBalance ? Colors.red : Colors.white,
          ),
        ),
      ],
    );
  }
}
