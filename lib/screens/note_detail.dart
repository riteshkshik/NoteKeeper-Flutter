import 'dart:ffi';

import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {
  const NoteDetail({Key? key}) : super(key: key);

  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  var _priorities = ["High", "Low"];
  var _currentItemSelected = "Low";

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();



  @override
  Widget build(BuildContext context) {

    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: [
            ListTile(
              title: DropdownButton(
                items: _priorities.map(
                    (e){
                      return DropdownMenuItem(child: Text(e), value: e,);
                    }
                ).toList(),
                onChanged: (String? newValueSelected){
                  setState(() {
                    _currentItemSelected = newValueSelected!;
                  });
                },
                value: _currentItemSelected,
              ),
            ),
            // Second Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value){
                  debugPrint("Something changed in Title Text Field");
                },
                decoration: InputDecoration(
                  labelText: "Title",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
            ),

            //Third Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: descriptionController,
                style: textStyle,
                onChanged: (value){
                  debugPrint("Something changed in Description Text Field");
                },
                decoration: InputDecoration(
                    labelText: "Description",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),

            //Fourth Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: [
                  // save button
                  Expanded(
                    child: ElevatedButton(
                      child: Text("Save", textScaleFactor: 1.5,),
                      onPressed: (){
                        debugPrint("Save Button Clicked");
                      },
                    ),
                  ),

                  //Container for spacing between buttons
                  Container(width: 5.0,),

                  //delete button
                  Expanded(
                    child: ElevatedButton(
                      child: Text("Delete", textScaleFactor: 1.5,),
                      onPressed: (){
                        debugPrint("Delete Button Clicked");
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
