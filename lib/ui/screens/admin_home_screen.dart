import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/dashboard/dashboard_bloc.dart';
import '../../bloc/driver/driver_checklist_bloc.dart';
import '../../bloc/fuel/fuel_transaction_bloc.dart';
import '../../core/dependency_injection/locator.dart';
import '../widgets/checklist_item.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/fuel_transaction_item.dart';
import '../widgets/no_data_available.dart';
import '../widgets/org_modal_bottom_sheet.dart';
import 'enum/screens.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
            value: locator<DashboardBloc>()..add(GetUserInfoEvent())),
        BlocProvider.value(value: locator<FuelTransactionBloc>()),
        BlocProvider.value(value: locator<DriverCheckListBloc>()),
      ],
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<DashboardBloc, DashboardState>(
          listener: (context, state) {
            if (_tabController.index == 0 && state.orgId != null) {
              context
                  .read<FuelTransactionBloc>()
                  .add(GetFuelTransactionEvent(state.orgId!));
            }
            if (_tabController.index == 1 && state.orgId != null) {
              context
                  .read<DriverCheckListBloc>()
                  .add(GetDriverCheckListEvent(state.orgId!));
            }
          },
          builder: (context, state) {
            return Center(
              child: state.isLoading
                  ? Container(
                      constraints: const BoxConstraints(maxWidth: 425),
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.white,
                      child: const CupertinoActivityIndicator())
                  : Container(
                      constraints: const BoxConstraints(maxWidth: 425),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 47,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) =>
                                            const OrgModalBottomSheet());
                                  },
                                  child: Container(
                                    width: 253,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color(0xFF3B3B42)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            state.getSelectedOrgName,
                                            style: GoogleFonts.inter(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 14,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        Screens.dashboardAccountPage.path);
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/ic-profile.svg',
                                    colorFilter: const ColorFilter.mode(
                                        Color(0xFF3B3B42), BlendMode.srcIn),
                                    height: 28,
                                    width: 28,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const DashboardCard(),
                            const SizedBox(
                              height: 10,
                            ),
                            DefaultTabController(
                                length: 2,
                                child: TabBar(
                                  controller: _tabController,
                                  indicator: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color(0xFF00AA4F)))),
                                  dividerColor: const Color(0xffD8D8D8),
                                  labelStyle: GoogleFonts.inter(
                                    color: const Color(0xFF00AA4F),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  unselectedLabelStyle: GoogleFonts.inter(
                                    color: const Color(0xFF757575),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  onTap: (value) {
                                    if (state.orgId == null) return;
                                    if (value == 0) {
                                      context.read<FuelTransactionBloc>().add(
                                          GetFuelTransactionEvent(
                                              state.orgId!));
                                    } else {
                                      context.read<DriverCheckListBloc>().add(
                                          GetDriverCheckListEvent(
                                              state.orgId!));
                                    }
                                  },
                                  tabs: const [
                                    Tab(text: 'Fuel Transactions'),
                                    Tab(text: 'Checklist')
                                  ],
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  BlocBuilder<FuelTransactionBloc,
                                      FuelTransactionState>(
                                    builder: (context, fuelState) {
                                      return Center(
                                          child: fuelState.isLoading
                                              ? const CupertinoActivityIndicator()
                                              : fuelState
                                                          .fuelTransactionModel
                                                          ?.transactions
                                                          ?.isEmpty ??
                                                      true
                                                  ? const NoDataAvailable()
                                                  : ListView.builder(
                                                      itemCount: fuelState
                                                          .fuelTransactionModel
                                                          ?.transactions
                                                          ?.length,
                                                      itemBuilder: (context,
                                                              index) =>
                                                          FuelTransactionItem(
                                                              index: index),
                                                    ));
                                    },
                                  ),
                                  BlocBuilder<DriverCheckListBloc,
                                      DriverCheckListState>(
                                    builder: (context, driverState) {
                                      return Center(
                                          child: driverState.isLoading
                                              ? const CupertinoActivityIndicator()
                                              : driverState.isListEmpty
                                              ? const NoDataAvailable()
                                              : ListView.builder(
                                            itemCount: driverState
                                                .checkListLength,
                                            itemBuilder: (context,
                                                index) =>
                                                ChecklistItem(
                                                    index: index),
                                          ));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
