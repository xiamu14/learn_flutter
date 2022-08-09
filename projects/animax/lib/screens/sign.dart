import 'package:animax/screens/home.dart';
import 'package:animax/screens/init_setting.dart';
import 'package:animax/utils/form_validator.dart';
import 'package:animax/widgets/button.dart';
import 'package:animax/widgets/custom_app_bar.dart';
import 'package:anime_icons/anime_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Sign extends StatefulWidget {
  const Sign({Key? key}) : super(key: key);

  static String routePath = '/sign';

  @override
  State<Sign> createState() => _SignState();
}

enum PageType { signIn, signUp }

class _SignState extends State<Sign> {
  var formKey = GlobalKey<FormState>();
  var formValues = {};
  late FocusNode emailFocusNode;
  var pageType = PageType.signUp;

  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    emailFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(title: '', leadingBack: true),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 100,
                      height: 98,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      pageType == PageType.signIn
                          ? 'Login to Your Account'
                          : 'Create Your Account',
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Color(0xff212121),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    signForm(),
                    const SizedBox(
                      height: 30,
                    ),
                    Button(
                      text: pageType == PageType.signIn ? 'Sign in' : 'Sign up',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          print(formValues.toString());
                          if (pageType == PageType.signIn) {
                            GoRouter.of(context).go(Home.routePath);
                          } else {
                            GoRouter.of(context).go(InitSetting.routePath);
                          }
                        } else {
                          print('some error');
                        }
                      },
                      color: Theme.of(context).primaryColor,
                      height: 58,
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          pageType == PageType.signUp
                              ? 'Don\'t have an account'
                              : 'Already have an account?',
                          style: GoogleFonts.urbanist(
                              textStyle: const TextStyle(
                            color: Color(0xff919191),
                            // fontWeight: FontWeight.bold,
                            fontSize: 14,
                          )),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              pageType = pageType == PageType.signUp
                                  ? PageType.signIn
                                  : PageType.signUp;
                              formKey = GlobalKey<FormState>();
                              formValues = {};
                            });
                          },
                          child: Text(
                            pageType == PageType.signIn ? 'Sign in' : 'Sign up',
                            style: GoogleFonts.urbanist(
                                textStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
                            )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget signForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          InputField(
            formValues: formValues,
            prefixIconName: AnimeIcons.messageBold,
            name: 'email',
            placeholder: "Email",
            actionValidate: () {
              formKey.currentState!.validate();
            },
            validator: validateEmail,
          ),
          const SizedBox(
            height: 24,
          ),
          InputField(
            formValues: formValues,
            prefixIconName: AnimeIcons.lockBold,
            name: 'password',
            placeholder: "Password",
            obscureText: true,
            actionValidate: () {
              formKey.currentState!.validate();
            },
            validator: validatePassword,
            suffixIconBuilder: (hasFocus) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: AnimeIcon(
                AnimeIcons.hide,
                color: hasFocus
                    ? const Color(0xff06C149)
                    : const Color(0xff9e9e9e),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    this.placeholder = '',
    this.suffixIconBuilder,
    this.obscureText = false,
    required Map formValues,
    required this.name,
    required this.prefixIconName,
    required this.actionValidate,
    required this.validator,
  })  : _formValues = formValues,
        super(key: key);

  final Map _formValues;
  final String placeholder;
  final String name;
  final bool obscureText;
  final AnimeIcons prefixIconName;
  final Widget? Function(bool hasFocus)? suffixIconBuilder;
  final Function() actionValidate;
  final String? Function(String? value) validator;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late FocusNode _focusNode;
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    setState(() {
      // print(_focusNode.hasFocus);
      // if (!_focusNode.hasFocus) {
      //   widget.actionValidate();
      // }
      hasFocus = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        widget._formValues[widget.name] = value;
      },
      validator: widget.validator,
      obscureText: widget.obscureText,
      focusNode: _focusNode,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: AnimeIcon(
            widget.prefixIconName,
            color: hasFocus ? const Color(0xff06C149) : const Color(0xff9e9e9e),
            size: 24.0,
          ),
        ),
        suffixIcon: widget.suffixIconBuilder?.call(hasFocus),
        fillColor: hasFocus
            ? const Color(0xff06C149).withOpacity(0.08)
            : const Color(0xffFAFAFA),
        filled: true,
        focusColor: const Color(0xff06C149).withOpacity(0.08),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xffFAFAFA),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xff06C149),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xffFAFAFA),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xff06C149),
          ),
        ),
        errorStyle: TextStyle(color: Colors.red[300]),
        hintText: widget.placeholder,
        hintStyle: TextStyle(color: Colors.grey[400]),
      ),
    );
  }
}
