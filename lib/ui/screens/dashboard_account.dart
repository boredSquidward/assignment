import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/dashboard/dashboard_bloc.dart';
import '../../core/dependency_injection/locator.dart';

class DashboardAccount extends StatelessWidget {
  const DashboardAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: locator<DashboardBloc>(),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Container(
              color: const Color(0xFFF5F5F5),
              height: double.infinity,
              width: 425,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 213,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff0081AA), Color(0xff00AA4F)])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 46,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Back',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        Text(
                          'Account',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 152,
                    left: 16,
                    right: 16,
                    child: BlocBuilder<DashboardBloc, DashboardState>(
                      builder: (context, state) {
                        return Container(
                          width: 320,
                          padding: const EdgeInsets.all(20),
                          constraints: const BoxConstraints(minWidth: 425),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: CircleAvatar(
                                            foregroundImage: NetworkImage(
                                                '${state.userProfileInfo?.profilePicture?.link}'),
                                          )),
                                      Positioned(
                                        bottom: 3,
                                        right: 13,
                                        child: Container(
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              color: const Color(0xff3C3C42),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: SvgPicture.asset(
                                              'assets/icons/ic-cam.svg'),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${state.userProfileInfo?.firstname} ${state.userProfileInfo?.lastname}',
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFF3B3B42),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.circle,
                                            size: 8,
                                            color: Color(0xFF00AA4F),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Active',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF3B3B42),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/ic-email.svg'),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            '${state.userProfileInfo?.email}',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF3B3B42),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/ic-phone.svg'),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            '${state.userProfileInfo?.mobile}',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF3B3B42),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              SizedBox(
                                height: 46,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            const WidgetStatePropertyAll(0),
                                        backgroundColor:
                                            const WidgetStatePropertyAll(
                                                Color(0x1900AA4F)),
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3)))),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/ic_language.svg'),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'Change Language',
                                          style: GoogleFonts.inter(
                                              color: const Color(0xFF00AA4F),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12),
                                        ),
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                height: 46,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            const WidgetStatePropertyAll(0),
                                        backgroundColor:
                                            const WidgetStatePropertyAll(
                                                Color(0xFFF5F5F5)),
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3)))),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/ic-key.svg'),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'Reset Password',
                                          style: GoogleFonts.inter(
                                              color: const Color(0xFF757575),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12),
                                        ),
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              SizedBox(
                                height: 46,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            const WidgetStatePropertyAll(0),
                                        backgroundColor:
                                            const WidgetStatePropertyAll(
                                                Color(0xFFF5F5F5)),
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3)))),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/ic-signout.svg'),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'Sign Out',
                                          style: GoogleFonts.inter(
                                              color: const Color(0xFF757575),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
