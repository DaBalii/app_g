import 'package:flutter/material.dart';

class Domain {
  final int id;
  final String name;
  final IconData icon;

  Domain({required this.id, required this.name, required this.icon});
}


class DomainIteList extends StatelessWidget {
  final Domain domain;
  const DomainIteList({super.key, required this.domain});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: [
          Row(
            children: [
              Icon(domain.icon,color: Colors.blue,size: 28,),
              const SizedBox(width:16 ,),
              Text(domain.name,style:const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),),
            ],
          ),
          Divider(color: Colors.grey[700],),
        ],
      ),
    );
  }
}