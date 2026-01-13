import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:insta/core/util/dimensions.dart';
import 'package:insta/core/util/style.dart';
import 'package:insta/core/widget/custom_text_field.dart';
import 'package:insta/core/widget/dimensions_widget.dart';
import 'package:insta/core/widget/primary_button_widget.dart';
import 'package:insta/feature/root/root_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoadig = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(Dimensions.paddingSizeDefault),
          child: Column(
            children: [
              Spacer(),
              Text( "Instagram", style: interBold.copyWith(
                color: context.theme.primaryColor,
                fontSize: Dimensions.fontSizeOverLarge,
              )),
              GapY(value: 100),

              CustomTextFieldWidget.requiredField(
                hintText: "Username, email or phone number",
              ),
              CustomTextFieldWidget.requiredField(
                hintText: "Password",
                validator: (error) {
                  return "";
                },
              ),

              PrimaryButtonWidget(
                onTap: () async {
                  setState(() {
                    isLoadig = true;
                  });
                  await Future.delayed(Duration(seconds: 2));
                  setState(() {
                    isLoadig = false;
                  });
                  Get.to(()=>RootScreen());
                },
                text: "Log in",
                isLoading: isLoadig,
                textColor: context.theme.primaryColor,
                gradientColors: [
                  context.theme.colorScheme.primary,
                  context.theme.colorScheme.primary.withAlpha(220),
                ],
              ),
              GapY(value: Dimensions.paddingSizeDefault),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Forget password?",
                    style: interBold.copyWith(
                      color: context.theme.colorScheme.primary,
                      fontSize: Dimensions.fontSizeDefault,
                    ),
                  ),
                ],
              ),
              GapY(value: Dimensions.paddingSizeDefault),
              Spacer(),

              PrimaryButtonWidget.border(
                color: context.theme.colorScheme.primary,
                text: "Create new account",
              ),
              GapY(value: Dimensions.paddingSizeSmall),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.meta),
                  GapX(value: Dimensions.paddingSizeDefault),
                  Text("Meta"),
                ],
              ),
              GapY(value: Dimensions.paddingSizeLarge),
            ],
          ),
        ),
      ),
    );
  }
}
