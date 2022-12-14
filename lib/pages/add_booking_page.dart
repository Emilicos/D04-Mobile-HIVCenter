import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:tk_akhir/pages/booking_page.dart';

import '../app_theme.dart';
import '../utils/fetch_dokter.dart';

class AddBookingPage extends StatefulWidget {
  const AddBookingPage ({Key? key}) : super(key: key);

  @override
  State<AddBookingPage> createState() => _AddBookingPageState();
}

class _AddBookingPageState extends State<AddBookingPage> {
  final _formKey = GlobalKey<FormState>();
  String? dokter;
  List<String> listNamaDokter = [];
  String tanggal = DateTime.now().toString().substring(0, 10);
  String waktu = "${TimeOfDay.now().toString().substring(10, 15)}:00";
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BookingPage())
            );
          },
        ),
        title: const Text(
          'Book An Appointment',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Colors.black54,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                // DOKTER
                FutureBuilder<List<String>>(
                  future: fetchDokter(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data!;
                      if (data.isEmpty) {
                        return const Center(
                          child: Text(
                            'Doctors are currently unavailable',
                            style: TextStyle(
                              color: AppTheme.grey,
                              fontSize: 17.0,
                            )
                          ),
                        );
                      } else {
                        dokter = dokter ?? data[0];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 12.0,),
                            const Text(
                              'Doctor',
                              style: TextStyle(
                                color: AppTheme.grey,
                                fontSize: 14.0,
                              )
                            ),
                            const SizedBox(height: 10.0),
                            DropdownButton(
                              value: dokter,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: data
                              .map((String val) => DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              ))
                              .toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  dokter = value!;
                                });
                              }
                            ),

                            const SizedBox(height: 20.0),

                            ListTile(
                              title: Text(tanggal.toString()),
                              leading: TextButton.icon(
                                icon: const Icon(
                                  Icons.calendar_today,
                                  color: AppTheme.grey),
                                label: const Text(
                                  "Date",
                                  style: TextStyle(color: AppTheme.grey)
                                ),
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2099),
                                  ).then((date) {
                                    setState(() {
                                      tanggal = date.toString().substring(0, 10);
                                    });
                                  });
                                },
                              ),
                            ),

                            const SizedBox(height: 20.0),

                            ListTile(
                              title: Text(waktu),
                              leading: TextButton.icon(
                                icon: const Icon(
                                  Icons.lock_clock,
                                  color: AppTheme.grey
                                ),
                                label: const Text(
                                  "Time",
                                  style: TextStyle(color: AppTheme.grey)
                                ),
                                onPressed: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((time) {
                                    setState(() {
                                      waktu = "${time.toString().substring(10, 15)}:00";
                                    });
                                  });
                                },
                              ),
                            ),

                            const SizedBox(height: 20.0),

                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(AppTheme.lightPink),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  
                                  await request.post(
                                      "https://pbp-d04.up.railway.app/booking/add/",
                                      {
                                        "doctor": dokter,
                                        "date": tanggal,
                                        "time": waktu
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
                                                        child: Text('Apoointment booked successfully')),
                                                      const SizedBox(height: 20),
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(builder: (context) => const BookingPage())
                                                          );
                                                        },
                                                        child: const Text('Back'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            )
                                          },
                                      );
                                }
                              },
                              child: const Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),

                          ]
                        ); 
                      }
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
                ),
              ],
            )
          ),
        )        
      ),
    );
  }
}