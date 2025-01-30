import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopping_app/core/assets/image/assets.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      clipBehavior: Clip.none,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(Assets.imagesProfileImage),
        ),
        Positioned(
          right: -5,
          bottom: -5,
          child: IconButton(
              onPressed: () {},
              icon: Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      IconlyBold.camera,
                      color: Colors.white,
                    ),
                  ))),
        )
      ],
    );
  }
}
