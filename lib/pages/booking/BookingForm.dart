
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tk_akhir/app_theme.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tk_akhir/widgets/active_blogpost_card.dart';
import 'package:tk_akhir/widgets/drawer.dart';
import 'package:tk_akhir/widgets/tile_column.dart';
import 'package:tk_akhir/widgets/top_container.dart';

import 'package:intl/intl.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({Key? key}) : super(key: key);

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();
  
  TextEditingController dateinput = TextEditingController(); 

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Budget')
      ),
      // Adding drawer menu
      drawer: DrawerClass('Booking Form'),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                controller: dateinput, //editing controller of this TextField
                decoration: InputDecoration( 
                   icon: Icon(Icons.calendar_today), //icon of text field
                   labelText: "Enter Date" //label text of field
                ),
                readOnly: true,  //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );
                  
                  if(pickedDate != null ){
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                         dateinput.text = formattedDate; //set output date to TextField value. 
                      });
                  } else {
                      print("Date is not selected");
                  }
                },
             )

               

              ],
            ),
          ),
        ),
      ),  
    );
  }
}
