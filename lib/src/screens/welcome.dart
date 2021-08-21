import 'package:bloc_exercice/src/database/database.dart';
import 'package:flutter/material.dart';

class Homem extends StatefulWidget {
  const Homem({Key? key}) : super(key: key);

  @override
  _HomemState createState() => _HomemState();
}

class _HomemState extends State<Homem> {
  getTasks() async {
    final tasks = await DatabaseProvider.instance.getList();
    print(tasks);
    return tasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvienue'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
              future: getTasks(),
              builder: ( context, AsyncSnapshot<dynamic> snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          
                          title: Text(snapshot.data[index]['email']) ,
                          subtitle:Text(snapshot.data[index]['password']) ,
                        ),
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
