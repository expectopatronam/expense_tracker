import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category { food, leisure, work, travel }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String title;
  final double amount;
  final String id;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  
  
  const ExpenseBucket({required this.category,required this.expenses});
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category) : expenses = allExpenses.where((expense)=> expense.category == category).toList();


  final List<Expense> expenses;
  final Category category;

 double get totalExpenses {
   double sum = 0;
 
    for (final expense in expenses) {
     sum +=expense.amount;
  }
  return sum;
}}