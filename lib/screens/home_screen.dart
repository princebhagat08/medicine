import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../const/app_img.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  void _previousDay() {
    setState(() {
      selectedDate = selectedDate.subtract(const Duration(days: 1));
    });
  }

  void _nextDay() {
    setState(() {
      selectedDate = selectedDate.add(const Duration(days: 1));
    });
  }

  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEEE, MMM d');
    return formatter.format(date);
  }

  String _formatDate2(DateTime date, int day) {
    final adjustedDate = date.add(Duration(days: -day));
    return DateFormat('E').format(adjustedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hi Harry!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '5 Medicines Left',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.camera_alt_outlined),
                        onPressed: () {},
                      ),
                      const CircleAvatar(
                        backgroundImage: NetworkImage(demoProfileImgUrl),
                        backgroundColor: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),

              // Date selector
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _formatDate2(selectedDate, 2),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.grey),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            _formatDate2(selectedDate, 1),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: _previousDay,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            _formatDate(selectedDate),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: _nextDay,
                      ),
                    ],
                  ),
                  Expanded(
                    // Same fix as above
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _formatDate2(selectedDate, -1),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.grey),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            _formatDate2(selectedDate, -2),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Medication list
              const SizedBox(height: 20),
              _buildTimeSection(
                  'Morning 08:00 am', 'Before Breakfast', 'Day 01', 'Taken'),
              _buildTimeSection(
                  'Afternoon 02:00 pm', 'After Food', 'Day 27', 'Snoozed'),
              _buildTimeSection(
                  'Night 09:00 pm', 'Before Sleep', 'Day 03', 'Left'),

            ],
          ),
        ),
      ),
    );
  }



  Widget _buildTimeSection(
      String time, String instruction, String day, String status) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          height: 85,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.medication_outlined),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Calpol 500mg Tablet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(instruction),
                        const SizedBox(width: 8),
                        Text('Day $day'),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_outlined,
                    size: 24,
                    color: status == 'Taken'
                        ? Colors.green
                        : status == 'Snoozed'
                        ? Colors.orange
                        : Colors.grey,
                  ),
                  Text(status,style: TextStyle(fontSize: 12),)
                ],
              )
              
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
