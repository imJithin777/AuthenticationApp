import 'package:authentication/app/ui/themes/my_colors.dart';
import 'package:authentication/app/ui/themes/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatefulWidget {
  final Function(String)? onSaved;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? hintText;
  final TextStyle? hinttextstyle;
  final TextStyle? labeltextstyle;
  final TextStyle? textstyle;
  bool? password;
  bool? isSuggestions;
  bool? isdense;
  bool? issuffix;
  final Icon? sufffixicon;
  final Icon? prefixicon;
  final Color? iconcolor;
  final InputBorder? focusborder;
  final InputBorder? enableborder;
  final InputBorder? errorborder;
  final InputBorder? focuserrorborder;
  final EdgeInsets? textfieldpadding;
  final int? maxLength;
  final int? maxLine;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final IconData? icon;
  final String? errorText;
  final ScrollController? scrollcontroller;
  final BuildContext? context;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? textinputinputformatter;
  final double? offset;
  final bool? isenabled;

  CommonTextField(
      {this.icon,
      @required this.textinputinputformatter,
      this.maxLine,
      this.controller,
      @required this.password,
      @required this.onSaved,
      @required this.validator,
      this.labelText,
      this.maxLength,
        this.isenabled,
      @required this.keyboardType,
      this.errorText,
      this.scrollcontroller,
      this.context,
      this.focusNode,
      this.offset,
      this.isdense,
      this.textfieldpadding,
      this.focusborder,
      this.enableborder,
      this.errorborder,
      this.focuserrorborder,
      this.hintText,
        this.textstyle,
        this.hinttextstyle,
      this.labeltextstyle,
      this.sufffixicon,
      this.issuffix,
      this.prefixicon,
      this.iconcolor,
      this.isSuggestions,
      this.onChanged});

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Theme(
      data: ThemeData(
        primaryColor: MyColors.themecolor,
      ),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        enabled: widget.isenabled,
        controller: widget.controller,
        focusNode: widget.focusNode,
        obscureText: widget.password! ? passwordVisibility : false,
        textInputAction: TextInputAction.next,
        cursorColor: Colors.black,
        onSaved: (value){ widget.onSaved!(value!);},
        onChanged: widget.onChanged,
        style: widget.textstyle,
        maxLines: widget.maxLine,
        enableSuggestions: widget.isSuggestions!,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
            isDense: widget.isdense,
            contentPadding: widget.textfieldpadding,
            enabledBorder: widget.enableborder,
            focusedBorder: widget.focusborder,
            hintText: widget.hintText,
            labelText: widget.labelText,
            hintStyle: widget.hinttextstyle,
            errorText: widget.errorText,
            focusedErrorBorder: widget.focuserrorborder,
            errorBorder: widget.errorborder,
            suffixIcon: widget.sufffixicon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: widget.sufffixicon)
                : widget.password!
                    ? IconButton(
                        icon: Icon(
                            !passwordVisibility
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 20,
                            color: MyColors.black),
                        onPressed: () {
                          setState(() {
                            passwordVisibility = !passwordVisibility;
                          });
                        },
                      )
                    : const SizedBox(),
            prefixIcon: widget.prefixicon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: widget.password!
                        ? IconButton(
                            icon: Icon(
                                widget.password!
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 20,
                                color: MyColors.black),
                            onPressed: () {
                              setState(() {
                                passwordVisibility = !passwordVisibility;
                              });
                            },
                          )
                        : widget.prefixicon)
                : null),
        validator: widget.validator,
        onEditingComplete: () {
          FocusScope.of(widget.context!).requestFocus(FocusNode());
        },
        onTap: () {
        },
      ),
    ));
  }
}
