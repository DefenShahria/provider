import 'package:Practice_provider/ui/state_holder/controller/addTask_controller.dart';
import 'package:Practice_provider/ui/state_holder/controller/completedTask_Controller.dart';
import 'package:Practice_provider/ui/state_holder/controller/main_bottomnav_Controller.dart';
import 'package:Practice_provider/ui/state_holder/controller/new_taskcontroller.dart';
import 'package:Practice_provider/ui/state_holder/controller/signUpController.dart';
import 'package:Practice_provider/ui/state_holder/controller/signinController.dart';
import 'package:Practice_provider/ui/state_holder/controller/statusChangeController.dart';
import 'package:Practice_provider/ui/state_holder/controller/taskDelet_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'application/app.dart';



void main() {
  runApp(
    MultiProvider(
      providers:  [
        ChangeNotifierProvider(create: (context) => MainBottomNavController()),
        ChangeNotifierProvider(create: (context) => SigninController()),
        ChangeNotifierProvider(create: (context) => SignUpController()),
        ChangeNotifierProvider(create: (context) => CompleteTaskController()),
        ChangeNotifierProvider(create: (context) => NewTaskController()),
        ChangeNotifierProvider(create: (context) => DeletPostController()),
        ChangeNotifierProvider(create: (context) => AddNewTaskController()),
        ChangeNotifierProvider(create: (context) => UpdatePostController()),
      ],
      child: const MyApp(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CounterScreen(),
//     );
//   }
// }
//
// class CounterScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final counter = Provider.of<Counter>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Provider Counter Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '${counter.count}',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             onPressed: counter.increment,
//             tooltip: 'Increment',
//             child: Icon(Icons.add),
//           ),
//           SizedBox(height: 10),
//           FloatingActionButton(
//             onPressed: counter.decrement,
//             tooltip: 'Decrement',
//             child: Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }
