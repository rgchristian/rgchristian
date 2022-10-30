import 'package:flutter/material.dart';
import 'package:profileapp/model/student.dart';


class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var formKey = GlobalKey<FormState>();

  TextEditingController idnumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  String? selectedGender;

  List genders = ['Female', 'Male'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: idnumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                  hintText: "i.e. 2020301045",
                  labelText: "ID Number"
              ),
              validator: (value) {
                return (value == '') ? 'Please enter ID Number' : null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  hintText: "Name",
                  labelText: "Name"
              ),
              validator: (value) {
                return (value == '') ? 'Please enter name' : null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: birthdateController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  hintText: "Birthdate",
                  labelText: "Birthdate"
              ),
              validator: (value) {
                return (value == '') ? 'Please enter your birthday' : null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: courseController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  hintText: "Course",
                  labelText: "Course"
              ),
              validator: (value) {
                return (value == '') ? 'Please enter your course' : null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: sectionController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  hintText: "Section",
                  labelText: "Section"
              ),
              validator: (value) {
                return (value == '') ? 'Please enter your section' : null;
              },
            ),
            const SizedBox(height: 20),
            ButtonTheme(
              alignedDropdown: true,
              child: DropdownButtonFormField(
                items: [
                  ...genders.map((gender) => DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                      ))
                ],
                value: selectedGender,
                decoration: const InputDecoration(
                  hintText: "Click the dropdown button",
                  labelText: "Gender",
                ),
              validator: (value){
                  return value == null ? 'Please Select Gender' : null;
              },
              onChanged: (value){
                setState(() {
                  selectedGender = value as String;
                });

              }
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    var isFormValid = formKey.currentState!.validate();
                    if (isFormValid) {
                      Student newstudentlist = Student(
                          idnumber: idnumberController.text,
                          name: nameController.text,
                          birthday: birthdateController.text,
                          gender: selectedGender,
                          yearsection: sectionController.text,
                          course: courseController.text
                      );
                      Navigator.pop(context, newstudentlist);
                    }
                  },
                  child: const Text('Submit')
              ),
            )
          ],
        ),
      ),
    );
  }
}
