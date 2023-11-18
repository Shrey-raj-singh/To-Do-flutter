import 'package:flutter/material.dart';
import '../Constants/Color.dart';
import '../Models/ToDoModel.dart';
import '../widgets/ToDoItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todosList = ToDo.todoList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      drawer: CustomDrawer(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                _searchBar(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          "All To-Dos",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToDo todo in todosList)
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: _handleToDoChange, 
                          onDeleteItem: _DeleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          AddToDo(),
        ],
      ),
    );
  }
  void _handleToDoChange (ToDo todo){
    setState(() {
      todo.isDone =!todo.isDone;
    });
  }
  void _DeleteToDoItem (String id ){
    setState(() {
      todosList.removeWhere((element) => element.id == id);
    });
  }
  Align AddToDo() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.0),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Add a New To-Do item",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          )),
          Container(
            margin: EdgeInsets.only(bottom: 20, right: 20),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "+",
                style: TextStyle(fontSize: 40),
              ),
              style: ElevatedButton.styleFrom(
                primary: tdBlue,
                minimumSize: Size(60, 60),
                elevation: 10,
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Align(
        alignment: Alignment.centerRight,
        child: CircleAvatar(
          child: Icon(
            Icons.person,
            size: 27,
          ),
          backgroundColor: tdGrey,
        ),
      ),
    );
  }
}


class _searchBar extends StatelessWidget {
  const _searchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 25,
            maxHeight: 20,
          ),
          border: InputBorder.none,
          hintText: 'Search..',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 200.0, // Set the preferred width
        padding: EdgeInsets.all(16.0),
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text(
                'Item 1',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Handle Item 1
              },
            ),
            ListTile(
              title: Text(
                'Item 2',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Handle Item 2
              },
            ),
            // Add more items as needed
          ],
        ),
      ),
    );
  }
}
