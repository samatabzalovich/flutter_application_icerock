import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_icerock/data/repositories/auth_repository.dart';
import 'package:flutter_application_icerock/ui/screens/repository_page/repository_page.dart';
import 'package:flutter_application_icerock/ui/common/widgets/custom_alert_dialog.dart';
import 'package:flutter_application_icerock/ui/common/widgets/default_button.dart';
import 'package:flutter_application_icerock/ui/common/widgets/text_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/utils/translation.dart';

class LoginBody extends ConsumerStatefulWidget {
  LoginBody({super.key});

  @override
  ConsumerState<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends ConsumerState<LoginBody> {
  final _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  bool? isValid;
  String token = '';
  bool _isFocused = false;
  bool isLoading = false;
  RegExp regExp = RegExp(r'^[a-zA-Z0-9]*_[a-zA-Z0-9_]*$');

  void _showAlertDialog() {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CustomAlertDialog());
  }

  void signIn() async {
    try {
      if (_controller.text.isEmpty) {
        setState(() {
          isValid = false;
        });
        return;
      }
      // Check if the token contains only Latin characters and numbers
      if (isValid == true) {
        token = _controller.text;
        setState(() {
          isLoading = true;
        });
        var nav = Navigator.of(context);
        bool isTokenChecked =
            await ref.read(authRepositoryProvider.notifier).isTokenValid(token);
        setState(() {
          isLoading = false;
        });
        if (isTokenChecked) {
          nav.pushNamedAndRemoveUntil(
              RepositoryPage.routeName, (route) => false);
        } else {
          _showAlertDialog();
          isValid = false;
        }
      }
    } catch (e) {
      _showAlertDialog();
      isValid = false;
      isLoading = false;
    }
  }

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    _controller.addListener(() {
      if (_controller.text.isNotEmpty) {
        int leng = _controller.text.length;
        if (leng > 15) {
          bool temp = regExp.hasMatch(_controller.text);
          if (temp) {
            setState(() {
              isValid = true;
            });
          } else {
            setState(() {
              isValid = false;
            });
          }
        } else {
          setState(() {
            isValid = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    if ((_isFocused && isValid == null) || (_isFocused && isValid == true)) {
      borderColor = Color(0xFF58A6FF);
    } else if (isValid == false) {
      borderColor = CupertinoColors.systemRed;
    } else {
      borderColor = Color(0xff21262D);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 67
                  : 40,
            ),
            SvgPicture.asset(
              'assets/images/Logo.svg',
              width: 96,
            ),
            SizedBox(
              height: 56,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(width: 1, color: borderColor)),
                    child: CupertinoTextField(
                      controller: _controller,
                      autocorrect: false,
                      placeholderStyle: TextStyle(
                        fontSize: 16,
                        color: CupertinoColors.white.withOpacity(0.5),
                      ),
                      placeholder: translation(context).textFieldText,
                      focusNode: _focusNode,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,),
                    ),
                  ),
                  if (isValid == false)
                    Padding(
                      padding: const EdgeInsets.only(top: 6, left: 16),
                      child: TextWidget(
                        translation(context).invalidToken,
                        color: Color(0xffCB4F4F),
                        size: 12,
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
        DefaultButton(
          onPressedAction: signIn,
          name: 'Sign In',
          isFocused: _isFocused,
          isLoading: isLoading,
        )
      ],
    );
  }
}
