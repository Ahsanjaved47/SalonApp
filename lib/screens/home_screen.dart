// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class UserProvider with ChangeNotifier {
//   String userName = 'Doe John';
//   String phone = '+732 8888 111';
// }
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserProvider>(context);
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFFDFDFD),
//
//       drawer: Drawer(
//         backgroundColor: Colors.white,
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: const BoxDecoration(color: Color(0xFFFF5B5B)),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const CircleAvatar(
//                     backgroundImage: AssetImage('assets/images/profileimage.jpg'),
//                     radius: 30,
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     user.userName,
//                     style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     user.phone,
//                     style: const TextStyle(color: Colors.white70),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.home),
//               title: const Text('Home'),
//               onTap: () => Navigator.pop(context),
//             ),
//             ListTile(
//               leading: const Icon(Icons.settings),
//               title: const Text('Settings'),
//               onTap: () => Navigator.pop(context),
//             ),
//             ListTile(
//               leading: const Icon(Icons.logout),
//               title: const Text('Logout'),
//               onTap: () => Navigator.pop(context),
//             ),
//           ],
//         ),
//       ),
//
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         toolbarHeight: 0,
//       ),
//
//       body: Builder(
//         builder: (context) => SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // ✅ Greeting Row (fixed)
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () => Scaffold.of(context).openDrawer(),
//                     child: const Icon(Icons.menu, size: 28),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text("Hi!",
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.w400)),
//                         Text(
//                           user.userName,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.w600,
//                             fontFamily: 'DancingScript',
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   const CircleAvatar(
//                     backgroundImage: AssetImage('assets/images/profileimage.jpg'),
//                     radius: 22,
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 20),
//
//               // Banner
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFFF5B5B),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: const [
//                           Text(
//                             "Look Awesome &\nSave Some",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 23,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 16),
//                           Text(
//                             "Get Upto 50% off",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.asset(
//                         'assets/images/man makeup.png',
//                         height: 135,
//                         width: 100,
//                         fit: BoxFit.cover,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 30),
//
//               const Text(
//                 "Categories",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//
//               const SizedBox(height: 20),
//
//               // Categories Grid
//               GridView.count(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 30,
//                 children: [
//                   _buildCategory("Hair Style", 'assets/images/hairstyle.jpg'),
//                   _buildCategory("Hair Spa", 'assets/images/hairspa.jpg'),
//                   _buildCategory("Shampoo", 'assets/images/shampoos.jpg'),
//                   _buildCategory("Hair dryer", 'assets/images/hair_dryer.jpg'),
//                   _buildCategory("Facial", 'assets/images/facial.jpg'),
//                   _buildCategory("Makeup", 'assets/images/makeup_kit.jpg'),
//                 ],
//               ),
//
//               const SizedBox(height: 20),
//
//               const Text(
//                 "Hair Specialist",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//
//               const SizedBox(height: 10),
//
//               // Specialists List
//               SizedBox(
//                 height: 170,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     _buildSpecialistCard("Doe John", user.phone,
//                         'assets/images/specialist1.jpg'),
//                     _buildSpecialistCard("Edward", user.phone,
//                         'assets/images/specialist2.png'),
//                     _buildSpecialistCard("Tom", user.phone,
//                         'assets/images/specialist3.png'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: const Color(0xFFFFEAEA),
//         selectedItemColor: const Color(0xFFFF5B5B),
//         unselectedItemColor: Colors.grey,
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: ''),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.chat_bubble_outline), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCategory(String title, String image) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         image: DecorationImage(
//           image: AssetImage(image),
//           fit: BoxFit.cover,
//           colorFilter:
//           const ColorFilter.mode(Colors.black45, BlendMode.darken),
//         ),
//       ),
//       alignment: Alignment.center,
//       child: Text(
//         title,
//         textAlign: TextAlign.center,
//         style: const TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSpecialistCard(String name, String phone, String image) {
//     return Container(
//       width: 130,
//       margin: const EdgeInsets.only(right: 12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade200),
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//       ),
//       child: Column(
//         children: [
//           ClipRRect(
//             borderRadius:
//             const BorderRadius.vertical(top: Radius.circular(12)),
//             child: Image.asset(
//               image,
//               height: 100,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(name,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.w600, fontSize: 14)),
//                 Row(
//                   children: const [
//                     Icon(Icons.star, size: 14, color: Colors.red),
//                     Icon(Icons.star, size: 14, color: Colors.red),
//                     Icon(Icons.star_border, size: 14, color: Colors.red),
//                   ],
//                 ),
//                 const SizedBox(height: 2),
//                 Text(phone, style: const TextStyle(fontSize: 12))
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/setting_screen.dart';
import 'calender_screen.dart';

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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const CalenderScreen()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SettingsScreen()), // <- redirect to Settings
      );
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
                    backgroundImage: AssetImage('assets/images/profileimage.jpg'),
                    radius: 30,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.userName,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(user.phone, style: const TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            _buildDrawerItem(Icons.home, 'Home'),
            _buildDrawerItem(Icons.settings, 'Settings'),
            _buildDrawerItem(Icons.logout, 'Logout'),
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
                const Text("Categories", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 20),
                _buildCategoryGrid(),
                const SizedBox(height: 20),
                const Text("Hair Specialist", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
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

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () => Navigator.pop(context),
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
              const Text("Hi!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white)),
              Text(
                user.userName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, fontFamily: 'DancingScript', color: Colors.white),
              )
            ],
          ),
        ),
        const SizedBox(width: 10),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/profileimage.jpg'),
          radius: 22,
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
        border: Border.all(color: Colors.grey.shade800),
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF2C2C2E),
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
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white)),
                const Row(
                  children: [
                    Icon(Icons.star, size: 14, color: Colors.white),
                    Icon(Icons.star, size: 14, color: Colors.white),
                    Icon(Icons.star_border, size: 14, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 2),
                Text(phone, style: const TextStyle(fontSize: 12, color: Colors.white70))
              ],
            ),
          )
        ],
      ),
    );
  }
}
