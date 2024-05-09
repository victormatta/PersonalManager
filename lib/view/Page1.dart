import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_manager/controller/user_controller.dart';
import 'package:personal_manager/model/user.dart';
import 'package:personal_manager/view/Page2.dart';

class Page1 extends StatefulWidget {

  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Page 1", style: TextStyle(color: Colors.white),),),
        backgroundColor: Colors.blue.shade500,
      ),
      body: Obx(() =>
      userController.userIsReal.value ? RealUser(user: userController.user.value) : const UnrealUser()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(const Page2()),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.accessibility_new,
        color: Colors.white70,
        ),
        ),
    );
  }
}

class RealUser extends StatelessWidget {
  final User user;

  const RealUser({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text("Personal data"),
          const Divider(),
          ListTile(title: Text("Name: ${user.name}")),
          ListTile(title: Text("Age: ${user.age}")),
          ListTile(title: Text("Location: ${user.location}")),
          const Text("Job"),
          const Divider(),
          ListTile(title: Text("Job 1: ${user.jobs![0]}")),
          ListTile(title: Text("Job 2: ${user.jobs![1]}")),
          const Divider(),
          const Text("Favorite Serie"),
          ...user.jobs!.map((jobs) =>
            ListTile(title: Text(jobs)),
          )
          // ListTile(title: Text("Serie 1: ${user.serie![0]}")),
          // ListTile(title: Text("Serie 2: ${user.serie![1]}")),
          // ListTile(title: Text("Serie 3: ${user.serie![2]}")),
        ],
      ),
    );
  }
}

class UnrealUser extends StatelessWidget {
  const UnrealUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.blue,
          ),
          SizedBox(height: 15),
          Text("User not found."),
        ],
      )
      ),
    );
  }
}