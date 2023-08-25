import 'package:flutter/material.dart';

class BlankPage extends StatefulWidget {
  const BlankPage({Key? key}) : super(key: key);

  @override
  _BlankPageState createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xFF707070),
            ),
            child: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  "Assigné",
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
            flex: 10,
            child: Container(
              color: Colors.blueGrey,
              child: Center(
                child: Text(
                  "Mes contrats..",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 40,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/image.jpeg'),
                  // Chemin de votre image de fond
                  fit: BoxFit.cover,
                ),
              ),
              // Ajoutez ici le contenu du premier Expanded
            ),
          ),
          Expanded(
            flex: 15,
            child: Container(
              color: Colors.white30,
              // Ajoutez ici le contenu du troisième Expanded
            ),
          ),
        ],
      ),
    );
  }
}
