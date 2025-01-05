class Breakpoints {
  static const double mobile = 640;
  static const double tablet = 768;
  static const double desktop = 1024;

  static bool isMobile(double width) => width < mobile;
  static bool isTablet(double width) => width >= mobile && width < desktop;
  static bool isDesktop(double width) => width >= desktop;
}
