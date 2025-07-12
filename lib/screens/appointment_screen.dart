import 'package:flutter/material.dart';

class AppointmentHistoryScreen extends StatelessWidget {
  const AppointmentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF2C2C2E),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
              ),
              padding: const EdgeInsets.only(top: 50, bottom: 30),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Spacer(),
                        const Icon(Icons.menu, size: 28, color: Colors.white),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/profileimage.jpg'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Doe John",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: const Text(
                "Appointment History",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),

            _buildAppointmentCard(
              title: "Hair dry",
              stylist: "Lucy",
              date: "10.April.2023",
              dayTime: "Tue, Afternoon",
              time: "2:00pm",
              price: "\$20",
            ),
            _buildAppointmentCard(
              title: "Makeup",
              stylist: "Laila",
              date: "30.March.2023",
              dayTime: "Tue, Morning",
              time: "9:00am",
              price: "\$120",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentCard({
    required String title,
    required String stylist,
    required String date,
    required String dayTime,
    required String time,
    required String price,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Stylist
          Text(
            "Hair stylish : $stylist",
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 6),

          // Day and Time
          Row(
            children: [
              Text(
                dayTime,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                "at $time",
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Price
          Text(
            "Price of Service : $price",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.greenAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
