import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  int selectedDay = DateTime.now().day;
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  String? selectedTime;

  List<DateTime> getDaysInMonth() {
    final firstDay = DateTime(selectedYear, selectedMonth, 1);
    final nextMonth = DateTime(selectedYear, selectedMonth + 1, 1);
    final lastDay = nextMonth.subtract(const Duration(days: 1));
    return List.generate(
      lastDay.day,
          (index) => DateTime(selectedYear, selectedMonth, index + 1),
    );
  }

  void nextMonth() {
    setState(() {
      if (selectedMonth == 12) {
        selectedMonth = 1;
        selectedYear++;
      } else {
        selectedMonth++;
      }
      selectedDay = 1;
    });
  }

  void previousMonth() {
    setState(() {
      if (selectedMonth == 1) {
        selectedMonth = 12;
        selectedYear--;
      } else {
        selectedMonth--;
      }
      selectedDay = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final days = getDaysInMonth();
    final monthName = DateFormat.MMMM().format(DateTime(selectedYear, selectedMonth));

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E), // Dark masculine background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 25),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF2C2C2E), // Darker header
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    // Header Row
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
                        ),
                        const Spacer(),
                        const Text(
                          'Book Appointment',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.more_horiz, size: 20, color: Colors.transparent),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Month Selection
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: previousMonth,
                          icon: const Icon(Icons.chevron_left, color: Colors.white),
                        ),
                        Text(
                          "$monthName $selectedYear",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: nextMonth,
                          icon: const Icon(Icons.chevron_right, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Dates
                    SizedBox(
                      height: 90,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: days.length,
                        itemBuilder: (context, index) {
                          final day = days[index];
                          final isSelected = day.day == selectedDay &&
                              day.month == selectedMonth &&
                              day.year == selectedYear;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDay = day.day;
                              });
                            },
                            child: Container(
                              width: 55,
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.white : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat.E().format(day),
                                    style: TextStyle(
                                      color: isSelected ? Colors.black : Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    day.day.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: isSelected ? Colors.black : Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TimeSection(
                      title: 'Morning',
                      times: ['9:00', '10:00', '11:00'],
                      selectedTime: selectedTime,
                      onTimeSelected: (time) => setState(() => selectedTime = time),
                    ),
                    const SizedBox(height: 20),
                    TimeSection(
                      title: 'Afternoon',
                      times: ['1:00', '2:00', '3:00', '4:00', '5:00', '6:00'],
                      selectedTime: selectedTime,
                      onTimeSelected: (time) => setState(() => selectedTime = time),
                    ),
                    const SizedBox(height: 30),

                    const Text(
                      "Choose Your Barber",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 12),

                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          final images = [
                            'assets/images/stylist1.png',
                            'assets/images/stylist2.png',
                            'assets/images/stylist3.png',
                            'assets/images/stylist4.png',
                            'assets/images/stylist5.png',
                          ];
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(images[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    _buildServiceTile("Beard Trim", "\$20"),
                    _buildServiceTile("Haircut + Beard", "\$45"),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3A3A3C),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Book Appointment',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceTile(String service, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF2C2C2E),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(service, style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }
}

class TimeSection extends StatelessWidget {
  final String title;
  final List<String> times;
  final String? selectedTime;
  final Function(String) onTimeSelected;

  const TimeSection({
    super.key,
    required this.title,
    required this.times,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.circle, size: 10, color: Colors.blueAccent),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: times.map((time) {
            final isSelected = selectedTime == time;
            return GestureDetector(
              onTap: () => onTimeSelected(time),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blueGrey : null,
                  border: Border.all(color: Colors.blueGrey.shade200),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
