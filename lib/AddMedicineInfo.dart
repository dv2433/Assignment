import 'package:flutter/material.dart';

class AddMedicineInfo extends StatefulWidget {
  @override
  _AddMedicineInfoState createState() => _AddMedicineInfoState();
}

class _AddMedicineInfoState extends State<AddMedicineInfo> {
  List<TimeOfDay> times = [TimeOfDay(hour: 8, minute: 0)];
  List<String> doses = ['5 ml'];
  String frequency = 'Daily';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color.fromARGB(200, 0, 2, 42)),
          onPressed: () {
            Navigator.pop(context,false);
            // Handle back action
          },
        ),
        title: Text(
          'Add Medicine Info',
          style: TextStyle(color: Color.fromARGB(200, 0, 2, 42), fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle Next action
            },
            child: Text(
              'Next',
              style: TextStyle(color: Colors.teal, fontSize: 16),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Medicine name',
                    hintStyle: TextStyle(color: Color.fromARGB(
                        145, 85, 93, 124)),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text('Frequency', style: TextStyle(fontSize: 18,color: Color.fromARGB(200, 0, 2, 72), fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.zero,
                        width: width*0.45,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(200, 238, 238, 255),
                          border: Border(
                            left: BorderSide(
                              color: Color.fromARGB(200, 0, 4, 108),
                              width: 3,
                            ),
                          ),
                        ),
                        child: RadioListTile<String>(
                          title: const Text('Daily',style: TextStyle(fontSize: 12),),
                          value: 'Daily',
                          groupValue: frequency,
                          onChanged: (value) {
                            setState(() {
                              frequency = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.zero,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(200, 238, 238, 255),
                            border: Border(
                              left: BorderSide(
                                color: Color.fromARGB(200, 0, 4, 108),
                                width: 3,
                              ),
                            ),
                          ),
                          child: RadioListTile<String>(
                            title: const Text('Specific Day',style: TextStyle(fontSize: 12),),
                            value: 'Specific Day',
                            groupValue: frequency,
                            onChanged: (value) {
                              setState(() {
                                frequency = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.zero,
                        width: width*0.45,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(200, 238, 238, 255),
                          border: Border(
                            left: BorderSide(
                              color: Color.fromARGB(200, 0, 4, 108),
                              width: 3,
                            ),
                          ),
                        ),
                        child: RadioListTile<String>(
                          title: const Text('Interval',style: TextStyle(fontSize: 12),),
                          value: 'Interval',
                          groupValue: frequency,
                          onChanged: (value) {
                            setState(() {
                              frequency = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.zero,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(200, 238, 238, 255),
                            border: Border(
                              left: BorderSide(
                                color: Color.fromARGB(200, 0, 4, 108),
                                width: 3,
                              ),
                            ),
                          ),
                          child: RadioListTile<String>(
                            title: const Text('As needed',style: TextStyle(fontSize: 12),),
                            value: 'As needed',
                            groupValue: frequency,
                            onChanged: (value) {
                              setState(() {
                                frequency = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: times.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              TimeOfDay? newTime = await showTimePicker(
                                context: context,
                                initialTime: times[index],
                              );
                              if (newTime != null) {
                                setState(() {
                                  times[index] = newTime;
                                });
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromARGB(255, 4, 0, 122),),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                times[index].format(context),
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.teal, // Set your desired border color here
                                  width: 2.0, // Optional: set the width of the border
                                ),
                                borderRadius: BorderRadius.circular(8.0), // Optional: set the border radius
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 4, 0, 122), // Set your desired border color here
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 5, 0, 136), // Set your desired border color here
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              hintText: 'Dose',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(145, 85, 93, 124),
                              ),
                            ),
                            controller: TextEditingController(text: doses[index]),
                            onChanged: (value) {
                              doses[index] = value;
                            },
                          ),

                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      times.add(TimeOfDay(hour: 8, minute: 0));
                      doses.add('5 ml');
                    });
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add more alarm'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 244, 244, 255),
                    iconColor: Colors.teal,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
