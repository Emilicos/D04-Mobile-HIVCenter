import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:tk_akhir/app_theme.dart';
import 'package:tk_akhir/pages/feedback_page.dart';
import 'package:tk_akhir/widgets/drawer.dart';

class AddFeedbackPage extends StatefulWidget {
  const AddFeedbackPage({super.key});

  @override
  State<AddFeedbackPage> createState() => _AddFeedbackPageState();
}

class _AddFeedbackPageState extends State<AddFeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String username = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Add Feedback',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Colors.black54,
          ),
        ),
      ),
      // Adding drawer menu
      drawer: const DrawerClass('Add Budget'),
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
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
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
                    maxLength: 50,
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Title tidak boleh kosong!';
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
                      hintText: "Description",
                    ),

                    onChanged: (String? value) {
                      setState(() {
                        description = value!;
                      });
                    },

                    onSaved: (String? value) {
                      setState(() {
                        description = value!;
                      });
                    },

                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Description tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppTheme.tagRed),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await request.post(
                          "https://pbp-d04.up.railway.app/feedback/create/", {
                        "title": title,
                        "username": username,
                        "description": description
                      }).then(
                        (value) => {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 15,
                                child: ListView(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    const Center(
                                        child: Text(
                                            'Feedback telah ditambahkan!')),
                                    const SizedBox(height: 20),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const FeedbackPage(
                                                        title: '')));
                                      },
                                      child: const Text('Kembali'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        },
                        // onError: (error) => {
                        //       showDialog(
                        //         context: context,
                        //         builder: (context) {
                        //           return Dialog(
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(10),
                        //             ),
                        //             elevation: 15,
                        //             child: ListView(
                        //               padding: const EdgeInsets.only(
                        //                   top: 20, bottom: 20),
                        //               shrinkWrap: true,
                        //               children: <Widget>[
                        //                 const Center(
                        //                     child: Text('Data Gagal dibuat')),
                        //                 const SizedBox(height: 20),
                        //                 TextButton(
                        //                   onPressed: () {
                        //                     Navigator.pop(context);
                        //                   },
                        //                   child: const Text('Kembali'),
                        //                 ),
                        //               ],
                        //             ),
                        //           );
                        //         },
                        //       )
                        //     }
                      );
                    }
                  },
                  // onPressed: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const FeedbackCard(title: '', username: '', description: '', )));
                  // },
                  child: const Text(
                    "Save Changes",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
