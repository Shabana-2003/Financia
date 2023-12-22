import 'package:financia/widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:financia/data/model/hivemodels.dart';
import 'add.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<Favorite> {
  final Box<FinancesData> box = Hive.box<FinancesData>('data');
  List<FinancesData> searchResults = [];
  final List<String> day = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => Bottom(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: const Color.fromARGB(255, 11, 11, 11),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Favorites',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 2, 2, 2),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: Color.fromARGB(255, 33, 119, 70),
                child: ValueListenableBuilder(
                  valueListenable: box.listenable(),
                  builder: (context, value, child) {
                    List<FinancesData> favoriteList =
                        box.values.where((data) => data.isFavorite).toList();
                    if (favoriteList.isEmpty) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 45,
                            ),
                            Image.asset(
                              'images/search.png',
                              height: 300,
                              width: 300,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                'No favorite transactions found \nAdd to Favorites for quick access and insights.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 78, 78, 78),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => Bottom(),
                                  ),
                                );
                              },
                              child: const Text('Add to Favorite'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 47, 125, 121)),
                                fixedSize: MaterialStateProperty.all<Size>(
                                  Size(200, 70),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: favoriteList.length,
                      itemBuilder: (context, index) {
                        return getList(favoriteList[index], index);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getList(FinancesData history, int index) {
    if (history.type == 'profile') {
      return SizedBox.shrink();
    }
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddScreen(editData: history),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 4,
            top: 4,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Color.fromARGB(255, 235, 236, 236),
                width: 3.0,
              ),
            ),
            child: get(index, history),
          ),
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          caption: 'Edit',
          color: const Color.fromARGB(255, 250, 250, 250),
          icon: Icons.edit,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddScreen(editData: history),
              ),
            );
          },
        ),
        IconSlideAction(
          caption: 'Delete',
          color: const Color.fromARGB(255, 253, 253, 253),
          icon: Icons.delete,
          onTap: () {
            _showDeleteConfirmationDialog(history);
          },
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

  ListTile get(int index, FinancesData history) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset('images/${history.name}.png', height: 40),
      ),
      title: Text(
        history.name,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        '${day[history.dateTime.weekday - 1]}  ${history.dateTime.year}-${history.dateTime.day}-${history.dateTime.month}',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        '\₹ ${history.amount}',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 19,
          color:
              history.transactionType == 'Income' ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
