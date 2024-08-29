import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'AddMedicineInfo.dart';

class DeviceSettingsScreen extends StatefulWidget {
  @override
  _DeviceSettingsScreenState createState() => _DeviceSettingsScreenState();
}

class _DeviceSettingsScreenState extends State<DeviceSettingsScreen> {
  bool _vacationTimeEnabled = false;
  bool _showMedsName = false;
  bool _notifyPharma = false;
  bool _addSorryTime = false;

  String? selectedValue;
  String? _selectedAlarmTune = 'Rooster';
  String? _selectedAlarmStrength = 'Louder';
  String? _selectedSnooze = '5mins';

  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color.fromARGB(200, 0, 2, 42),),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Device Settings',
          style: TextStyle(color: Color.fromARGB(200, 0, 2, 42), fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AddMedicineInfo()));
            },
            child: Text(
              'Next',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Vacation Settings'),
              _buildSwitchTile('Set vacation time', _vacationTimeEnabled,
                      (bool value) {
                    setState(() {
                      _vacationTimeEnabled = value;
                    });
                  }),
              SizedBox(height: 8),
              if (_vacationTimeEnabled) ...[
                _buildDateTimePicker('Start date & time', _startDate,
                        (DateTime date) {
                      setState(() {
                        _startDate = date;
                      });
                    }),
                SizedBox(height: 8),
                _buildDateTimePicker('End date & time', _endDate,
                        (DateTime date) {
                      setState(() {
                        _endDate = date;
                      });
                    }),
              ],
              SizedBox(height: 20),
              _buildSectionTitle('Device Preferences'),
              _buildSwitchTile('Show meds name', _showMedsName, (bool value) {
                setState(() {
                  _showMedsName = value;
                });
              }),
              SizedBox(height: 8),
              _buildSwitchTile('Notify pharma to autofill', _notifyPharma,
                      (bool value) {
                    setState(() {
                      _notifyPharma = value;
                    });
                  }),
              SizedBox(height: 8),
              _buildSwitchTile('Add sorry time', _addSorryTime, (bool value) {
                setState(() {
                  _addSorryTime = value;
                });
              }),
              SizedBox(height: 8),
              _buildSectionTitle('Occupied Cabinets'),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(
                      color: Color.fromARGB(200, 0, 2, 72),
                      width: 3,
                    ),
                  ),
                ),
                child: Transform.scale(
                  scale: 0.9,
                  child: Row(
                    children: [
                      Text(
                        '1, 2, 3, 4, 5',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildSectionTitle('Alarm Settings'),
              _buildDropdownField('Alarm tune', _selectedAlarmTune,
                  ['Rooster', 'Chimes', 'Sweet piano']),
              _buildDropdownField('Alarm strength', _selectedAlarmStrength,
                  ['Low', 'Medium', 'Louder']),
              _buildDropdownField(
                  'Snooze', _selectedSnooze, ['5mins', '10mins', '15mins']),
            ],
          )
        // ],
        // ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(200, 0, 2, 72),
        ),
      ),
    );
  }

  Widget _buildSwitchTile(
      String title, bool value, ValueChanged<bool> onChanged) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border(
          left: BorderSide(
            color: Color.fromARGB(
                200, 0, 4, 108),
            width: 3,
          ),
        ),
      ),
      // color: Colors.indigo,
      child: Transform.scale(
        scale: 0.9,
        child: SwitchListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          value: value,
          onChanged: onChanged,
          activeColor: Color.fromARGB(
              255, 0, 22, 59),
          inactiveThumbColor: Color.fromARGB(
              255, 0, 22, 59),
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
        ),
      ),
    );
  }

  Widget _buildDateTimePicker(
      String label, DateTime? date, ValueChanged<DateTime> onDateSelected) {
    TextEditingController _controller = TextEditingController(
      text: date != null ? DateFormat.yMMMd().add_jm().format(date) : '',
    );

    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border(
          left: BorderSide(
            color: Color.fromARGB(200, 4, 6, 72),
            width: 3,
          ),
        ),
      ),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: Icon(Icons.calendar_today, color: Color.fromARGB(200, 0, 4, 108)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        ),
        style: TextStyle(fontSize: 16),
        readOnly: true, // Ensure that the keyboard doesn’t open
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: date ?? DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (pickedDate != null) {
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(date ?? DateTime.now()),
            );
            if (pickedTime != null) {
              DateTime finalDateTime = DateTime(
                pickedDate.year,
                pickedDate.month,
                pickedDate.day,
                pickedTime.hour,
                pickedTime.minute,
              );
              onDateSelected(finalDateTime);
              _controller.text = DateFormat.yMMMd().add_jm().format(finalDateTime);
            }
          }
        },
      ),
    );
  }

  Widget _buildDropdownField(String label, String? value, List<String> options) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border(
            left: BorderSide(
              color: Color.fromARGB(200, 4, 6, 72),
              width: 3,
            ),
          ),
        ),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: label,
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            border: InputBorder.none, // Remove the default border
          ),
          value: value,
          items: options.map((option) {
            return DropdownMenuItem(
              value: option,
              child: Text(option,style: TextStyle(color: Color.fromARGB(
                  200, 0, 3, 129),),),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              if (label == 'Alarm tune') {
                _selectedAlarmTune = newValue;
              } else if (label == 'Alarm strength') {
                _selectedAlarmStrength = newValue;
              } else if (label == 'Snooze') {
                _selectedSnooze = newValue;
              }
            });
          },
          icon: Icon(Icons.arrow_drop_down, color: Color.fromARGB(
              200, 0, 4, 108),),
        ),
      ),
    );
  }
}
