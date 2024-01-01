import 'package:flutter/material.dart';

class InstructionalContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instructional Content'),
        backgroundColor: Color.fromARGB(255, 47, 125, 121),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Financia: Your Personal Money Manager!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Thank you for choosing Financia to manage your finances. This guide will help you get started with the app and make the most out of its features.',
            ),
            _buildContentItem(
              'Dashboard Overview',
              '1. The Home page displays an overview of your financial data, including total balance, total spent, and total income.\n2. Tap on the various sections to view detailed insights.',
            ),
            _buildContentItem(
              'Adding Financial Data',
              '1. To add an income or expense, go to the "Add" page.\n2. Select the category, enter the amount, and add additional details if needed.\n3. Save the entry to update your financial records.',
            ),
            _buildContentItem(
              'Viewing and Editing Data',
              '1. Access the "Records" page to view a list of your financial entries.\n2. Tap on an entry to view details, edit, or delete it.\n3. Use the search and filter options to find specific entries.',
            ),
            _buildContentItem(
              'Charts and Graphs',
              '1. Explore the "Charts" page to visualize your financial data.\n2. Select different time frames (weekly, monthly, yearly) to view graphical representations of your income and expenses.',
            ),
            _buildContentItem(
              'Profile and Settings',
              '1. Go to the "Profile" page to customize your app experience.\n2. Adjust your nickname and other optional settings.\n3. Explore the "Settings" page for additional options and the "Terms of Use."',
            ),
            _buildContentItem(
              'Weekly, Monthly, Daily, and Yearly Views',
              '1. Navigate to the respective pages to view a detailed breakdown of your financial activities for different time frames.\n2. Use these views to analyze spending patterns and plan your budget.',
            ),
            _buildContentItem(
              'Additional Features',
              '1. Discover the "Favorites" and "Categories" pages for more insights into your spending habits.\n2. Use the "Privacy Policy" link in the settings for information on how your data is handled.',
            ),
            _buildContentItem(
              'Data Security',
              '1. Your financial data is secure with industry-standard encryption.\n2. If you have any security concerns, please contact our support team.',
            ),
            _buildContentItem(
              'Need Help or Have Feedback?',
              '1. If you encounter any issues or have suggestions for improvement, contact our support team through the app.',
            ),
            SizedBox(height: 16),
            Text(
              'Enjoy Financia!\nThank you for using Financia!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentItem(String title, String content) {
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
