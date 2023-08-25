import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zon_gneapp/model/user.dart';
import 'package:zon_gneapp/screens/Accueil.dart';
import 'package:zon_gneapp/screens/provider.dart';
import 'package:zon_gneapp/service/api_service.dart';

import 'sign_up.dart';

class LoginApp extends StatefulWidget {
  LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  bool _obscureText = true;
 bool _loading=false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF707070),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _header(context),
                        Image.asset("images/maison.png", width: 200),
                        SizedBox(
                          height: 50,
                        ),
                        _inputField(context),
                        _forgetPassword(context),
                        _signup(context),
                        SizedBox(height: SizeConfig.screenHeight! * 0.08),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocalCard(
                              icon: "images/google-icon.svg",
                              press: () {},
                            ),
                            SizedBox(width: 60),
                            SocalCard(
                              icon: "images/facebook-2.svg",
                              press: () {
                                launchUrl("https://www.facebook.com" as Uri);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF707070),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
              ),
            ),
          ],
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
        Text("Welcame internaute"),
      ],
    );
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: "Email Address",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.email),
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
           setState(() {
             _loading=true;
           });
            String email = emailController.text;
            String password = passwordController.text;
            var response = await ApiService().login(email, password);
            if (response['code'] == 200) {
              var userData = response['data'];
              User user = User(
                name: userData['name'],
                prenom: userData['prenom'],
                email: userData['email'],
                tel: userData['tel'],
                password: '',
              );
              Provider.of<UserProvider>(context, listen: false).setUser(user);
              setState(() {
                _loading=false;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } else {
              var errorData = response['data'];
              print(errorData);
             setState(() {
               _loading=false;
             });
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.login,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                "Connexion",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 12),
             if(_loading)
              CircularProgressIndicator(color: Colors.white,)
            ],
          ),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ],
    );
  }

  _forgetPassword(context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PasswordRecoveryPage()),
        );
      },
      child: Text('Forget Password'),
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?"),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpPage()),
            );
          },
          child: Text("Sign Up"),
        ),
      ],
    );
  }
}

class SocalCard extends StatelessWidget {
  final String icon;
  final Function press;

  const SocalCard({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        child: SvgPicture.asset(
          icon,
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeVertical;
  static double? blockSizeHorizontal;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeVertical = screenHeight! / 100;
    blockSizeHorizontal = screenWidth! / 100;
  }
}
