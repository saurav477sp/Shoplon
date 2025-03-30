import 'package:college_project/components/text/BodyText.dart';
import 'package:college_project/route/screen_export.dart';
import 'package:college_project/screens/profile/views/components/profile_card.dart';
import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [TextButton(onPressed: () => Navigator.pushNamed(context, editUserInfoScreenRoute), child: Text('Edit'))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),

            const SizedBox(height: 20),
            _userBasicDetails(title: 'Name', value: 'Shrey'),

            const Divider(height: 32),
            _userBasicDetails(title: 'Date of Birth', value: '1-1-2020'),

            const Divider(height: 32),
            _userBasicDetails(title: 'Phone Number', value: '111111111'),

            const Divider(height: 32),
            _userBasicDetails(title: 'Gender', value: 'Male'),

            const Divider(height: 32),
            _userBasicDetails(title: 'Email', value: 'shreygohel@gmail.com'),

            const Divider(height: 32),
            _userPasswordUpdate(title: 'Password', value: 'Change Password'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileCard(
          name: "Shrey",
          email: "shreygohel.com",
          imageSrc: "https://i.imgur.com/IXnwbLk.png",
          isShowArrow: false,
        ),
      ],
    );
  }

  Widget _userBasicDetails({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 17)),
        BodyText(text: value, fontSize: 17),
      ],
    );
  }

  Widget _userPasswordUpdate({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 17)),
        TextButton(onPressed: (){}, child: Text(value)),
      ],
    );
  }
}
