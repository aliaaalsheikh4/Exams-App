import 'package:exams_app1/dumydata.dart';
import 'package:exams_app1/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF094546),
      automaticallyImplyLeading: false,
      title: Image.asset('lib/assets/appbar_logo.png'),
      actions: [
        IconButton(
          icon: const Icon(Icons.info, color: Color(0xFFEBFCFD)),
          onPressed: () {
            Navigator.pushNamed(context, '/info');
          },
        ),
        IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFFEBFCFD)),
          onPressed: () {
            final scaffold = Scaffold.of(context);
            scaffold.openEndDrawer();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

//Custom Drawer

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String? username;
  bool showSettings = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
        child: Column(
          children: [
            if (!showSettings)
              Container(
                height: 230,
                width: double.infinity,
                color: const Color(0xFF094546),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 32),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: const Color(0x00000000),
                      ),
                      child: Image.asset('lib/assets/Profile.png'),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      username = DummyData.users.firstWhere(
                        (user) => user['id'] == userid,
                      )['username']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: showSettings
                  ? _buildSettings(context)
                  : _buildMainMenu(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainMenu(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Center(child: Text('My Profile')),
          onTap: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
        const Divider(color: Color(0xFF008081), thickness: 1),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Center(child: Text('Other\'s ranks')),
          onTap: () {
            Navigator.pushNamed(context, '/ranks');
          },
        ),
        const Divider(color: Color(0xFF008081), thickness: 1),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Center(child: Text('Reviews')),
          onTap: () {
            Navigator.pushNamed(context, '/reviews');
          },
        ),
        const Divider(color: Color(0xFF008081), thickness: 1),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Center(child: Text('Settings')),
          onTap: () {
            setState(() {
              showSettings = true;
            });
          },
        ),
        const Divider(color: Color(0xFF008081), thickness: 1),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Center(child: Text('Log out')),
          onTap: () {
            DummyData.users
                    .firstWhere((user) => user['id'] == userid)['isLoggedIn'] =
                false;
            Navigator.pushNamed(context, '/login');
          },
        ),
        const Divider(color: Color(0xFF008081), thickness: 1),
      ],
    );
  }

Widget _buildSettings(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color(0xFF094546),
      title: const Text(
        'Settings',
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFFEBFCFD),
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Color(0xFFEBFCFD),
        ),
        onPressed: () {
          setState(() {
            showSettings = false; 
          });
          Navigator.pop;
        },
      ),
      automaticallyImplyLeading: true, 
    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ListTile(
            title: const Text('My Account'),
            onTap: () {
              Navigator.pushNamed(context, '/myaccount');
            },
          ),
          const Divider(color: Color(0xFF008081), thickness: 1),
          ListTile(
            title: const Text('Notification'),
            onTap: () {
              Navigator.pushNamed(context, '/notification');
            },
          ),
          const Divider(color: Color(0xFF008081), thickness: 1),
        ],
      ),
    ),
  );
}
}

class InputTexts extends StatelessWidget {
  final TextEditingController controller;

  const InputTexts({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFFFFFFFF),
        ),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            fillColor: Color(0xFFFFFFFF),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class BottomBarIndex extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

//

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomBarIndex>(context);

    return Container(
      height: 52,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0x60094546),
            width: 1.0, 
          ),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: const Color(0xFFEBFCFD),
        iconSize: 22.0,
        selectedLabelStyle: const TextStyle(
            fontSize: 10), 
        currentIndex: provider.currentIndex,
        selectedItemColor: const Color(0xFF094546), 
        unselectedItemColor: const Color(0xFFB0BEC5),
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFEBFCFD),
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFEBFCFD),
            icon: Icon(Icons.emoji_events),
            label: 'Contests',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFEBFCFD),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFEBFCFD),
            icon: Icon(Icons.group),
            label: 'Faq',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFEBFCFD),
            icon: Icon(Icons.money),
            label: 'Plans',
          ),
        ],
        onTap: (index) {
          provider.updateIndex(index);
          if (index == 0) {
            Navigator.pushNamed(context, '/calendar');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/contests');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/homepage');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/faq');
          } else if (index == 4) {
            Navigator.pushNamed(context, '/plans');
          }
        },
      ),
    );
  }
}
