import 'package:flutter/material.dart';
import 'package:reminder_app/src/presentation/Screens/add_screen.dart';
import 'package:reminder_app/src/presentation/Screens/complete_screen.dart';
import 'package:reminder_app/src/presentation/Screens/favorite_screen.dart';
import 'package:reminder_app/src/presentation/Screens/my_drawer.dart';
import 'package:reminder_app/src/presentation/Screens/pending_screen.dart';

class Tabscreen extends StatefulWidget {
  Tabscreen({super.key});
  static const id = 'tab_screen';

  @override
  State<Tabscreen> createState() => _TabscreenState();
}

class _TabscreenState extends State<Tabscreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': PendingScreen(), 'title': 'Pending Tasks'},
    {'pageName': CompScreen(), 'title': 'Completed Tasks'},
    {'pageName': FavScreen(), 'title': 'Favourite Tasks'},
  ];

  var _selectedPageIndex = 0;

  TextEditingController titleController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();

  void _addtask(BuildContext context) {
    showModalBottomSheet(
    
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddScreen(titleController: titleController,
                 discriptionController: discriptionController,),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: [
          IconButton(
              onPressed: () => _addtask(context), icon: (Icon(Icons.add)))
        ],
      ),
      drawer: DrawerClass(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: 
      _selectedPageIndex == 0
      ? 
      FloatingActionButton(
        onPressed: () => _addtask(context),
        tooltip: 'AddTask',
        child: Icon(Icons.add),
      ):null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
              _selectedPageIndex = index;
          });
        
        },
        items:const [
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle_sharp), label: "Pending Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: "Complete Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "favourite Tasks")
        ],
      ),
    );
  }
}
