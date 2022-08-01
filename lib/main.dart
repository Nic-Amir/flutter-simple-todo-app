import 'package:flutter/material.dart';

void main() => {runApp(const App())};

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo demo',
      theme: ThemeData.dark(),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> todosTitle = <String>[""];
  final List<String> todosDesc = <String>[""];

  @override
  Widget build(BuildContext context) {
    TextEditingController todoController = TextEditingController();
    TextEditingController descController = TextEditingController();

    void addTextToArr() {
      setState(() {
        todosTitle.insert(0, todoController.text);
        todosDesc.insert(0, descController.text);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("LESGO!"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: todoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Todos',
                hintText: 'Enter Your Todo',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: descController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Descreption',
                hintText: 'Your Todo Description',
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemCount: todosTitle.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 130,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                '${todosTitle[index]}',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              '${todosDesc[index]}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          )
                        ],
                      ));
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider()),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTextToArr();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
