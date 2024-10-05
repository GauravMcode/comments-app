import 'package:comments_app/common/widgets/custom_button.dart';
import 'package:comments_app/common/widgets/custom_form_field.dart';
import 'package:comments_app/config/app_colors.dart';
import 'package:comments_app/config/page_routes.dart';
import 'package:comments_app/config/size_config.dart';
import 'package:comments_app/features/authentication/model/auth_req.dart';
import 'package:comments_app/features/authentication/view/helpers/validators.dart';
import 'package:comments_app/features/authentication/view_model/auth_viewmodel.dart';
import 'package:comments_app/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final w = SizeConfig.screenWidth!;
  final h = SizeConfig.screenHeight!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcSecondaryColorDark,
      body: SizedBox(
        width: w,
        height: h,
        child: SafeArea(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 12 * SizeConfig.widthMultiplier!),
                    child: Text(
                      "Comments",
                      style: TextStyle(
                          color: kcPrimaryColor,
                          fontSize: 15 * SizeConfig.textMultiplier!,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              const Spacer(flex: 1),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomFormField(
                          isEnabled: true,
                          height: h * 0.08,
                          width: w * 0.9,
                          keyboardType: TextInputType.text,
                          label: "Name",
                          validator: nameValidator,
                          controller: nameController),
                      SizedBox(height: SizeConfig.heightMultiplier! * 5),
                      CustomFormField(
                          isEnabled: true,
                          height: h * 0.08,
                          width: w * 0.9,
                          keyboardType: TextInputType.emailAddress,
                          validator: emailValidator,
                          label: "Email",
                          controller: emailController),
                      SizedBox(height: SizeConfig.heightMultiplier! * 5),
                      CustomFormField(
                          isEnabled: true,
                          height: h * 0.15,
                          width: w * 0.9,
                          keyboardType: TextInputType.visiblePassword,
                          validator: passwordValidator,
                          label: "Password",
                          controller: passwordController),
                    ],
                  )),
              const Spacer(flex: 2),
              Column(
                children: [
                  Consumer<AuthViewModel>(builder: (context, viewModel, child) {
                    return SizedBox(
                      width: w * 0.5,
                      height: h * 0.05,
                      child: viewModel.loading
                          ? CustomButton(
                              child: const CircularProgressIndicator(
                                  color: kcSecondaryColor),
                              onPressed: () {},
                            )
                          : CustomButton(
                              text: "Signup",
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await context.read<AuthViewModel>().signUp(
                                      AuthReq(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          name: nameController.text),
                                      context);
                                }
                              },
                            ),
                    );
                  }),
                  SizedBox(height: SizeConfig.heightMultiplier! * 10),
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(fontSize: 15),
                          children: [
                        const TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(color: kcBlack)),
                        TextSpan(
                            text: "Login",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context)
                                    .pushNamed(PageRoutes.login);
                              },
                            style: const TextStyle(
                                color: kcPrimaryColor,
                                fontWeight: FontWeight.bold))
                      ])),
                  SizedBox(height: SizeConfig.heightMultiplier! * 15),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
