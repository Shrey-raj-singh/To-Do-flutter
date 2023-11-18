import 'package:flutter/material.dart';

import '../Constants/Color.dart';
import '../Models/ToDoModel.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    Key? key,
    required this.todo,required this.onToDoChanged,required this.onDeleteItem,
  }) : super(key: key);
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {
          onToDoChanged(todo);
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: todo.isDone
            ? Icon(
                Icons.check_box,
                color: tdBlue,
              )
            : Icon(Icons.check_box_outline_blank),
        title: Text(
          todo.todoText,
          style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: () {
              onDeleteItem(todo.id);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            iconSize: 18,
          ),
        ),
      ),
    );
  }
}
