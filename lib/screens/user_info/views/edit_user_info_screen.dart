import 'package:college_project/components/network_image_with_loader.dart';
import 'package:college_project/components/show_snackbar.dart';
import 'package:college_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditUserInfoScreen extends StatefulWidget {
  const EditUserInfoScreen({super.key});

  @override
  State<EditUserInfoScreen> createState() => _EditUserInfoScreenState();
}

class _EditUserInfoScreenState extends State<EditUserInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController(
    text: 'Shrey',
  );
  final TextEditingController dobController = TextEditingController(
    text: '1-1-2020',
  );
  final TextEditingController genderController = TextEditingController(
    text: 'Male',
  );
  final TextEditingController emailController = TextEditingController(
    text: 'shreygohel@gmail.com',
  );
  final TextEditingController phoneController = TextEditingController(
    text: '111111111',
  );

  @override
  void dispose() {
    usernameController.dispose();
    dobController.dispose();
    phoneController.dispose();
    genderController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey, // Placeholder color
                    child: NetworkImageWithLoader(
                      'https://i.imgur.com/IXnwbLk.png',
                      radius: 100,
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 10,
                    child: InkWell(
                      onTap: () {
                        ShowSnackbar.showSnackbar(
                          title: 'Photo Edit',
                          message: 'Photo Editing Process',
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(width: 5, color: Colors.white),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: const Icon(
                          Icons.edit_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: usernameController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "UserName",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding * 0.75,
                              ),
                              child: SvgPicture.asset(
                                "assets/icons/Profile.svg",
                                height: 24,
                                width: 24,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).textTheme.bodyLarge!.color!
                                      .withOpacity(0.3),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: dobController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Date Of Birth",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding * 0.75,
                              ),
                              child: SvgPicture.asset(
                                "assets/icons/Calender.svg",
                                height: 24,
                                width: 24,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).textTheme.bodyLarge!.color!
                                      .withOpacity(0.3),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: genderController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Gender",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding * 0.75,
                              ),
                              child: SvgPicture.string(
                                color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.3),
                                '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-venus-icon lucide-venus"><path d="M12 15v7"/><path d="M9 19h6"/><circle cx="12" cy="9" r="6"/></svg>',
                              ),
                              // SvgPicture.asset(
                              //   "assets/icons/Calender.svg",
                              //   height: 24,
                              //   width: 24,
                              //   colorFilter: ColorFilter.mode(
                              //     Theme.of(context).textTheme.bodyLarge!.color!
                              //         .withOpacity(0.3),
                              //     BlendMode.srcIn,
                              //   ),
                              // ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          onSaved: (emal) {
                            // Email
                          },
                          controller: emailController,
                          validator: emaildValidator.call,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Email address",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding * 0.75,
                              ),
                              child: SvgPicture.asset(
                                "assets/icons/Message.svg",
                                height: 24,
                                width: 24,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).textTheme.bodyLarge!.color!
                                      .withOpacity(0.3),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: phoneController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding * 0.75,
                              ),
                              child: SvgPicture.asset(
                                "assets/icons/Call.svg",
                                height: 24,
                                width: 24,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).textTheme.bodyLarge!.color!
                                      .withOpacity(0.3),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ShowSnackbar.showSnackbar(
                                title: 'Update',
                                message: 'Data updated',
                              );
                            }
                          },
                          child: const Text("Update"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
