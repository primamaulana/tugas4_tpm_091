import 'package:favorite_meals/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'),),
      body: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // This global key is used to assign to the [Form] and retrieve
  // the form state for various operations like validation.
  final _formKey = GlobalKey<FormState>();

  // These text controllers are used to assign the
  // controller of username and password [TextFormField].
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String username = "admin";
  String password = "123";

  // This method saves the authKey and navigate to
  // [DashboardPage] upon success.
  void _saveAuthCredentials(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    final isAuthStored = await prefs.setBool('isAuth', value);

    if (isAuthStored) {
      // Checking if the widget is still in the widget tree after an async gap.
      // It is done to ensure that the widget is still visible.
      if (mounted) {
        // The page is now routed to the [DashboardPage].
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return const TabsScreen();
          }),
        );
      }
    }
  }

  Future checkLogin()async{
    if (_usernameController.text == username && _passwordController.text == password) {

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('username', _usernameController.text);

      Navigator.push(context, MaterialPageRoute(builder: (context)=>TabsScreen(),),);
      Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else{
      Fluttertoast.showToast(
          msg: "Username & Password Invalid!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Form(
        // The global key is assign to the [Form] to retrieve the [FormState] later.
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                label: Text('Username'),
                labelStyle: TextStyle(color: Colors.white),
              ),

              // Validation login is defined here.
              // It checks for null and minimum 6 character in length for value.
              // validator: (value) {
              //   if (value != null && value.length >= 6) {
              //     // null is returned if validation is success.
              //     return null;
              //   }
              //
              //   // Error message to be displayed is return if validation fails.
              //   return 'Username should be at least 6 characters';
              // },
            ),
            TextFormField(
              controller: _passwordController,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                label: Text('Password'),
                labelStyle: TextStyle(color: Colors.white),
              ),

              // Validation login is defined here.
              // It checks for null and minimum 6 character in length for value.
              // validator: (value) {
              //   if (value != null && value.length >= 6) {
              //     // null is returned if validation is success.
              //     return null;
              //   }
              //
              //   // Error message to be displayed is return if validation fails.
              //   return 'Password should be at least 6 characters';
              // },
            ),
            const SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                // The validation on the [FormState] is executed
                // and the result is retrieved here.
                // final isValid = _formKey.currentState?.validate();
                //
                // // Upon valid [FormState] the credentials are stored to prefs.
                // if (isValid ?? false) {
                //   // save the isAuth value to shared preference
                //   _saveAuthCredentials(isValid!);
                // }
                checkLogin();
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

