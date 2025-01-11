import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NoDataAvailable extends StatelessWidget {
  const NoDataAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 72,
        ),
        SvgPicture.asset('assets/icons/ic-empty-general.svg'),
        const SizedBox(
          height: 14,
        ),
        Text(
          'No data available',
          style: GoogleFonts.inter(
            color: const Color(0xFF3B3B42),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
