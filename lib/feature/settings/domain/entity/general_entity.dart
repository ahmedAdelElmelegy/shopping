import 'package:flutter/material.dart';

class GeneralEntity {
  final IconData icon;
  final String title;
  final String? hinttext;
  final void Function()? fun;

  GeneralEntity(this.fun,
      {required this.icon, required this.title, this.hinttext});
}
