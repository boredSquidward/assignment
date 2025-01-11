enum Screens {
  login('/'),
  adminHomePage('/admin/homepage'),
  dashboardAccountPage('/admin/dashboard'),
  ;

  final String path;

  const Screens(this.path);
}
