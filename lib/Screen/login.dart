// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// //import 'package:google_fonts/google_fonts.dart';
// import 'package:nnn/Screen/h.dart';
// //import 'package:flutter_svg/flutter_svg.dart';
// //import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// bool isLoggedIn = false;

// void login(String username, String password) {}

// TextEditingController usernameController = TextEditingController();
// TextEditingController passwordController = TextEditingController();
// void loginsuccess(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => HomePage()),
//   );
// }

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // Container(
//               //   width: 80,
//               //   height: 100,
//               //   alignment: Alignment.center,
//               //   padding: EdgeInsets.all(80),
//               //   decoration: BoxDecoration(
//               //     shape: BoxShape.circle,
//               //     image: DecorationImage(
//               //       image: NetworkImage(
//               //         'https://www.shutterstock.com/shutterstock/photos/1328492696/display_1500/stock-vector-food-finder-app-logo-design-vector-template-1328492696.jpg',
//               //       ),
//               //       fit: BoxFit.cover,
//               //     ),
//               //   ),
//               // ),
//               SizedBox(height: 50),
//               SvgPicture.asset(
//                 'assets/undraw_undraw_undraw_undraw_sign_up_ln1s_-1-_s4bc_-1-_ee41_-1-_kf4d.svg',
//                 width: 200,
//                 height: 200,
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Log in',
//                 style: GoogleFonts.baloo2(fontSize: 40),
//               ),
//               SizedBox(height: 40),
//               TextField(
//                 controller: usernameController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   String Email = usernameController.text;
//                   String password = passwordController.text;
//                   login(Email, password);
//                   isLoggedIn = true;
//                   loginsuccess(context);
//                 },
//                 style: ButtonStyle(
//                   minimumSize: MaterialStateProperty.all(Size(100, 50)),
//                   backgroundColor: MaterialStateProperty.all(
//                       Color.fromARGB(255, 247, 149, 2)),
//                 ),
//                 child: Text(
//                   'Submit',
//                   style: TextStyle(
//                       fontSize: 25, color: Color.fromARGB(115, 0, 0, 0) ),
//                 ),

//               ),
//               SizedBox(height: 80,
//               child: Center(
//                 child: Row( 
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [ 
//                     Text('Dont have an account?'),
//                     TextButton(onPressed: () {
                
//                     }, child: Text('sign up', style: TextStyle(color: Colors.black ,)) , 
//                     )
                
                
//                   ],
//                 ),
//               )
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
