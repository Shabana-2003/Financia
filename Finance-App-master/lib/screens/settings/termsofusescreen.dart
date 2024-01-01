import 'package:flutter/material.dart';

class TermsOfUseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms of Use'),
        backgroundColor: Color.fromARGB(255, 47, 125, 121),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms of Use',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Welcome to Financia, your personal money manager application! By using Financia, you agree to comply with the following terms and conditions of use. If you do not agree with these terms, please refrain from using the application.',
              ),
              SizedBox(height: 16),
              Text(
                'User Responsibilities:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. You are solely responsible for the data you input into Financia.',
              ),
              Text(
                '2. Ensure the accuracy and security of your financial data within the application.',
              ),
              SizedBox(height: 16),
              Text(
                'Data Security:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. Financia uses industry-standard encryption and security measures to protect your financial data.',
              ),
              Text(
                '2. In the event of any security concerns or unauthorized access, please contact us immediately.',
              ),
              SizedBox(height: 16),
              Text(
                'Usage Limitations:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. Financia is intended for personal financial management purposes only.',
              ),
              Text(
                '2. Commercial use or any other unauthorized use is strictly prohibited.',
              ),
              SizedBox(height: 16),
              Text(
                'Application Updates:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. We may release updates to enhance features and security. Ensure your app is always up-to-date.',
              ),
              SizedBox(height: 16),
              Text(
                'Privacy Policy:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. Your privacy is important to us. Please review our Privacy Policy to understand how we handle your data.',
              ),
              SizedBox(height: 16),
              Text(
                'Feedback and Support:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. We welcome your feedback to improve Financia. Contact our support team for assistance.',
              ),
              SizedBox(height: 16),
              Text(
                'Termination of Service:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. We reserve the right to terminate or suspend the availability of Financia at our discretion.',
              ),
              SizedBox(height: 16),
              Text(
                'Disclaimer:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. Financia is provided "as is" without any warranties. We are not liable for any financial decisions made based on the information provided by the application.',
              ),
              SizedBox(height: 16),
              Text(
                'Chart Accuracy:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. Charts and graphs provided in the application are for visualization purposes and may not represent real-time financial data accurately.',
              ),
              SizedBox(height: 16),
              Text(
                'Terms Updates:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. We reserve the right to update or modify these terms at any time. Please check this page periodically for changes.',
              ),
              SizedBox(height: 16),
              Text(
                'By using Financia, you acknowledge that you have read, understood, and agree to these terms. Thank you for choosing Financia to manage your financial data!',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
