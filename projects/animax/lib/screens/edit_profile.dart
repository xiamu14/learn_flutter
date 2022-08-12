import 'package:animax/widgets/avatar.dart';
import 'package:animax/widgets/avatar_picker.dart';
import 'package:animax/widgets/custom_app_bar.dart';
import 'package:animax/widgets/init_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  static String routePath = '/editProfile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: SafeArea(
              child: Column(
            children: [
              const CustomAppBar(
                title: 'Edit Your Profile',
                leadingBack: true,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(children: [
                    const AvatarPicker(size: 100),
                    const SizedBox(
                      height: 24,
                    ),
                    Form(
                      child: Column(
                        children: const [
                          InputField(
                            hintText: 'Full Name',
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          InputField(
                            hintText: 'Nickname',
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          SelectField(
                            hintText: "Gender",
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: InitBottomButton(
                  onSubmit: () {},
                ),
              ),
              const SizedBox(
                height: 24,
              )
            ],
          )),
        ),
      ),
    );
  }
}

var inputDecoration = (String hintText) => InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Color(0xffFAFAFA),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Color(0xffFAFAFA),
        ),
      ),
      fillColor: const Color(0xffFAFAFA),
      filled: true,
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color(0xff9E9E9E),
      ),
    );

class InputField extends StatelessWidget {
  const InputField({Key? key, required this.hintText}) : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: inputDecoration(hintText),
    );
  }
}

const options = [
  "Male",
  "Female",
];

class SelectField extends StatefulWidget {
  const SelectField({Key? key, required this.hintText}) : super(key: key);

  final String hintText;

  @override
  State<SelectField> createState() => _SelectFieldState();
}

class _SelectFieldState extends State<SelectField> {
  String? currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: inputDecoration(widget.hintText),
          isEmpty: currentSelectedValue == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: currentSelectedValue,
              isDense: true,
              // icon: Icon(Icons.ac_unit_outlined),
              elevation: 12,
              hint: Text(
                widget.hintText,
                style: const TextStyle(
                  color: Color(0xff9e9e9e),
                ),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  currentSelectedValue = newValue;
                  state.didChange(newValue);
                });
              },
              items: options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
