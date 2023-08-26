import 'package:flutter/material.dart';

class MissingItemTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //1st containrt
          Container(
            color: Colors.black12,
            child: Column(
      children: [

        Column(
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Select Tanker",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10,),
                DropdownButton<String>(
                  items: ["Tanker 1", "Tanker 2", "Tanker 3"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {},
                  value: "Tanker 1",
                ),

              ],
            ),
            SizedBox(height: 16.0),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Before Transfer", style: TextStyle(fontSize: 18))),
            ],
            ),//lala column
        //lala card
            SizedBox(height: 16.0),
            Container(
              color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Enter Fat"),
                                SizedBox(width: 8.0),
                                Text("4.75"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Enter SNF"),
                                SizedBox(width: 8.0),
                                Text("4.75"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Read Fat and SNF"),
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Save"),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                          "Enter Quantity Transfer"
                      ),
                      SizedBox(width: 8.0,),
                      Text("6000l")
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Confirm Transfer"),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
              ],
            ),
      ]
            ),
          ),
          SizedBox(height: 10,),
          //2nd container before transfer sample test
          Container(
            color: Colors.orangeAccent,
            child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 16.0),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Before Transfer Sample testing", style: TextStyle(fontSize: 18))),
                    ],
                  ),//lala column
                  //lala card
                  SizedBox(height: 16.0),
                  Container(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Enter Fat"),
                                      SizedBox(width: 8.0),
                                      Text("4.75"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Enter SNF"),
                                      SizedBox(width: 8.0),
                                      Text("4.75"),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 8.0),


                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("save"),
                              style: ElevatedButton.styleFrom(primary: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Generate Dispatch"),
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                      ),
                    ],
                  ),
                ]
            ),
          ),
        ],

      ),
    );
  }
}
/*
class MissingItemTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Missing Item Screen Content"),
    );
  }
}*/
