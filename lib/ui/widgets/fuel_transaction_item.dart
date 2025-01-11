import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/fuel/fuel_transaction_bloc.dart';
import '../../core/dependency_injection/locator.dart';

class FuelTransactionItem extends StatelessWidget {
  const FuelTransactionItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: locator<FuelTransactionBloc>(),
      child: BlocBuilder<FuelTransactionBloc, FuelTransactionState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(11)),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 19, vertical: 17),
                    color: const Color(0xFFF5F5F5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${state.fuelTransactionModel?.transactions?[index].cardNo}',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF3B3B42),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '${state.fuelTransactionModel?.transactions?[index].vehNo}',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF3B3B42),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    )),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 19.0, vertical: 17.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Receipt ${state.fuelTransactionModel?.transactions?[index].rcptNo}',
                            style: GoogleFonts.inter(
                              color: const Color(0xFF3B3B42),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '${state.fuelTransactionModel?.transactions?[index].station}',
                            style: GoogleFonts.inter(
                              color: const Color(0xFF3B3B42),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Text(
                            'Transaction Date: ${state.getTransactionDate(index)}',
                            style: GoogleFonts.inter(
                              color: const Color(0xff757575),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 10,
                            height: 1,
                            color: const Color(0xffD23636),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '${state.fuelTransactionModel?.transactions?[index].amount}',
                            style: GoogleFonts.inter(
                              color: const Color(0xFF3B3B42),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                        blurStyle: BlurStyle.outer),
                  ]),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
