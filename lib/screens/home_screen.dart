import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/appointment_screen.dart';
import 'package:saloon_app/screens/calender_screen.dart';
import 'package:saloon_app/screens/payment_screen.dart';
import 'package:saloon_app/screens/setting_screen.dart';

class UserProvider with ChangeNotifier {
  String userName = 'Doe John';
  String phone = '+732 8888 111';
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const CalenderScreen()));
    } else if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const AppointmentHistoryScreen()));
    } else if (index == 3) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentScreen()));
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      drawer: Drawer(
        backgroundColor: const Color(0xFF2C2C2E),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF3A3A3C)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profileimage.jpg'),
                  ),
                  const SizedBox(height: 10),
                  Text(user.userName, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(user.phone, style: const TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            _buildDrawerItem(Icons.home, 'Home', () => Navigator.pop(context)),
            _buildDrawerItem(Icons.settings, 'Settings', () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
            }),
            _buildDrawerItem(Icons.logout, 'Logout', () {
              SystemNavigator.pop();
            }),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Builder(
        builder: (context) => SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context, user),
                const SizedBox(height: 20),
                _buildPromoBanner(),
                const SizedBox(height: 30),
                const Text("Categories", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                _buildCategoryGrid(),
                const SizedBox(height: 20),
                const Text("Hair Specialist", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                _buildSpecialistList(user),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color(0xFF2C2C2E),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }

  Widget _buildHeader(BuildContext context, UserProvider user) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: const Icon(Icons.menu, size: 28, color: Colors.white),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Hi!", style: TextStyle(color: Colors.white, fontSize: 18)),
              Text(user.userName, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600, fontFamily: 'DancingScript')),
            ],
          ),
        ),
        const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage('assets/images/profileimage.jpg'),
        ),
      ],
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF3A3A3C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Look Awesome &\nSave Some", style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                Text("Exclusive Men's Deals", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/images/man makeup.png', height: 135, width: 100, fit: BoxFit.cover),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryGrid() {
    final categories = [
      {"title": "Hair Style", "image": 'assets/images/hairstyle.jpg'},
      {"title": "Hair Spa", "image": 'assets/images/hairspa.jpg'},
      {"title": "Shampoo", "image": 'assets/images/shampoos.jpg'},
      {"title": "Hair dryer", "image": 'assets/images/hair_dryer.jpg'},
      {"title": "Facial", "image": 'assets/images/facial.jpg'},
      {"title": "Makeup", "image": 'assets/images/makeup_kit.jpg'},
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 20,
      mainAxisSpacing: 30,
      children: categories.map((cat) => _buildCategory(cat["title"]!, cat["image"]!)).toList(),
    );
  }

  Widget _buildCategory(String title, String image) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
      alignment: Alignment.center,
      child: Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildSpecialistList(UserProvider user) {
    final specialists = [
      {"name": "Doe John", "image": 'assets/images/specialist1.jpg'},
      {"name": "Edward", "image": 'assets/images/specialist2.png'},
      {"name": "Tom", "image": 'assets/images/specialist3.png'},
    ];

    return SizedBox(
      height: 170,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: specialists.map((sp) => _buildSpecialistCard(sp["name"]!, user.phone, sp["image"]!)).toList(),
      ),
    );
  }

  Widget _buildSpecialistCard(String name, String phone, String image) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        border: Border.all(color: Colors.grey.shade800),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(image, height: 100, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
                const Row(
                  children: [
                    Icon(Icons.star, size: 14, color: Colors.white),
                    Icon(Icons.star, size: 14, color: Colors.white),
                    Icon(Icons.star_border, size: 14, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 2),
                Text(phone, style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
