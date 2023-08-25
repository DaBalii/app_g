import 'package:flutter/material.dart';

_header(context) {
  return const Column(
    children: [
      Text(
        "house come Back",
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text("Welcame internaute"),
    ],
  );
}

_inputField(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,//agrandir le textefilder
    children: [


      TextField(
        decoration: InputDecoration(
          hintText: "adress",
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
        decoration: InputDecoration(
          hintText: "password",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(Icons.lock),),
        obscureText: true,

      ),
      const SizedBox(height: 10,),


      ElevatedButton(
        onPressed: (){},
        child: Text("Connexion",
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(

          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),

    ],
  );
}

_forgetPassword(context){
  return TextButton(
    onPressed: (){},
    child:Text('forget password'), );

}


_signup(context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Dont have an account ?"),
      TextButton(onPressed: (){}, child: Text("sign up"),),
    ],
  );
}

void showMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.white,
        child: Container(
          padding: EdgeInsets.all(7),
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Text(
                'Bientôt disponible',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
              SizedBox(height: 10),

              SizedBox(height: 20),
              ElevatedButton(
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
