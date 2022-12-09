import 'package:flutter/material.dart';
import 'package:tk_akhir/app_theme.dart';
import 'package:tk_akhir/widgets/drawer.dart';

class AddExperiencePage extends StatefulWidget {
  const AddExperiencePage({super.key});

  @override
  State<AddExperiencePage> createState() => _AddExperiencePageState();
}

class _AddExperiencePageState extends State<AddExperiencePage> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String preview = '';
  String experience = '';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Form',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Colors.black54,
          ),
        ),
      ),
      // Adding drawer menu
      drawer: DrawerClass('Add Budget'),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(128, 212, 196, 1),
                        ),
                      ),
                      hintText: "Title",
                    ),

                    onChanged: (String? value) {
                        setState(() {
                          title = value!;
                        });
                      },
                    
                    onSaved: (String? value) {
                        setState(() {
                          title = value!;
                        });
                      },

                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Title cannot be empty!';
                      }else if (value.length > 100) {
                          return 'Judul tidak boleh lebih dari 100 karakter';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(128, 212, 196, 1),
                        ),
                      ),
                      hintText: "Experience",
                    ),

                    onChanged: (String? value) {
                        setState(() {
                          experience = value!;
                        });
                      },
                    
                    onSaved: (String? value) {
                        setState(() {
                          experience = value!;
                        });
                      },

                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Experience cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppTheme.lightPink),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
