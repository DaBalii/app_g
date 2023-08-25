import 'package:flutter/material.dart';
import 'package:zon_gneapp/screens/Login.dart';
import 'package:zon_gneapp/service/api_service.dart';

class SignUpPage extends StatefulWidget {

  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;
  bool registrationSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            gradient: LinearGradient(
              colors: [Color(0xFF707070), Color(0xFF404040)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        title: Text("S'enregistrer"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              Image.asset("images/maison.png", width: 200),
              SizedBox(height: 50),
              _inputField(context),
              _signIn(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          "Zon Gné",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text("Create an account"),
      ],
    );
  }

  TextEditingController nameController = TextEditingController();

  TextEditingController prenomController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController telController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController password_confimationController =
      TextEditingController();

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: "Full Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: prenomController,
          decoration: InputDecoration(
            hintText: "Last name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: "Email Address",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.email),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: telController,
          decoration: InputDecoration(
            hintText: "Tel",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.phone),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme
                .of(context)
                .primaryColor
                .withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.lock),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
          obscureText: _obscureText,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: password_confimationController,
          decoration: InputDecoration(
            hintText: "Password_confirmation",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.lock),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
          obscureText: _obscureText,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            String name = nameController.text;
            String prenom = prenomController.text;
            String email = emailController.text;
            String tel = telController.text;
            String password = passwordController.text;
            String password_confirmation = password_confimationController.text;

            await ApiService()
                .registerUser(
                name, prenom, email, tel, password, password_confirmation)
                .then((value) {
              if (value['code'] == 201) {
                var data = value['content'];
                print(data);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginApp()),
                );
              } else {
                var errorData = value['content'];
                print(errorData);
              }
            });
          },
          child: Text(
            "S'enregistrer",
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        if (this.registrationSuccess)
          Text(
            "Inscription réussie !",
            style: TextStyle(color: Colors.green),
          ),
      ],
    );
  }

  _signIn(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?"),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginApp()),
            );
          },
          child: Text("Sign In"),
        ),
      ],
    );
  }
}

Widget _header() {
  return const Column(
    children: [
      Text(
        "Zon Gné",
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text("Password Recovery"),
    ],
  );
}

Widget _inputField() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      TextField(
        decoration: InputDecoration(
          hintText: "Email Address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.grey.withOpacity(0.2),
          filled: true,
          prefixIcon: Icon(Icons.email),
        ),
      ),
    ],
  );
}

Widget _submitButton() {
  return Container(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {

      },
      child: Text(
        'Envoi',
        style: TextStyle(fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.grey.withOpacity(0.2),
      ),
    ),
  );
}

Widget _signInButton(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Remember your password?"),
      TextButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginApp()),
          );
        },
        child: Text("Sign In"),
      ),
    ],
  );
}

class PasswordRecoveryPage extends StatelessWidget {
  const PasswordRecoveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            gradient: LinearGradient(
              colors: [Color(0xFF707070), Color(0xFF404040)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        title: Text("Password Recovery"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(),
              SizedBox(height: 50),
              _inputField(),
              _submitButton(),
              _signInButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
