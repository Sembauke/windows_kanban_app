import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Your local Kanban', home: MainPage());
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0x28, 0x28, 0x28, 1),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          KanbanRow(title: 'To Do'),
          KanbanRow(title: 'In Progress'),
          KanbanRow(title: 'Done')
        ],
      ),
    );
  }
}

class KanbanRow extends StatefulWidget {
  const KanbanRow({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => KanbanRowState();
}

class KanbanRowState extends State<KanbanRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 300,
            height: MediaQuery.of(context).size.height * 0.80,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.80,
            ),
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
              controller: ScrollController(),
              itemCount: 25,
              itemBuilder: (context, index) =>
                  const KanbanTile(title: 'tile', text: 'text'),
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 10,
                );
              },
            )),
      ],
    );
  }
}

class KanbanTile extends StatefulWidget {
  const KanbanTile({Key? key, required this.title, required this.text})
      : super(key: key);

  final String title;
  final String text;

  @override
  State<StatefulWidget> createState() => KanbanTileState();
}

class KanbanTileState extends State<KanbanTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: const Color.fromARGB(255, 34, 31, 26),
      title: Text(
        widget.title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
