import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar/providers/user_provider.dart';
import 'Login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(
      text: Provider.of<UserProvider>(context, listen: false).username,
    );
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: _logout)],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50), // Add an image asset
              ),
              SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Save the username using the provider
                  Provider.of<UserProvider>(
                    context,
                    listen: false,
                  ).setUsername(_usernameController.text);
                  setState(() {});
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
