import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Color.fromARGB(255, 47, 125, 121),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'For any questions, concerns, or feedback, feel free to reach out to our support team. We are here to assist you!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Email:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Send us an email at:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: () {
                // Implement logic to open the email client with the provided email address
              },
              child: Text(
                'mashabana751@gmail.com',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'We strive to respond to your inquiries promptly and provide the assistance you need. Thank you for choosing Financia!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
