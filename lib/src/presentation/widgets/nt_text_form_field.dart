import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NtTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final bool? enabled;
  final FocusNode? focusNode;
  final void Function()? onTap;

  const NtTextFormField({
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.enabled,
    this.focusNode,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        style: Theme.of(context).textTheme.bodySmall,
        enabled: enabled,
        onChanged: onChanged,
        cursorHeight: 15,
        maxLength: 30,
        validator: (value) {
          if (value?.isNotEmpty == true) {
            return null;
          } else {
            return 'required';
          }
        },
        onTap: onTap,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: InputDecoration(
          fillColor: Theme.of(context).cardColor,
          filled: true,
          contentPadding: EdgeInsets.only(left: 15),
          counterText: '',
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(25)),
          //   borderSide: BorderSide(color: Theme.of(context).cardColor),
          // ),
          // disabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(25)),
          //   borderSide: BorderSide(color: Theme.of(context).cardColor),
          // ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(
              color: Theme.of(context).cardColor,
              width: 0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(
              color: Theme.of(context).cardColor,
              width: 0,
            ),
          ),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
