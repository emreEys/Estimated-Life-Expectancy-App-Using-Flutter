import 'user_data.dart';

class Calculus {
  final UserData _userData;

  Calculus(this._userData);

  double calculate() {
    double result;

    result = 90 + _userData.yapilanSpor! - _userData.icilenSigara!;
    result = result + (_userData.boy! / _userData.kilo!.toDouble());

    if (_userData.seciliCinsiyet == "FEMALE") {
      return result + 3;
    } else {
      return result;
    }
  }
}
