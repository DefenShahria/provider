import 'package:Practice_provider/application/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/colorPlate.dart';
import '../ui/state_holder/controller/addTask_controller.dart';
import '../ui/state_holder/controller/completedTask_Controller.dart';
import '../ui/state_holder/controller/main_bottomnav_Controller.dart';
import '../ui/state_holder/controller/new_taskcontroller.dart';
import '../ui/state_holder/controller/signUpController.dart';
import '../ui/state_holder/controller/signinController.dart';
import '../ui/state_holder/controller/statusChangeController.dart';
import '../ui/state_holder/controller/taskDelet_controller.dart';


// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => MainBottomNavController()),
//         ChangeNotifierProvider(create: (context) => SigninController()),
//         ChangeNotifierProvider(create: (context) => SignUpController()),
//         ChangeNotifierProvider(create: (context) => CompleteTaskController()),
//         ChangeNotifierProvider(create: (context) => NewTaskController()),
//         ChangeNotifierProvider(create: (context) => DeletPostController()),
//         ChangeNotifierProvider(create: (context) => AddNewTaskController()),
//         ChangeNotifierProvider(create: (context) => UpdatePostController()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Appcolor.more),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
