import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/driver/driver_checklist_bloc.dart';
import '../../core/dependency_injection/locator.dart';
import '../../data/models/driver_checklist_model.dart';

class ChecklistItem extends StatelessWidget {
  final int index;

  const ChecklistItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: locator<DriverCheckListBloc>(),
      child: BlocBuilder<DriverCheckListBloc, DriverCheckListState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(top: 6, bottom: 6),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffF5F5F5)),
                borderRadius: BorderRadius.circular(11)),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 21, vertical: 13),
                    color: const Color(0xFFF5F5F5),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 48,
                            height: 48,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(state.getDriverPhoto(index)),
                            )),
                        const SizedBox(
                          width: 14,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.getDriverFullName(index),
                              style: GoogleFonts.inter(
                                color: const Color(0xFF3B3B42),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              state.getVehiclePlateNo(index),
                              style: GoogleFonts.inter(
                                color: const Color(0xFF757575),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 12.0),
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Color(0xffF5F5F5)))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Check In Details',
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 18,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/ic_checkin.svg'),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      state.getStartTime(index),
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFF3B3B42),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Start Mileage',
                                  style: GoogleFonts.inter(
                                    color: const Color(0xFF757575),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '${state.getStartMileage(index)}',
                                  style: GoogleFonts.inter(
                                    color: const Color(0xFF3B3B42),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/ic_checkin.svg'),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        state.getCheckoutTime(index),
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFF3B3B42),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'End Mileage',
                                  style: GoogleFonts.inter(
                                    color: const Color(0xFF757575),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '${state.getEndMileage(index)}',
                                  style: GoogleFonts.inter(
                                    color: const Color(0xFF3B3B42),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: Row(
                    children: [
                      Text(
                        'Checklists',
                        style: GoogleFonts.inter(
                          color: const Color(0xFF0081AA),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset('assets/icons/ic-warn.svg'),
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 18,
                        color: Color(0xff0081AA),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
