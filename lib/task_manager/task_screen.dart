import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen>
    with SingleTickerProviderStateMixin {
  final StreamController<List<Map<String, dynamic>>> _tasksController =
      StreamController<List<Map<String, dynamic>>>.broadcast();
  int _selectedIndex = 0; // Track the selected tab index

  final List<Map<String, dynamic>> _tasks = [
    {
      'name': 'Prepare project report',
      'date': DateTime(2024, 9, 15),
      'time': const TimeOfDay(hour: 9, minute: 0),
      'progress': 50,
      'category': 'In Progress',
    },
    {
      'name': 'Complete code review',
      'date': DateTime(2024, 9, 16),
      'time': const TimeOfDay(hour: 14, minute: 30),
      'progress': 75,
      'category': 'In Progress',
    },
    {
      'name': 'Update documentation',
      'date': DateTime(2024, 9, 17),
      'time': const TimeOfDay(hour: 11, minute: 0),
      'progress': 0,
      'category': 'Not Started',
    },
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tasksController.add(_tasks);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tasksController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: const Text('Tasks'),
            pinned: true,
            floating: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://img.freepik.com/free-vector/task-concept-illustration_114360-22492.jpg?t=st=1725257513~exp=1725261113~hmac=d9372c5a636d1878ac2df82d7cde937fe6a992411d5196f6f7c12f9f63b7d22a&w=1380', // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black
                        .withOpacity(0.5), // Overlay with 50% opacity
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: TabBar(
                controller: _tabController,
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                indicatorColor: Colors.transparent, // Hide default indicator
                tabs: [
                  _buildCustomTab('Not Started', 0),
                  _buildCustomTab('In Progress', 1),
                  _buildCustomTab('Completed', 2),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTaskList('Not Started'),
                  _buildTaskList('In Progress'),
                  _buildTaskList('Completed'),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCustomTab(String title, int index) {
    final isSelected = _selectedIndex == index;
    return Container(
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isSelected ? Colors.white : Colors.transparent,
      ),
      child: Center(
        child: Text(
          title,
          // '$title (${_getTaskCount(index)})',

          style: TextStyle(
            color: isSelected
                ? Colors.black
                : const Color.fromARGB(255, 255, 255, 255),
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildTaskList(String category) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _tasksController.stream,
      initialData: _tasks,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final tasks = snapshot.data!
              .where((task) => task['category'] == category)
              .toList();

          if (tasks.isEmpty) {
            return const Center(child: Text('No tasks in this category'));
          }

          return CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return _buildTaskItem(tasks[index]);
                  },
                  childCount: tasks.length,
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text('No tasks available'),
          );
        }
      },
    );
  }

  void _addTask() {
    String newTask = '';
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();
    int progress = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Add New Task'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      onChanged: (value) {
                        newTask = value;
                      },
                      decoration: const InputDecoration(hintText: 'Enter task'),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      title: Text(
                          'Due Date: ${DateFormat('yMMMd').format(selectedDate)}'),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );
                        if (picked != null && picked != selectedDate) {
                          setState(() {
                            selectedDate = picked;
                          });
                        }
                      },
                    ),
                    ListTile(
                      title: Text('Due Time: ${selectedTime.format(context)}'),
                      trailing: const Icon(Icons.access_time),
                      onTap: () async {
                        TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                        );
                        if (picked != null && picked != selectedTime) {
                          setState(() {
                            selectedTime = picked;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text('Progress:'),
                        Expanded(
                          child: Slider(
                            value: progress.toDouble(),
                            min: 0,
                            max: 100,
                            divisions: 10,
                            label: '$progress%',
                            onChanged: (double value) {
                              setState(() {
                                progress = value.toInt();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Add'),
                  onPressed: () {
                    setState(() {
                      _tasks.add({
                        'name': newTask,
                        'date': selectedDate,
                        'time': selectedTime,
                        'progress': progress,
                        'category': _getCategoryFromProgress(progress),
                      });
                      _tasksController.add(_tasks);
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _editTaskProgress(Map<String, dynamic> task) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int currentProgress = task['progress'];
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Edit Task Progress'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Task: ${task['name']}'),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text('Progress:'),
                      Expanded(
                        child: Slider(
                          value: currentProgress.toDouble(),
                          min: 0,
                          max: 100,
                          divisions: 10,
                          label: '$currentProgress%',
                          onChanged: (double value) {
                            setState(() {
                              currentProgress = value.toInt();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Update'),
                  onPressed: () {
                    setState(() {
                      task['progress'] = currentProgress;
                      task['category'] =
                          _getCategoryFromProgress(currentProgress);
                      _tasksController.add(List.from(_tasks)); // Emit new data
                    });

                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  String _getCategoryFromProgress(int progress) {
    if (progress == 0) {
      return 'Not Started';
    } else if (progress < 100) {
      return 'In Progress';
    } else {
      return 'Completed';
    }
  }

  int _getTaskCount(int index) {
    String category;
    switch (index) {
      case 0:
        category = 'Not Started';
        break;
      case 1:
        category = 'In Progress';
        break;
      case 2:
        category = 'Completed';
        break;
      default:
        category = '';
    }
    return _tasks.where((task) => task['category'] == category).length;
  }

  Widget _buildTaskItem(Map<String, dynamic> task) {
    final date = task['date'];
    final time = task['time'];
    final formattedDate = DateFormat('yMMMd').format(date);
    final formattedTime = time.format(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          title: Text(task['name']),
          subtitle: Text(
            'Due: $formattedDate at $formattedTime\n'
            'Progress: ${task['progress']}%',
          ),
          trailing: _buildProgressIcon(task['progress']),
          onTap: () => _editTaskProgress(task),
        ),
      ),
    );
  }

  Widget _buildProgressIcon(int progress) {
    if (progress == 100) {
      return const Icon(Icons.check_circle, color: Colors.green);
    } else if (progress > 0) {
      return const Icon(Icons.hourglass_bottom, color: Colors.amber);
    } else {
      return const Icon(Icons.hourglass_empty, color: Colors.grey);
    }
  }
}
