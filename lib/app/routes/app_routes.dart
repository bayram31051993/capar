part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const home = _Paths.home;
  static const initializer = _Paths.initializer;
  static const capar = _Paths.capar;
  static const toleg = _Paths.toleg;
  static const radar = _Paths.radar;
  static const trek = _Paths.trek;
  static const cabinet = _Paths.cabinet;
  static const departmets = _Paths.departmets;
  // static const senagat_bank = _Paths.senagat_bank;
}

abstract class _Paths {
  static const home = '/home';
  static const initializer = '/initializer';
  static const capar = '/capar';
  static const toleg = '/tolegler';
  static const radar = '/radar';
  static const trek = '/trek';
  static const cabinet = '/cabinet';
  static const departmets = '/departments';
  // static const senagat_bank = '/senagatBank';
}