import 'package:flutter/material.dart';
import 'package:solution_challenge/data/models/user.dart';
import 'package:solution_challenge/utils/custom_shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User _user;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    _user = await CustomSharedPreferences.getMyUser();
    setState(() {});

    print(_user.displayName);
  }

  Widget _buildBody() {
    if (_user != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(_user.photoUrl ??
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDWrIiYIAdOLTJ5Ql5YtMUvL3y3kK0Vh5JXQ&usqp=CAU"),
            ),
            title: Text(_user.displayName ?? 'Ankit'),
            subtitle: Text(_user.email),
          ),
          const Text("Signed in successfully."),
          ElevatedButton(
            child: const Text('SIGN OUT'),
            onPressed: () {
              print("Sign out");
            },
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("You are not currently signed in."),
          ElevatedButton(
            child: const Text('SIGN IN'),
            onPressed: () {
              print("Sign in");
            },
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }
}
