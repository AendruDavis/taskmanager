import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskListFormScreen extends StatefulWidget {
  const TaskListFormScreen({super.key});

  @override
  State<TaskListFormScreen> createState() => _TaskListFormScreenState();
}

class _TaskListFormScreenState extends State<TaskListFormScreen> {
  final List<Map<String, dynamic>> _tasks = [
    {
      'name': 'Prepare project report',
      'date': DateTime(2024, 9, 15),
      'time': const TimeOfDay(hour: 9, minute: 0),
      'progress': 50,
    },
    {
      'name': 'Complete code review',
      'date': DateTime(2024, 9, 16),
      'time': const TimeOfDay(hour: 14, minute: 30),
      'progress': 75,
    },
    {
      'name': 'Update documentation',
      'date': DateTime(2024, 9, 17),
      'time': const TimeOfDay(hour: 11, minute: 0),
      'progress': 30,
    },
  ];

  final TextEditingController _nameController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  double _progress = 0;

  void _addTask() {
    if (_nameController.text.isNotEmpty &&
        _selectedDate != null &&
        _selectedTime != null) {
      setState(() {
        _tasks.add({
          'name': _nameController.text,
          'date': _selectedDate,
          'time': _selectedTime,
          'progress': _progress,
        });
        _nameController.clear();
        _selectedDate = null;
        _selectedTime = null;
        _progress = 0;
      });
    }
  }

  void _editTask(int index) {
    setState(() {
      _nameController.text = _tasks[index]['name'];
      _selectedDate = _tasks[index]['date'];
      _selectedTime = _tasks[index]['time'];
      _progress = _tasks[index]['progress'];
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: _buildForm(),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _tasks[index] = {
                    'name': _nameController.text,
                    'date': _selectedDate,
                    'time': _selectedTime,
                    'progress': _progress,
                  };
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List and Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildForm(),
            const SizedBox(height: 20),
            _buildTaskList(),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Task Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  }
                },
                child: Text(
                  _selectedDate == null
                      ? 'Select Date'
                      : 'Date: ${DateFormat.yMMMd().format(_selectedDate!)}',
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: _selectedTime ?? TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    setState(() {
                      _selectedTime = pickedTime;
                    });
                  }
                },
                child: Text(
                  _selectedTime == null
                      ? 'Select Time'
                      : 'Time: ${_selectedTime!.format(context)}',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text('Progress: ${_progress.round()}%'),
            Expanded(
              child: Slider(
                value: _progress,
                min: 0,
                max: 100,
                divisions: 100,
                label: _progress.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _progress = value;
                  });
                },
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: _addTask,
          child: const Text('Add Task'),
        ),
      ],
    );
  }

  Widget _buildTaskList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return Card(
            child: ListTile(
              title: Text(task['name']),
              subtitle: Text(
                'Date: ${DateFormat.yMMMd().format(task['date'])} - '
                'Time: ${task['time'].format(context)}\n'
                'Progress: ${task['progress']}%',
              ),
              onTap: () => _editTask(index), // Open the modal to edit the task
            ),
          );
        },
      ),
    );
  }
}
