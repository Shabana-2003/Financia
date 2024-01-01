import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        backgroundColor: Color.fromARGB(255, 47, 125, 121),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Last Updated: December 30, 2023',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to Financia, your personal money manager application! This Privacy Policy outlines how Financia collects, uses, and protects your personal information. By using Financia, you agree to the terms outlined in this policy.',
            ),
            SizedBox(height: 16),
            _buildPrivacyPolicyItem(
              'Information We Collect',
              'Financial Data: Financia collects and stores the financial data you input into the application, including income, expenses, and related details.',
            ),
            _buildPrivacyPolicyItem(
              'How We Use Your Information',
              'Internal Use: We use your financial data to provide personalized financial insights and management tools within the application.',
            ),
            _buildPrivacyPolicyItem(
              'Data Security',
              'Encryption: Financia employs industry-standard encryption and security measures to protect your financial data from unauthorized access.',
            ),
            _buildPrivacyPolicyItem(
              'Data Sharing',
              'Third Parties: Financia does not share your personal financial data with third parties.',
            ),
            _buildPrivacyPolicyItem(
              'Application Updates',
              'Updates: Periodic updates may be released to enhance features and security. Ensure your app is always up-to-date.',
            ),
            _buildPrivacyPolicyItem(
              'Privacy Policy Changes',
              'Updates: We reserve the right to update or modify this privacy policy at any time. Check this page periodically for changes.',
            ),
            _buildPrivacyPolicyItem(
              'User Responsibilities',
              'Data Accuracy: Users are responsible for the accuracy and security of their financial data within the application.',
            ),
            _buildPrivacyPolicyItem(
              'Contact Us',
              'Support: For any questions or concerns regarding this Privacy Policy, contact our support team.',
            ),
            _buildPrivacyPolicyItem(
              'Disclaimer',
              'No Guarantees: Financia is provided "as is" without any guarantees. We are not liable for any financial decisions made based on the information provided by the application.',
            ),
            SizedBox(height: 16),
            Text(
              'By using Financia, you acknowledge that you have read, understood, and agree to this Privacy Policy.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacyPolicyItem(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Text(content),
      ],
    );
  }
}
