import 'package:hive/hive.dart';
part 'hivemodels.g.dart';

@HiveType(typeId: 1)
class FinancesData extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String purpose;
  @HiveField(2)
  String amount;
  @HiveField(3)
  String transactionType;
  @HiveField(4)
  DateTime dateTime;
  @HiveField(5)
  bool isFavorite;
  String get type => transactionType;
  FinancesData(
      this.transactionType, this.amount, this.dateTime, this.purpose, this.name,
      {this.isFavorite = false});
}

@HiveType(typeId: 2)
class ProfileData extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String gender;
  @HiveField(2)
  String nickName;
  @HiveField(3)
  late String profilePhotoPath;

  ProfileData(this.name, this.gender, this.nickName, this.profilePhotoPath);
}
