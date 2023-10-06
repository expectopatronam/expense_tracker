import 'package:flutter/material.dart';
import 'package:expense_tracker/expense_item.dart';
import 'package:expense_tracker/model/expense.dart';


class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
                key: ValueKey(expenses[index]),
                background: Container(color:const Color.fromARGB(170, 13, 13, 13),margin: EdgeInsets.symmetric(horizontal:Theme.of(context).cardTheme.margin!.horizontal)),
                onDismissed: (direction) => onRemoveExpense(expenses[index]),
                child: ExpenseItem(expenses[index])
                                                 )
                            );
                                     }                   
                                        }
