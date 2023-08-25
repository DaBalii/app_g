import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const d_green = Color(0xFF54D3C2);

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'hottel booking',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: d_green,
      appBar: MyAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchSection(),
            HomeSection(),
          ],
        ),
      ),
    );
  }
}

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey,
          size: 20,
        ),
        onPressed: null,
      ),
      title: Text(
        'Explore',
        style: GoogleFonts.nunito(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite_outline_rounded,
            color: Colors.grey,
            size: 20,
          ),
          onPressed: null,
        ),
        IconButton(
          icon: Icon(
            Icons.place,
            color: Colors.grey,
            size: 20,
          ),
          onPressed: null,
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey[200],
      padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 5,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'London',
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder
                            .none //pour desactiver la bare en bas du teste

                        ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.search,
                    size: 26,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    backgroundColor: d_green,
                  ),
                ),
              ),
            ],
          ),
          //SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose date',
                      style: GoogleFonts.nunito(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '12 Dec - 22 Dec',
                      style: GoogleFonts.nunito(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nubber of Rooms',
                      style: GoogleFonts.nunito(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '1 Rooms - 2 Adults',
                      style: GoogleFonts.nunito(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  final List hotelsList = [
    {
      'title': 'Grand Royal hotels',
      'place': 'Wedley,London',
      'distance': 2,
      'review': 36,
      'picture': 'images/maison.png',
      'price': '105',
    },
    {
      'title': 'Grand Royal hotels',
      'place': 'Wedley,London',
      'distance': 3,
      'review': 46,
      'picture': 'images/maison.png',
      'price': '100',
    },
    {
      'title': 'Grand Royal hotels',
      'place': 'Wedley,London',
      'distance': 4,
      'review': 50,
      'picture': 'images/maison.png',
      'price': '170',
    },
    {
      'title': 'Grand Royal hotels',
      'place': 'Wedley,London',
      'distance': 6,
      'review': 36,
      'picture': 'images/maison.png',
      'price': '102',
    },
    {
      'title': 'Grand Royal hotels',
      'place': 'Wedley,London',
      'distance': 9,
      'review': 36,
      'picture': 'images/maison.png',
      'price': '180',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.amber,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '550 hotels founds',
                  style: GoogleFonts.nunito(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Filter',
                      style: GoogleFonts.nunito(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.filter_list_outlined,
                        color: Colors.grey,
                        size: 20,
                      ),
                      onPressed: null,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: hotelsList.map((hotel) {
              return HotelCard(hotel);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  const HotelCard(this.hotelData);

  final Map hotelData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(18)),
              image: DecorationImage(
                image: AssetImage(
                  hotelData['picture'],
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  right: -15,
                  child: MaterialButton(
                    color: Colors.white,
                    shape: CircleBorder(),
                    onPressed: () {},
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: d_green,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hotelData['title'],
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  '\$' + hotelData['price'],
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hotelData['place'],
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: d_green,
                      size: 14.0,
                    ),
                    Text(
                      hotelData['distance'].toString() + 'xm to city',
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                Text(
                  hotelData['post night'],
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 3, 10, 0),
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_rate,
                      color: d_green,
                      size: 14.0,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: d_green,
                      size: 14.0,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: d_green,
                      size: 14.0,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: d_green,
                      size: 14.0,
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  hotelData['review'].toString() + 'review',
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
