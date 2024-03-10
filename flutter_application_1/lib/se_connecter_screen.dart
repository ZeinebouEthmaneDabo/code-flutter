import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/first_screen.dart';

class se_connecter_screen extends StatefulWidget {
  const se_connecter_screen({super.key});

  @override
  State<se_connecter_screen> createState() => _se_connecter_screenState();
}

class _se_connecter_screenState extends State<se_connecter_screen> {
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  signIn(emailAddress, password, context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      if (credential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  AutreEcran()),
        );
      }
    } on FirebaseAuthException catch (e) {
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:  Text('Mauvais mot de passe fourni pour cet utilisateur.'),
        ));
     }
  }



  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(148, 33, 149, 243),
            Color.fromRGBO(244, 67, 54, 0.066),
          ])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page(){
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            _icon(),
            const SizedBox(height: 50),
            _inputField("email", emailController),
            const SizedBox(height: 20),
            _inputField("Password", passwordController,isPassword: true),
            const SizedBox(height: 50),
            _loginBtn(),
          ]),
      ),
    );
  }

  Widget _icon(){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle
      ),
      child: const Icon(Icons.lock_open_sharp,color: Colors.white,size: 120,),
    );
  }
  Widget _inputField(String hintText,TextEditingController controller,
  {isPassword = true}){
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white)
    );
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }
  Widget _loginBtn(){
    return ElevatedButton(onPressed: (){
      var email;
      var Password;
      signIn(email.text,Password.text,context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AutreEcran()),
      );
    }, 
    child: const SizedBox(child: Text("se connecter"))
    );
  }
  
}

