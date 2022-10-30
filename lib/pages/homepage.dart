import 'package:flutter/material.dart';
import 'package:profileapp/model/student.dart';
import 'package:profileapp/pages/detailspage.dart';
import 'package:profileapp/pages/formpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Student stud =
  Student(
    idnumber: '',
    name: '',
    birthday: '',
    gender: '',
    yearsection: '',
    course: '',

  );
  List information =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 4'),
      ),
      body: ListView.builder(
        itemCount: information.length,
        itemBuilder: (context, index){
          return Dismissible(
            key: Key(index.toString()),
            onDismissed: (dismiss) {
              setState(() {
                information.removeAt(index);
              });
            },
            child: Card(
              child: ListTile(
                title: Text(information[index].name),
                subtitle: Text('${information[index].course} - ${information[index].yearsection}'),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=> DetailsPage(details: information[index])
                      )
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Student newlistinfo = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context )=> const FormPage())
          );
          if(newlistinfo.idnumber != null){
            setState(() {
              information.add(newlistinfo);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
