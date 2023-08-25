import 'package:flutter/material.dart';
import 'package:zon_gneapp/screens/Accueil.dart';
import 'package:zon_gneapp/service/api_service.dart';
import 'package:intl/intl.dart';

class housePage extends StatefulWidget {
  const housePage({Key? key}) : super(key: key);

  @override
  _HousePageState createState() => _HousePageState();
}

class _HousePageState extends State<housePage> {
  final List<String> paymentMethods = [
    'Carte de crédit',
    'PayPal',
    'Virement bancaire',
    'Chèque',
    'Espèces'
  ];

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
                  "Votre Agence",
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nos Informations",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Nom de l'agence : ATAKORA",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Adresse : 123 Rue Principale,lomé , Togo",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Téléphone : +228 22453225",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Email : groupeatakorasarl.com",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Nos services",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 16),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Vente de biens immobiliers"),
                    ),
                    ListTile(
                      leading: Icon(Icons.business),
                      title: Text("Location de biens immobiliers"),
                    ),
                    ListTile(
                      leading: Icon(Icons.receipt),
                      title: Text("Gestion de biens immobiliers"),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Moyens de paiement",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 16),
                    Column(
                      children: [
                        for (var method in paymentMethods)
                          ListTile(
                            leading: Icon(Icons.payment),
                            title: Text(method),
                          ),
                      ],
                    ),
                    // Ajoutez d'autres éléments en fonction de vos besoins
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReservationServicePage extends StatefulWidget {
  const ReservationServicePage({Key? key}) : super(key: key);

  @override
  _ReservationServicePageState createState() => _ReservationServicePageState();
}

class _ReservationServicePageState extends State<ReservationServicePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController arrivalDateController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        arrivalDateController.text = DateFormat.yMd().format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service de Réservation'),
        backgroundColor: const Color(0xFF707070),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/home.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Tooltip(
                message: 'Nombre de réservations : 0',
                child: Text(
                  'Service de Réservation',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Contact: +123456789',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'E-mail : groupeatakora@example.com',
                style: TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Formulaire de réservation'),
                        content: SingleChildScrollView(
                          child: Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    labelText: 'Nom',
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Adresse e-mail',
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextFormField(
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                    labelText: 'Numéro de téléphone',
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextFormField(
                                  controller: arrivalDateController,
                                  decoration: InputDecoration(
                                    labelText: 'Date d\'arrivée',
                                  ),
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                ),
                                SizedBox(height: 16),
                                TextFormField(
                                  controller: durationController,
                                  decoration: InputDecoration(
                                    labelText: 'Durée du séjour (en jours)',
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    String name = nameController.text;
                                    String address = emailController.text;
                                    int num_tel =
                                        int.tryParse(phoneController.text) ?? 0;
                                    String date_arr =
                                        arrivalDateController.text;
                                    int duration =
                                        int.tryParse(durationController.text) ??
                                            0;
                                    var apiresponse = await ApiService()
                                        .userReservation(name, address, num_tel,
                                            date_arr, duration);
                                    print(apiresponse);
                                    print(apiresponse['code']);
                                    if (apiresponse['code'] == 200) {
                                      var data = apiresponse['data'];
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()),
                                      );
                                    } else {
                                      var errorData = apiresponse['data'];
                                      print('errorData');
                                    }
                                    /*.then((value) {
                                          print("befor code");
                                          print(value['code']);
                                      if (value['code'] == 200) {
                                        var data = value['data'];
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()),
                                        );
                                      } else {
                                        var errorData = value['data'];
                                        print('errorData');
                                      }
                                    });*/
                                  },
                                  child: Text('Réserver'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text('Réserver maintenant'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
