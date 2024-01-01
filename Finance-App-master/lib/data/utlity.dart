import 'package:hive/hive.dart';
import 'package:financia/data/model/hivemodels.dart';

int totals = 0;

final box = Hive.box<FinancesData>('data');



int total() {
  var history2 = box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].transactionType == 'Income'
        ? int.parse(history2[i].amount)
        : int.parse(history2[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

int income() {
  var history2 = box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].transactionType == 'Income'
        ? int.parse(history2[i].amount)
        : 0);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

int expenses() {
  var history2 = box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].transactionType == 'Income'
        ? 0
        : int.parse(history2[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List<FinancesData> today() {
  List<FinancesData> a = [];
  DateTime date = DateTime.now();
  var history2 = box.values.toList();
  for (var i = 0; i < history2.length; i++) {
    if (isSameDay(history2[i].dateTime, date)) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<FinancesData> week() {
  List<FinancesData> a = [];
  DateTime date = DateTime.now();
  var history2 = box.values.toList();
  for (var i = 0; i < history2.length; i++) {
    if (isSameWeek(history2[i].dateTime, date)) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<FinancesData> month() {
  List<FinancesData> a = [];
  DateTime date = DateTime.now();
  var history2 = box.values.toList();
  for (var i = 0; i < history2.length; i++) {
    if (isSameMonth(history2[i].dateTime, date)) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<FinancesData> year() {
  List<FinancesData> a = [];
  DateTime date = DateTime.now();
  var history2 = box.values.toList();
  for (var i = 0; i < history2.length; i++) {
    if (isSameYear(history2[i].dateTime, date)) {
      a.add(history2[i]);
    }
  }
  return a;
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

bool isSameWeek(DateTime date1, DateTime date2) {
  int daysDifference = date1.difference(date2).inDays;
  return daysDifference >= -date2.weekday && daysDifference < 7 - date2.weekday;
}

bool isSameMonth(DateTime date1, DateTime date2) {
  return date1.year == date2.year && date1.month == date2.month;
}

bool isSameYear(DateTime date1, DateTime date2) {
  return date1.year == date2.year;
}

int total_chart(List<FinancesData> history2) {
  List a = [0, 0];

  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].transactionType == 'Income'
        ? int.parse(history2[i].amount)
        : int.parse(history2[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List time(List<FinancesData> history2, bool hour) {
  List<FinancesData> a = [];
  List total = [];
  int counter = 0;
  for (var c = 0; c < history2.length; c++) {
    for (var i = c; i < history2.length; i++) {
      if (hour) {
        if (history2[i].dateTime.hour == history2[c].dateTime.hour) {
          a.add(history2[i]);
          counter = i;
        }
      } else {
        if (history2[i].dateTime.day == history2[c].dateTime.day) {
          a.add(history2[i]);
          counter = i;
        }
      }
    }
    total.add(total_chart(a));
    a.clear();
    c = counter;
  }
  print(total);
  return total;
}

//
List<FinancesData> incomeTransactions() {
  List<FinancesData> a = [];
  var history2 = box.values.toList();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].transactionType == 'Income') {
      a.add(history2[i]);
    }
  }
  return a;
}

List<FinancesData> expenseTransactions() {
  List<FinancesData> a = [];
  var history2 = box.values.toList();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].transactionType == 'Expense') {
      a.add(history2[i]);
    }
  }
  return a;
}
