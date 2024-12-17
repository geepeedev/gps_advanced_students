import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:gps_advanced_students/core/common/user/data/model/user.dart';
import 'package:gps_advanced_students/features/dashboard/data/model/profile.dart';

class DashboardDatasource {
  final userCollection = FirebaseFirestore.instance.collection('users');
  final userProfile = FirebaseFirestore.instance.collection('profiles');

  Future<Map<String, dynamic>?> getStudentOnlineProfile(
      UserModel currentUser) async {
    try {
      final query = await userProfile.doc(currentUser.id).get();
      return query.data();
    } catch (e) {
      rethrow;
    }
  }

  updateStudentOnlineProfile(
      UserModel currentUser, StudentProfileModel studentProfile) async {
    try {
      await userProfile.doc(currentUser.id).update(studentProfile.toMap());
    } catch (error) {
      rethrow;
    }
  }
}
