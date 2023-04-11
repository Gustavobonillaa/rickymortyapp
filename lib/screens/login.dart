import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../widgets/login_button.dart';
import '../widgets/login_textfield.dart';
import '../widgets/main_wrapper.dart';
import '../widgets/squere_tile.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: FadeInUp(
          delay: const Duration(milliseconds: 300),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'asset/images/rick_and_morty-157026175-large.jpg'),
                  fit: BoxFit.fill),
            ),
            child: Column(children: [
              SizedBox(height: size.height * 0.35),
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: LoginTextField(
                    hintText: 'Username',
                    controller: usernameController,
                    obscureText: false),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: LoginTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: FadeInUp(
                  delay: const Duration(milliseconds: 300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        '¿Olvidadeste tu contraseña?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              FadeInUp(
                  delay: const Duration(milliseconds: 300),
                  child: LoginButton(onTap: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeWrapper(
                            
                          ),
                        ),
                      ),)),
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: FadeInUp(
                  delay: const Duration(milliseconds: 300),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'O continua con',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // google button
                    SquareTile(imagePath: 'asset/images/google.png')
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
