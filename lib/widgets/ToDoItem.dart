import 'package:flutter/material.dart';

import '../Constants/Color.dart';
import '../Models/ToDoModel.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  const ToDoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {
          // setStat
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
            onPressed: () {},
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
