import 'package:amazone_clone/constants/common_functions.dart';
import 'package:amazone_clone/utils/color.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreens extends StatefulWidget {
  const AuthScreens({super.key});

  @override
  State<AuthScreens> createState() => _AuthScreensState();
}

class _AuthScreensState extends State<AuthScreens> {
  bool inLogin = true; // Changed initial value to match the UI state
  String currentCountryCode = '+49';
  TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context)
        .size
        .width; // Fixed: was using height instead of width
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/amazon_logo.png',
          height: height * 0.04,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: textTheme.displayMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              CommonFunctions.blankSpace(height: height * 0.02),
              Container(
                width: width,
                decoration:
                    BoxDecoration(border: Border.all(color: greyShade3)),
                child: Column(
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: greyShade3)),
                      child: Row(
                        children: [
                          Expanded(
                            // Added to ensure proper layout
                            child: Container(
                              height: height * 0.06,
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.01),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        inLogin =
                                            false; // Changed to match the logic
                                      });
                                    },
                                    child: Container(
                                      height: height * 0.03,
                                      width: height * 0.03,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.grey),
                                        color: Colors.white,
                                      ),
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.circle,
                                        size: height * 0.015,
                                        color: inLogin
                                            ? transparent
                                            : secondaryColor,
                                      ),
                                    ),
                                  ),
                                  CommonFunctions.blankSpace(
                                      width: width *
                                          0.01), // Fixed: was using height instead of width
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Create Account. ',
                                          style: textTheme.bodyMedium!.copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: 'New to Amazon?',
                                          style: textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.01, vertical: height * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Added for proper alignment
                        children: [
                          Row(
                            children: [
                              InkWell(
                                // Added for consistency with the other radio button
                                onTap: () {
                                  setState(() {
                                    inLogin = true;
                                  });
                                },
                                child: Container(
                                  height: height * 0.03,
                                  width: height * 0.03,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.grey),
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.circle,
                                    size: height * 0.015,
                                    color:
                                        inLogin ? secondaryColor : transparent,
                                  ),
                                ),
                              ),
                              CommonFunctions.blankSpace(
                                  width: width *
                                      0.01), // Fixed: was using height instead of width
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Sign in. ',
                                      style: textTheme.bodyMedium!.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: 'Already a Customer',
                                      style: textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          CommonFunctions.blankSpace(height: height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Builder(builder: (context) {
                                return InkWell(
                                  onTap: () {
                                    showCountryPicker(
                                        context: context,
                                        onSelect: (val) {
                                          setState(() {
                                            currentCountryCode =
                                                '+${val.phoneCode}';
                                          });
                                        });
                                  },
                                  child: Container(
                                    height: height * 0.06,
                                    width: width * 0.2,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        color: greyShade1,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      currentCountryCode,
                                      style: textTheme.displaySmall?.copyWith(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                );
                              }),
                              SizedBox(
                                  width: width *
                                      0.02), // Add spacing between country code and text field
                              Expanded(
                                child: TextFormField(
                                  controller: mobileController,
                                  keyboardType: TextInputType.phone,
                                  style: textTheme.bodyMedium,
                                  cursorColor: black,
                                  decoration: InputDecoration(
                                    hintText: 'Mobile number',
                                    hintStyle: textTheme.bodyMedium
                                        ?.copyWith(color: greyShade3),
                                    filled: true,
                                    fillColor: Colors.white,
                                    errorStyle: textTheme.bodySmall
                                        ?.copyWith(color: Colors.red),
                                    // Define all borders with the same style for consistency
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: greyShade3, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: secondaryColor, width: 1.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: greyShade3, width: 1.0),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: greyShade2, width: 1.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: 1.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.red.shade800,
                                          width: 1.5),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: height * 0.018,
                                      horizontal: width * 0.025,
                                    ),
                                    isDense:
                                        true, // Makes the field more compact
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a mobile number';
                                    }
                                    if (value.length < 6) {
                                      return 'Please enter a valid mobile number';
                                    }
                                    return null;
                                  },
                                  inputFormatters: [
                                    // Limit to digits only and control maximum length
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(15),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
