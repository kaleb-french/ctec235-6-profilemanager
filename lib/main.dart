import 'package:flutter/material.dart';
import 'form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapter 7',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:
          ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();


}

class _ProfileScreenState extends State<ProfileScreen> {
  //f
  String _currentUsername = 'Guest';
  //m
  void _updateUsername(String newName){
    setState(() {
      _currentUsername = newName;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile Manager"),
      ),
      body: Column(
        children: [
          UserBanner(userName: _currentUsername),
          ProfileForm(onSaveUsername: _updateUsername,),
        ]
      )
    );
  }
}

class UserBanner extends StatelessWidget{
  const UserBanner({super.key, required this.userName});
  //f
  final String userName;
  //m
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome $userName!"),
          FavoriteButton(),
        ],
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget{
  const FavoriteButton({super.key});

  @override
  State<StatefulWidget> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>{
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorited ? Icons.star : Icons.star_border,
        color: _isFavorited ? Colors.amber : Colors.grey,
      ),
      onPressed:  () {
        setState(() {
          _isFavorited = !_isFavorited;
        });
      },
    );
  }


}