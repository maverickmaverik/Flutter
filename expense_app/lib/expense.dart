import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

enum ExpenseType {
  Food,
  Transport,
  Shopping,
  Health,
  Entertainment,
  Others,
}