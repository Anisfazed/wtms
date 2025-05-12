import 'package:flutter/material.dart';
import 'package:wtms/view/loginscreen.dart';
import 'package:wtms/model/user.dart';
import 'package:wtms/view/registerscreen.dart';
import 'package:wtms/view/profilescreen.dart';

class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({super.key, required this.user});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Screen"),
        backgroundColor: const Color.fromARGB(255, 126, 126, 126),
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(user: widget.user)),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome ${widget.user.userName}",
          style: const TextStyle(fontSize: 24, color: Colors.blue),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (widget.user.userId == "0") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Add new product screen later")),
            );
          }
        },
        backgroundColor: const Color.fromARGB(255, 184, 185, 187),
        child: const Icon(Icons.add),
      ),
    );
  }
}
