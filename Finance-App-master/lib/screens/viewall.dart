import 'package:financia/Screens/add.dart';
import 'package:flutter/material.dart';
import 'package:financia/data/utlity.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../data/model/hivemodels.dart';

class viewAll extends StatefulWidget {
  const viewAll({Key? key}) : super(key: key);

  @override
  State<viewAll> createState() => _StatisticsState();
}

ValueNotifier kj = ValueNotifier(0);

class _StatisticsState extends State<viewAll> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  List f = [today(), week(), month(), year()];
  List<FinancesData> a = [];
  int index_color = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: kj,
          builder: (BuildContext context, dynamic value, Widget? child) {
            a = f[value];
            return custom();
          },
        ),
      ),
    );
  }

  CustomScrollView custom() {
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
                      4,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              index_color = index;
                              kj.value = index;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index_color == index
                                  ? Color.fromARGB(255, 47, 125, 121)
                                  : Colors.white,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              day[index],
                              style: TextStyle(
                                color: index_color == index
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
          delegate: a.isNotEmpty
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
                            borderRadius: BorderRadius.circular(
                                14), // Set your desired border radius
                            border: Border.all(
                              color: Color.fromARGB(255, 235, 236, 236),
                              width: 3.0, // Set your desired border color
                            ),
                          ),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset('images/${a[index].name}.png',
                                  height: 40),
                            ),
                            title: Text(
                              a[index].name,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              ' ${a[index].dateTime.year}-${a[index].dateTime.day}-${a[index].dateTime.month}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Text(
                              '\₹ ${a[index].amount}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                                color: a[index].transactionType == 'Income'
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ),
                        secondaryActions: [
                          IconSlideAction(
                            caption: 'Edit',
                            color: const Color.fromARGB(255, 250, 250, 250),
                            icon: Icons.edit,
                            onTap: () {
                              // Handle tap for edit (you can navigate to the edit screen)
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddScreen(
                                    editData: a[index],
                                  ),
                                ),
                              );
                            },
                          ),
                          IconSlideAction(
                            caption: 'Delete',
                            color: const Color.fromARGB(255, 253, 253, 253),
                            icon: Icons.delete,
                            onTap: () {
                              _showDeleteConfirmationDialog(a[index]);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: a.length,
                )
              : SliverChildListDelegate(
                  [
                    // Display your custom content for an empty list here
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Image.asset(
                          'images/three.png',
                          height: 300,
                          width: 300,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            "Empty ledger. Add transactions to start your financial story.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 67, 66, 66),
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
