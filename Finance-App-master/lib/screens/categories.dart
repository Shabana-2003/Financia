import 'package:financia/data/utlity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:financia/data/model/hivemodels.dart';
import 'package:intl/intl.dart';
import 'add.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({Key? key}) : super(key: key);

  @override
  State<ViewAll> createState() => _ViewAllState();
}

ValueNotifier<int> kj = ValueNotifier(0);

class _ViewAllState extends State<ViewAll> {
  List<String> categoryFilter = ['All', 'Income', 'Expense'];
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: kj,
          builder: (BuildContext context, dynamic value, Widget? child) {
            List<FinancesData> filteredTransactions = filterTransactions();

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Financial History',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(
                              3,
                              (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedCategoryIndex = index;
                                      kj.value = index;
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: selectedCategoryIndex == index
                                          ? Color.fromARGB(255, 47, 125, 121)
                                          : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      categoryFilter[index],
                                      style: TextStyle(
                                        color: selectedCategoryIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Top Spending',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.swap_vert,
                              size: 25,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: filteredTransactions.isNotEmpty
                      ? SliverChildBuilderDelegate(
                          (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                                bottom: 4,
                                top: 4,
                              ),
                              child: Slidable(
                                actionPane: SlidableDrawerActionPane(),
                                actionExtentRatio: 0.25,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 235, 236, 236),
                                      width: 3.0,
                                    ),
                                  ),
                                  child: ListTile(
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.asset(
                                          'images/${filteredTransactions[index].name}.png',
                                          height: 40),
                                    ),
                                    title: Text(
                                      filteredTransactions[index].name,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Text(
                                        '${DateFormat('MMMM').format(filteredTransactions[index].dateTime)} ${filteredTransactions[index].dateTime.day}, ${filteredTransactions[index].dateTime.year}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    trailing: Text(
                                      '\₹ ${filteredTransactions[index].amount}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 19,
                                        color: filteredTransactions[index]
                                                    .transactionType ==
                                                'Income'
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                secondaryActions: [
                                  IconSlideAction(
                                    caption: 'Edit',
                                    color: const Color.fromARGB(
                                        255, 250, 250, 250),
                                    icon: Icons.edit,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddScreen(
                                              editData:
                                                  filteredTransactions[index]),
                                        ),
                                      );
                                    },
                                  ),
                                  IconSlideAction(
                                    caption: 'Delete',
                                    color: const Color.fromARGB(
                                        255, 253, 253, 253),
                                    icon: Icons.delete,
                                    onTap: () {
                                      _showDeleteConfirmationDialog(
                                          filteredTransactions[index]);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          childCount: filteredTransactions.length,
                        )
                      : SliverChildListDelegate(
                          [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 60,
                                ),
                                Image.asset(
                                  'images/four.png',
                                  height: 300,
                                  width: 300,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30.0),
                                  child: Text(
                                    "No transactions yet. Start recording transactions to shape your financial story.",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 69, 67, 67),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<FinancesData> filterTransactions() {
    if (selectedCategoryIndex == 0) {
      return box.values.toList();
    } else if (selectedCategoryIndex == 1) {
      return incomeTransactions();
    } else {
      return expenseTransactions();
    }
  }

  Future<bool> _showDeleteConfirmationDialog(FinancesData history) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Delete",
              style: TextStyle(color: Color.fromARGB(255, 249, 248, 248))),
          backgroundColor: Color.fromARGB(255, 2, 116, 106),
          content: Text(
            "Are you sure you want to delete this transaction?",
            style: TextStyle(color: Color.fromARGB(255, 206, 199, 199)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text("Cancel",
                  style: TextStyle(color: Color.fromARGB(255, 194, 187, 187))),
            ),
            TextButton(
              onPressed: () {
                history.delete();
                Navigator.pop(context, true);
              },
              child: Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
