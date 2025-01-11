import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/dashboard/dashboard_bloc.dart';
import '../../core/dependency_injection/locator.dart';

class OrgModalBottomSheet extends StatelessWidget {
  const OrgModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: locator<DashboardBloc>(),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) => Container(
          constraints: const BoxConstraints(maxWidth: 425),
          child: ListView.builder(
            itemCount: state.orgInfoLength,
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () {
                orgBottomSheetOnTapHandler(context, state, index);
              },
              child: Center(
                child: Container(
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Color(0xffF5F5F5)))),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${state.userProfileInfo?.accounts?[index].org?.name}',
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void orgBottomSheetOnTapHandler(
      BuildContext context, DashboardState state, int index) {
    context
        .read<DashboardBloc>()
        .add(UpdateOrgIdEvent(state.userProfileInfo?.accounts?[index].orgId));
    Navigator.pop(context);
  }
}
