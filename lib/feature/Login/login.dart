import 'package:flutter/material.dart';
import '../../utils/CustomButton.dart';
import '../../utils/CustomText.dart';
import '../Home/HomeScreen.dart';
class login extends StatelessWidget {
  static const String routeName = '/login';
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/splacelogo.png', width: 150),
              SizedBox(height: 20),
              Text(
                'Approval System',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5)
                ,child: CustomTextFormField(controller: email,hintText: 'اسم المستخدم',),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 25,
                ),
                child: CustomTextFormField(
                  controller: password,
                  isPassword: true,
                  hintText: 'كلمة المرور ',
                ),
              ),
              SizedBox(height: 12,),
              CustomButton(
                width: 250,
                text: 'تسجيل الدخول',
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Homescreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
