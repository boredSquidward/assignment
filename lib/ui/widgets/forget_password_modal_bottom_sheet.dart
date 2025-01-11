import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordModalBottomSheet extends StatefulWidget {
  const ForgetPasswordModalBottomSheet({super.key});

  @override
  State<ForgetPasswordModalBottomSheet> createState() =>
      _ForgetPasswordModalBottomSheetState();
}

class _ForgetPasswordModalBottomSheetState
    extends State<ForgetPasswordModalBottomSheet> {
  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 425),
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Forget Password',
                style: GoogleFonts.inter(
                    color: const Color(0xFF757575),
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  'assets/icons/ic_x.svg',
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          SvgPicture.asset('assets/icons/ic_forgotpw.svg'),
          const SizedBox(
            height: 13,
          ),
          Text(
            'Enter your email and we will send you an email with instructions for resetting your password',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                color: const Color(0xFF757575),
                fontWeight: FontWeight.w400,
                fontSize: 14),
          ),
          const SizedBox(
            height: 38,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Email',
              style: GoogleFonts.inter(
                  color: const Color(0xFF757575),
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            autocorrect: false,
            textInputAction: TextInputAction.next,
            controller: _emailController,
            focusNode: _emailFocusNode,
            onTapOutside: (_) {
              _emailFocusNode.unfocus();
            },
            onChanged: (value) {},
            style: GoogleFonts.inter(
                color: const Color(0xff3C3C42),
                fontWeight: FontWeight.w500,
                fontSize: 12),
            decoration: InputDecoration(
                suffixIcon: _emailController.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          _emailController.clear();
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset('assets/icons/ic_x.svg'),
                        ),
                      )
                    : null,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff00AA4F))),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    borderSide: BorderSide(color: Color(0xffD8D8D8)))),
            keyboardType: TextInputType.emailAddress,
            validator: (String? value) {
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 41,
            child: ElevatedButton(
                style: ButtonStyle(
                    elevation: const WidgetStatePropertyAll(0),
                    backgroundColor:
                        const WidgetStatePropertyAll(Color(0xFF00AA4F)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)))),
                onPressed: () {
                  Navigator.pop(context);
                  final snackBar = SnackBar(
                    content: const Text('This feature is currently inactive!'),
                    action: SnackBarAction(
                      label: 'OK',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text(
                  'Submit',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                )),
          )
        ],
      ),
    );
  }
}
