// import 'package:gps_advanced_students/core/common/user/data/model/user.dart';
import 'package:gps_advanced_students/features/dashboard/data/model/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  final SharedPreferencesAsync _preferencesAsync;

  LocalDataSource({required SharedPreferencesAsync preferencesAsync})
      : _preferencesAsync = preferencesAsync;

  static const _studentProfileKey = 'userdata';

  Future<void> updateStudentProfile(StudentProfileModel userProfile) async {
    await _preferencesAsync.setString(_studentProfileKey, userProfile.toJson());
  }

  Future<String?> getStudentProfile() async {
    try {
      final localprofile =
          await _preferencesAsync.getString(_studentProfileKey);
      return localprofile;
    } catch (e) {
      rethrow;
    }
  }
}
