import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/colorPlate.dart';
import '../state_holder/controller/main_bottomnav_Controller.dart';
import '../state_holder/controller/new_taskcontroller.dart';
import 'bottomnav_bar/complete_task/complete_task.dart';
import 'bottomnav_bar/my_profile/profile.dart';
import 'bottomnav_bar/new_task/new_task.dart';


class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  final List<Widget> _screens = [
    const New_task(),
    const Complete_Task(),
    const Profile(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NewTaskController>(context, listen: false).getNewTask();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainBottomNavController>(
      builder: (context, controller, child) {
        return Scaffold(
          body: _screens[controller.currentSelectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentSelectedIndex,
            onTap: controller.changeScreen,
            selectedItemColor: Appcolor.primarycolor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            elevation: 4,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.reviews_outlined), label: 'In progress'),
              BottomNavigationBarItem(icon: Icon(Icons.note_alt_outlined), label: 'Complete'),
              BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}
