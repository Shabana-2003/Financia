import 'package:financia/screens/settings/contactus.dart';
import 'package:financia/screens/settings/faq.dart';
import 'package:financia/screens/settings/instructionalcontent.dart';
import 'package:financia/screens/settings/privacypolicy.dart';
import 'package:financia/screens/settings/termsofusescreen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor:Color.fromARGB(255, 47, 125, 121),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildSettingsItem(
            'Terms of Use',
            'View and agree to the Terms of Use',
            () {
              _navigateToTermsOfUse(context);
            },
          ),
          _buildSettingsItem(
            'Privacy Policy',
            'Read our Privacy Policy',
            () {
              _navigateToPrivacyPolicy(context);
            },
          ),
          _buildSettingsItem(
            'Instructional Content',
            'Learn how to use the app',
            () {
              _navigateToInstructionalContent(context);
            },
          ),
          _buildSettingsItem(
            'Frequently Asked Questions (FAQs)',
            'Get answers to common questions',
            () {
              _navigateToFAQs(context);
            },
          ),
          _buildSettingsItem(
            'Contact Us',
            'Reach out for support or feedback',
            () {
              _navigateToContactUs(context);
            },
          ),
          _buildSettingsItem(
            'Version',
            'Check the app version',
            () {
              _showVersionInfo(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(String title, String subtitle, VoidCallback onTap) {
  return Column(
    children: [
      ListTile(
        contentPadding: EdgeInsets.only(left: 5, right: 10), // Adjust left and right padding
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Color.fromARGB(255, 168, 168, 168)), // Lighten the subtitle text
        ),
        onTap: onTap,
      ),   
    ],
  );
}



  void _navigateToTermsOfUse(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => TermsOfUseScreen()));
  }

  void _navigateToPrivacyPolicy(BuildContext context) {
   Navigator.push(context, MaterialPageRoute(builder: (_) => PrivacyPolicyScreen()));
  }

  void _navigateToInstructionalContent(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => InstructionalContentScreen()));
  }

  void _navigateToFAQs(BuildContext context) {
   Navigator.push(context, MaterialPageRoute(builder: (_) => FAQsScreen()));
  }

  void _navigateToContactUs(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => ContactUsScreen()));
  }

  void _showVersionInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Version'),
          content: Text('1.0.0'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
