import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/login/login_bloc.dart';
import '../../core/dependency_injection/locator.dart';
import '../widgets/forget_password_modal_bottom_sheet.dart';
import 'enum/screens.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: locator<LoginBloc>(),
      child: BlocListener<LoginBloc, LoginState>(
        listenWhen: (previous, current) =>
            previous.isAuthSuccessful == current.isAuthSuccessful,
        listener: (context, state) {
          if (state.isAuthSuccessful) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Screens.adminHomePage.path,
              (route) => false,
            );
          }
        },
        child: BlocListener<LoginBloc, LoginState>(
          listenWhen: (previous, current) => previous.error != current.error,
          listener: (context, state) {
            final snackBar = SnackBar(
              content: Text(state.error.toString()),
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {},
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Container(
                color: const Color(0xFFF5F5F5),
                height: double.infinity,
                width: 425,
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Container(
                          constraints: const BoxConstraints(maxWidth: 425),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                            Colors.blue[900]!,
                            Colors.green[800]!
                          ])),
                          child: Image.asset(
                            'assets/images/bg.png',
                            fit: BoxFit.fitHeight,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 140,
                              height: 90,
                              child: SvgPicture.asset(
                                'assets/icons/ic-ml-logo.svg',
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                        top: 278,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 425),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(42),
                                  topRight: Radius.circular(42))),
                          child: Form(
                            key: _formKey,
                            child: ListView(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 48.0),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 33, bottom: 52),
                                  child: Text(
                                    'Sign in',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        color: const Color(0xff3C3C42),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 26),
                                  ),
                                ),
                                Text(
                                  'Email',
                                  style: GoogleFonts.inter(
                                      color: const Color(0xff757575),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                BlocBuilder<LoginBloc, LoginState>(
                                  builder: (context, state) {
                                    return TextFormField(
                                      autocorrect: false,
                                      textInputAction: TextInputAction.next,
                                      controller: _emailController,
                                      focusNode: _emailFocusNode,
                                      onTapOutside: (_) {
                                        _emailFocusNode.unfocus();
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (String? value) {
                                        return state.emailValidator(value);
                                      },
                                      onChanged: (value) {
                                        context.read<LoginBloc>().add(
                                            ValidateLoginFormEvent(
                                                email: _emailController.text,
                                                password:
                                                    _passwordController.text));
                                      },
                                      style: GoogleFonts.inter(
                                          color: const Color(0xff3C3C42),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                      decoration: InputDecoration(
                                        focusedErrorBorder:
                                            const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red)),
                                        errorBorder: const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff00AA4F))),
                                        enabledBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3)),
                                            borderSide: BorderSide(
                                                color: Color(0xffD8D8D8))),
                                        suffixIcon: _emailController
                                                .text.isNotEmpty
                                            ? GestureDetector(
                                                onTap: () {
                                                  _emailController.clear();
                                                  context.read<LoginBloc>().add(
                                                      ValidateLoginFormEvent(
                                                          email:
                                                              _emailController
                                                                  .text,
                                                          password:
                                                              _passwordController
                                                                  .text));
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: SvgPicture.asset(
                                                      'assets/icons/ic_x.svg'),
                                                ),
                                              )
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Password',
                                  style: GoogleFonts.inter(
                                      color: const Color(0xff757575),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                BlocBuilder<LoginBloc, LoginState>(
                                  builder: (context, state) {
                                    return TextFormField(
                                      controller: _passwordController,
                                      focusNode: _passFocusNode,
                                      onTapOutside: (_) {
                                        _passFocusNode.unfocus();
                                      },
                                      onChanged: (_) {
                                        context.read<LoginBloc>().add(
                                            ValidateLoginFormEvent(
                                                email: _emailController.text,
                                                password:
                                                    _passwordController.text));
                                      },
                                      style: GoogleFonts.inter(
                                          color: const Color(0xff3C3C42),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                      decoration: InputDecoration(
                                          suffixIcon: SizedBox(
                                            height: 14.85,
                                            width: 16.5,
                                            child: GestureDetector(
                                              onTap: () {
                                                context.read<LoginBloc>().add(
                                                    TogglePasswordVisibilityEvent());
                                              },
                                              child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: SvgPicture.asset(state
                                                          .isPasswordVisible
                                                      ? 'assets/icons/ic_show.svg'
                                                      : 'assets/icons/ic_hide.svg')),
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red)),
                                          errorBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red)),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xff00AA4F))),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(Radius
                                                          .circular(3)),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xffD8D8D8)))),
                                      obscureText: !state.isPasswordVisible,
                                      validator: (String? value) {
                                        return state.passwordValidator(value);
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          showDragHandle: true,
                                          // isScrollControlled: true,
                                          context: context,
                                          builder: (context) =>
                                              const ForgetPasswordModalBottomSheet(),
                                        );
                                      },
                                      child: Text.rich(TextSpan(
                                        text: 'Forget password',
                                        style: GoogleFonts.inter(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor:
                                                const Color(0xffD23636),
                                            color: const Color(0xffD23636),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      )),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 44,
                                ),
                                BlocBuilder<LoginBloc, LoginState>(
                                  builder: (context, state) {
                                    return Row(
                                      children: [
                                        Checkbox(
                                          value: state.areConditionsAccepted,
                                          onChanged: (_) {
                                            context.read<LoginBloc>().add(
                                                ToggleTermsAndConditionsCheckboxEvent());
                                            context.read<LoginBloc>().add(
                                                ValidateLoginFormEvent(
                                                    email:
                                                        _emailController.text,
                                                    password:
                                                        _passwordController
                                                            .text));
                                          },
                                          activeColor: const Color(0xff00AA4F),
                                          side: BorderSide(
                                              width: 3,
                                              color: state.areConditionsAccepted
                                                  ? const Color(0xff00AA4F)
                                                  : const Color(0xffD8D8D8)),
                                          overlayColor:
                                              const WidgetStatePropertyAll(
                                                  Color(0xffD8D8D8)),
                                        ),
                                        Text(
                                          'I accept the ',
                                          style: GoogleFonts.inter(
                                              color: const Color(0xff3C3C42),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                        Text.rich(TextSpan(
                                          text: 'Terms & Conditions',
                                          style: GoogleFonts.inter(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor:
                                                  const Color(0xffD23636),
                                              color: const Color(0xffD23636),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ))
                                      ],
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                BlocBuilder<LoginBloc, LoginState>(
                                  builder: (context, state) {
                                    return SizedBox(
                                      height: 41,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              elevation:
                                                  const WidgetStatePropertyAll(
                                                      0),
                                              backgroundColor: state
                                                      .isLoginFormValid
                                                  ? const WidgetStatePropertyAll(
                                                      Color(0xff00AA4F))
                                                  : const WidgetStatePropertyAll(
                                                      Color(0xffD8D8D8)),
                                              shape: WidgetStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)))),
                                          onPressed: () {
                                            signInBtnOnPressedHandler(context);
                                          },
                                          child: Text(
                                            'Sign in',
                                            style: GoogleFonts.inter(
                                                color: state.isLoginFormValid
                                                    ? Colors.white
                                                    : const Color(0xff757575),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          )),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                SizedBox(
                                  height: 41,
                                  child: BlocBuilder<LoginBloc, LoginState>(
                                    builder: (context, state) {
                                      return ElevatedButton(
                                          style: ButtonStyle(
                                              elevation:
                                                  const WidgetStatePropertyAll(
                                                      0),
                                              backgroundColor:
                                                  const WidgetStatePropertyAll(
                                                      Colors.white),
                                              shape: WidgetStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      side: const BorderSide(
                                                          color: Color(
                                                              0xffD8D8D8)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)))),
                                          onPressed: () async {
                                            if (_formKey.currentState
                                                    ?.validate() ==
                                                true) {
                                              if (state.isLoginFormValid) {
                                                context.read<LoginBloc>().add(
                                                    GoogleAuthSignInEvent(
                                                        email: _emailController
                                                            .text,
                                                        password:
                                                            _passwordController
                                                                .text));
                                              }
                                            }
                                          },
                                          child: state.isGoogleBtnLoading
                                              ? const CupertinoActivityIndicator()
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/icons/ic_google.svg',
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                    const SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      'Sign in with Google',
                                                      style: GoogleFonts.inter(
                                                          color: const Color(
                                                              0xff757575),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ));
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 44,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'App version: V1.0',
                                      style: GoogleFonts.inter(
                                          color: const Color(0xff757575),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                    Container(
                                      width: 161,
                                      height: 36,
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                          color: Color(0xffF5F5F5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/ic_language.svg',
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                        Color(0xff757575),
                                                        BlendMode.srcIn),
                                                height: 16.67,
                                                width: 16.67,
                                              ),
                                              const SizedBox(
                                                width: 9,
                                              ),
                                              Text(
                                                'English',
                                                style: GoogleFonts.inter(
                                                    color:
                                                        const Color(0xff757575),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Color(0xff5F6368),
                                            size: 18,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signInBtnOnPressedHandler(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text(
          'This button is currently inactive! Please sign up with Google'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
