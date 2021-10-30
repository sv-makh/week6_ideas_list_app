import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Гениальные идеи"),
        centerTitle: true,
      ),
      body: IdeasList(),
    ),
  ));
}

class IdeasList extends StatefulWidget {
  @override
  _IdeasListState createState() => _IdeasListState();
}

class _IdeasListState extends State<IdeasList> {
  //список введённых пользователем идей
  final _ideas = <String>{};

  //контроллер для очистки поля ввода
  final _txtController = TextEditingController();

  @override
  void dispose() {
    _txtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            TextField(
              controller: _txtController,
              decoration: const InputDecoration(
                  hintText: "Введите идею",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              //ввод - по нажатию Enter
              onSubmitted: (String usersIdea) {
                setState(() {
                  _ideas.add(usersIdea);
                  _txtController.clear();
                });
              },
            ),
            Container(height: 100.0),
            Expanded(
                child: ListView.builder(
              itemCount: _ideas.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    color: Colors.black12,
                    height: 50.0,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: SingleChildScrollView(
                        //прокрутка текста идеи
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          _ideas.toList()[index],
                          style: const TextStyle(fontSize: 25),
                        )));
              },
            ))
          ],
        ));
  }
}
