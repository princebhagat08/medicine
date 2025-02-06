import 'package:flutter/material.dart';
import 'package:medicine/const/app_color.dart';
import 'package:medicine/const/app_img.dart';

class AddMedicine extends StatelessWidget {
  const AddMedicine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Add Medicines'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Medicine Name',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.mic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 20),

            // Compartment Section
            const Text('Compartment',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      width: 60,
                      height: 65,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12),
                        color:
                            index == 0 ? Colors.blue[50] : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Color Selection
            const SizedBox(height: 20),
            const Text('Colour',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  AppColor.pink,
                  AppColor.purple,
                  AppColor.red,
                  AppColor.green,
                  AppColor.orange,
                  AppColor.blue,
                  AppColor.yellow,
                ]
                    .map((color) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: color,
                          ),
                        ))
                    .toList(),
              ),
            ),

            // Medicine Type
            const SizedBox(height: 20),
            const Text('Type',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildTypeOption('Tablet', tablet),
                  const SizedBox(width: 20),
                  _buildTypeOption('Capsule', capsule),
                  const SizedBox(width: 20),
                  _buildTypeOption('Cream', cream),
                  const SizedBox(width: 20),
                  _buildTypeOption('Liquid', syrup),
                ],
              ),
            ),

            // Quantity Section
            const SizedBox(height: 20),
            const Text('Quantity',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                        child: Text(
                      'Take 1/2 Pill',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    )),
                  ),
                ),
                const SizedBox(width: 10),
                _buildQuantityButton(Icons.remove),
                const SizedBox(width: 10),
                _buildQuantityButton(Icons.add),
              ],
            ),

            // Total Count Section
            const SizedBox(height: 20),
            const Text('Total Count',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Slider(
              value: 75,
              min: 1,
              max: 100,
              divisions: 99,
              label: '75',
              onChanged: (value) {
                // Handle value change
              },
            ),

            // Date Selection
            const SizedBox(height: 20),
            const Text('Set Date',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Today',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'End Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    readOnly: true,
                  ),
                ),
              ],
            ),

            // Frequency Section
            const SizedBox(height: 20),
            const Text('Frequency of Days',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text('Everyday'),
                  items: null,
                  onChanged: (value) {},
                ),
              ),
            ),

            // Times per Day
            const SizedBox(height: 20),
            const Text('How many times a Day',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text('Three Time'),
                  items: null,
                  onChanged: (value) {},
                ),
              ),
            ),

            // Dose Times
            const SizedBox(height: 20),
            Column(
              children: [
                _buildDoseTimeOption('Dose 1'),
                const SizedBox(height: 10),
                _buildDoseTimeOption('Dose 2'),
                const SizedBox(height: 10),
                _buildDoseTimeOption('Dose 3'),
              ],
            ),

            // Food Timing Options
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFoodTimingOption('Before Food'),
                _buildFoodTimingOption('After Food'),
                _buildFoodTimingOption('Before Sleep'),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: const Text(
            'Add',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildTypeOption(String label, String icon) {
    return Column(
      children: [
        CircleAvatar(
          child: Image.asset(
            icon,
            height: 35,
          ),
          backgroundColor: AppColor.pink,
          radius: 40,
        ),
        const SizedBox(height: 5),
        Text(label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildQuantityButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: icon == Icons.add ? Colors.blue : Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon:
            Icon(icon, color: icon == Icons.add ? Colors.white : Colors.black),
        onPressed: () {},
      ),
    );
  }

  Widget _buildDoseTimeOption(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(label),
          const Spacer(),
          Radio(
            value: false,
            groupValue: null,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Widget _buildFoodTimingOption(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }
}
