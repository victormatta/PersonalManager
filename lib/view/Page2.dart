import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_manager/controller/user_controller.dart';
import 'package:personal_manager/model/user.dart';
import 'package:personal_manager/view/Page1.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    // int currentAge = userController.user.value.age!;

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Page 2", style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.blue.shade500,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              userController.createUser(User(name: "Victor", age: 20, location: "Mogi das Cruzes", jobs: ["Software Engineer", "Mobile Developer"], serie: ["Silicon Valley", "You", "Pesadelo na cozinha"]));
              Get.to(const Page1());
            }, 
            child: const Text("Definir Usuário", style: TextStyle(color: Colors.white)), 
            style: const ButtonStyle(backgroundColor: 
            MaterialStatePropertyAll(Colors.blue),
            ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              userController.changeAge();
              Get.to(const Page1());
            },
             style: const ButtonStyle(backgroundColor: 
             MaterialStatePropertyAll(Colors.blue)),
            child: const Text("Mudar Idade", style: TextStyle(color: Colors.white),)),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              userController.addWork("Job -${userController.user.value.jobs!.length + 1}");
              Get.to(const Page1());
            }, 
            style: const ButtonStyle(backgroundColor: 
            MaterialStatePropertyAll(Colors.blue),
            ),
            child: const Text("Adicionar Profissão", style: TextStyle(color: Colors.white)),
            ),
            
          ],
        ),
      ),
    );
  }
}