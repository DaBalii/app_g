import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:zon_gneapp/model/domain.dart';
import 'package:zon_gneapp/model/maison.dart';
import 'package:zon_gneapp/providers/home_provider.dart';
import 'package:zon_gneapp/screens/House.dart';
import 'package:zon_gneapp/screens/Login.dart';
import 'package:zon_gneapp/screens/ecran.dart';
import 'package:zon_gneapp/screens/maps.dart';
import 'package:zon_gneapp/screens/profil.dart';
import 'package:zon_gneapp/screens/provider.dart';
import 'package:zon_gneapp/screens/shupp.dart';
import 'package:zon_gneapp/service/api_service.dart';
import 'package:zon_gneapp/widgets/widget.dart';
import 'package:zon_gneapp/widgets/widget_recip.dart';

List<Domain> Domains = [
  Domain(id: 1, name: 'maps', icon: Icons.location_on_outlined),
  Domain(id: 2, name: 'contact', icon: Icons.house_outlined),
  Domain(id: 3, name: 'filtre', icon: Icons.filter_list),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homes = [];
  HomesPrivders? homesPrivders;

  getData() async {
    await ApiService().getAllHomes().then((value) {
      if (value.isEmpty) {
        print("hello");
      } else {
        setState(() {
          homes = value;
        });
      }
    });
    print(homes);
  }

  @override
  void initState() {
    homesPrivders=Provider.of<HomesPrivders>(context, listen: false);
    getData();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var currentUser = Provider.of<UserProvider>(context).user;
    homesPrivders!.getAllHomes();
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
        title: const Text("Accueil"),
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF707070), Color(0xFF404040)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('images/user.jpg'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${currentUser?.name}",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Text(
                      "${currentUser?.email}",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person_2_outlined),
                title: Text('Profil'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserPage(
                        updateProfilePhoto: (String? imagePath) {},
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.description),
                title: Text('Contrat'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BlankPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('Achat'),
                onTap: () {
                  showMessage(context);
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShuppPage()),
                  );*/
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Déconnexion'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginApp()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 100,
                ),
                itemCount: Domains.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  Domain domain = Domains[index];
                  return GestureDetector(
                    onTap: () {
                      if (domain.name == 'maps') {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MapPage(),
                          ),
                        );
                      } else if (domain.name == 'contact') {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => housePage(),
                          ),
                        );
                      } else if (domain.name == 'filtre') {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                HouseListPage(
                                  houses: homes,
                              homes: [],
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            domain.icon,
                            color: Colors.blue,
                            size: 28,
                          ),
                          const SizedBox(
                            width: 16,
                            height: 8,
                          ),
                          Text(
                            domain.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: IntrinsicGridView.vertical(
                padding:
                    EdgeInsets.only(top: 16, bottom: 12, left: 12, right: 12),
                verticalSpace: 10,
                horizontalSpace: 5,
                children: [for (var home in homes) ScientistWidget(home: home)],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person_outlined),
              onPressed: () {
                showMessage(context);
              },
            ),
          ],
        ),
      ),
    );
  }
  void _pickImage() async {
    final imagePicked =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imagePicked != null) {}
  }
}

class ScientistWidget extends StatelessWidget {
  final Maison home;

  const ScientistWidget({Key? key, required this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HouseDetailsPage(home: home, allHouses: []),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(home.path),
              fit: BoxFit.cover,
              width: 200,
              height: 125,
            ),
            const SizedBox(height: 8),
            Text(
              'Prix : \$${home.price}',
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              home.item_code,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              home.description,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              home.model,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Adresse : ${home.localisation}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}