import 'package:ajuda_5_modul_exap/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'main_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  String errorTextForEmail = '';
  String errorTextForPassword = '';
  bool hiddenPassword = true;
  bool validInformation = false;
  bool inProgress = false;
  bool showErrorTextForEmail = false;
  bool showErrorTextForPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SvgPicture.asset('assest/icons/logo.svg')
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 80),
            Container(
              alignment: Alignment.center,
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xffFEBC12),
                borderRadius: BorderRadius.circular(18)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assest/icons/google.svg'),
                  const SizedBox(width: 8),
                  const Text("Sign in with google",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Colors.white
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.center,
              child: Text('Or',
                style: TextStyle(
                  color: Color(0xff666D80),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontSize: 16
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              onTap: () => setState(() => showErrorTextForEmail = false),
              onChanged: (value) => setState(() => checkData2),
              controller: email,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                hintText: 'Email',
                errorText: showErrorTextForEmail ? errorTextForEmail : null,
                hintStyle: const TextStyle(color: Color(0xff818898), fontSize: 16, fontWeight: FontWeight.w400),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Color(0xffDFE1E7),
                    width: 1
                  )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                        color: Color(0xffDFE1E7),
                        width: 1
                    )
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1
                    )
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              onTap: () => setState(() => showErrorTextForPassword = false),
              onChanged: (value) => setState(() => checkData2),
              controller: password,
              obscureText: hiddenPassword,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => setState(() => hiddenPassword = !hiddenPassword),
                    child: SvgPicture.asset('assest/icons/eye${hiddenPassword?'_black':''}.svg')
                  ),
                ),
                contentPadding: const EdgeInsets.all(12),
                hintText: 'Password',
                errorText: showErrorTextForPassword? errorTextForPassword : null,
                hintStyle: const TextStyle(color: Color(0xff818898), fontSize: 16, fontWeight: FontWeight.w400),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                        color: Color(0xffDFE1E7),
                        width: 1
                    )
                ),
                focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                          color: Color(0xffDFE1E7),
                          width: 1
                      )
                  ),
                errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1
                      )
                  ),
              ),
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment(1, 0),
              child: Text("Forgot password?",
                style: TextStyle(
                  color: Color(0xffFEBC12),
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: 'Poppins'
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: (){
                if(checkData){
                  Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => const MainPage()), (route) => false);
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 52,
                decoration: BoxDecoration(
                  color: Color(validInformation ? 0xffFEBC12 : 0xffFEDD88),
                  borderRadius: BorderRadius.circular(18)
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sign In",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            RichText(
              text: const TextSpan(
                text: "Don't have an account?",
                style: TextStyle(
                  color: Color(0xff666D80),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
                children: [
                  TextSpan(
                    text: " Sign up",
                    style: TextStyle(color: Colors.black)
                  ),
                ]
              ),
            ),
            const SizedBox(height: 15),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "By signing in you accept the. ",
                style: TextStyle(
                  color: Color(0xff666D80),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
                children: [
                  TextSpan(
                    text: "Terms of Services ",
                    style: TextStyle(color: Colors.black)
                  ),
                  TextSpan(
                      text: "and ",
                      style: TextStyle(color: Color(0xff666D80))
                  ),
                  TextSpan(
                      text: "Privacy Policy.",
                      style: TextStyle(color: Colors.black)
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool get checkData {
    bool check = true;
    if(inProgress) return false;
    if(email.text.trim().isEmpty){
      errorTextForEmail = 'Majburiy maydon';
      showErrorTextForEmail = true;
      check = false;
    }
    if(password.text.trim().isEmpty){
      errorTextForPassword = 'Majburiy maydon';
      showErrorTextForPassword = true;
      check = false;
    }
    if(!isEmailValid(email.text.trim()) && email.text.trim().isNotEmpty){
      errorTextForEmail = "No'to'g'ri formatdagi email";
      showErrorTextForEmail = true;
      check = false;
    }
    if(password.text.trim().length<6 && password.text.trim().isNotEmpty){
      errorTextForPassword = "Eng kamida 6 ta belgi bo'lishi kerak";
      showErrorTextForPassword = true;
      check = false;
    }

    setState((){});
    if(check) validInformation = true;
    return check;
  }

  bool get checkData2 {
    bool check = true;
    if(inProgress) return false;
    if(email.text.trim().isEmpty) check = false;
    if(password.text.trim().isEmpty) check = false;
    if(!isEmailValid(email.text.trim()) && email.text.trim().isNotEmpty) check = false;
    if(password.text.trim().length<6 && password.text.trim().isNotEmpty) check = false;

    setState((){});
    validInformation = check;
    return check;
  }

  bool isEmailValid(String email) {
    RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([a-z0-9-]+(\.[a-z0-9-]+)*?\.[a-z]{2,}|(\d{1,3}\.){3}\d{1,3})$',
      caseSensitive: false,
      multiLine: false,
    );
    return emailRegex.hasMatch(email);
  }
}
