import 'package:flutter/material.dart';

class ShuppPage extends StatefulWidget {
  const ShuppPage({Key? key}) : super(key: key);

  @override
  _BlankPageState createState() => _BlankPageState();
}

class _BlankPageState extends State<ShuppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF707070),
            ),
            child: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  "Assikpètè",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                centerTitle: true,
              ),
            ),
          ),
          Expanded(
            child: Container(
                // Ajoutez ici le contenu de votre choix pour occuper le reste de la page
                ),
          ),
        ],
      ),
    );
  }
}
