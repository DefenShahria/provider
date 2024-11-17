import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/colorPlate.dart';
import '../../../state_holder/controller/completedTask_Controller.dart';
import '../../../state_holder/controller/statusChangeController.dart';
import '../../../state_holder/controller/taskDelet_controller.dart';


class Complete_Task extends StatefulWidget {
  const Complete_Task({super.key});

  @override
  State<Complete_Task> createState() => _Complete_TaskState();
}

class _Complete_TaskState extends State<Complete_Task> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CompleteTaskController>(context, listen: false).getCompleteTask();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Completed Task"),
        backgroundColor: Appcolor.primarycolor,
      ),
      body: Column(
        children: [
          Consumer<CompleteTaskController>(builder: (context, completeTaskController, child) {
                if (completeTaskController.completedtask == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: completeTaskController.completedtask.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      var task = completeTaskController.completedtask.data?[index];
                      if (task == null) {
                        return const SizedBox.shrink(); // Skip if task is null
                      }
                      return Container(
                        margin: const EdgeInsets.all(8.0), // Optional: Add margin to separate items
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0), // Optional: Add border radius
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    task.title ?? 'No title',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0), // Add some space between text elements
                                  Text(task.description ?? 'No description'),
                                  Text(task.createdDate ?? 'No date'),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  color: Colors.blue,
                                  onPressed: () {
                                    showStatusChangeDialog(task.sId ?? '', task.status ?? '');
                                  },
                                ),
                                Consumer<DeletPostController>(builder: (context, deletPostController, child) {
                                      return IconButton(
                                        icon: const Icon(Icons.delete),
                                        color: Colors.grey,
                                        onPressed: () async{
                                          await deletPostController.deletPost(task.sId ?? '');
                                          completeTaskController.getCompleteTask();
                                        },
                                      );
                                    }
                                ),
                              ],
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                );
              }
          ),
        ],
      ),
    );
  }


  void showStatusChangeDialog(String taskId, String currentStatus) {
    String? newStatus = currentStatus; // Start with current status

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Change Task Status'),
          content: DropdownButtonFormField<String>(
            value: newStatus,
            decoration: const InputDecoration(labelText: 'Select New Status'),
            items: const [
              DropdownMenuItem(
                value: 'New',
                child: Text('New'),
              ),
              DropdownMenuItem(
                value: 'Completed',
                child: Text('Completed'),
              ),
            ],
            onChanged: (value) {
              newStatus = value; // Update new status
            },
          ),
          actions: [
            Consumer<UpdatePostController>(
                builder: (context,updatePostController,child) {
                  return TextButton(
                    onPressed: () async {
                      if (newStatus != null) {
                        await updatePostController.updatePost(taskId, newStatus!);
                        Navigator.pop(context); // Close the dialog
                        Provider.of<CompleteTaskController>(context,listen: false).getCompleteTask(); // Refresh task list
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please select a status')),
                        );
                      }
                    },
                    child: const Text('Confirm'),
                  );
                }
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
