import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/dashboard/dashboard_bloc.dart';
import '../../core/dependency_injection/locator.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: locator<DashboardBloc>(),
      child: BlocConsumer<DashboardBloc, DashboardState>(
        listenWhen: (previous, current) => previous.orgId != current.orgId,
        listener: (context, state) {
          if (state.orgId != null) {
            context.read<DashboardBloc>().add(GetDashboardInfoEvent());
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                        colors: [Color(0xff0081AA), Color(0xff00AA4F)])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/waving-hand.svg',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Text(
                          'Hi, ${state.userProfileInfo?.firstname} ${state.userProfileInfo?.lastname}',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      children: [
                        Text(
                          'Balance',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        SvgPicture.asset('assets/icons/ic-error.svg')
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${state.userBalance}',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            decoration: BoxDecoration(
                                color: const Color(0xff1A1A1A),
                                borderRadius: BorderRadius.circular(3)),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 10,
                                ),
                                Text('Add credit',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ))
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                        DateFormatter.formatDateTime(
                            dateTime: DateTime.parse(state.lastUpdate),
                            outputFormat: 'MM-dd-yyyy HH:mm:ss'),
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                        )),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                          color: const Color(0xFF3B3B42).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text('Current usage (June)',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Text('25,000',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                          Container(
                            height: 56,
                            width: 1,
                            color: Colors.white,
                          ),
                          Column(
                            children: [
                              Text('Last usage (May)',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Text('25,000',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  top: -100,
                  right: -20,
                  child: Opacity(
                    opacity: 0.15,
                    child: SvgPicture.asset(
                      'assets/icons/bg card.svg',
                      width: 379.15,
                      height: 264.87,
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }
}
