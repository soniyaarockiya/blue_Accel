import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseService {
  Future<void> addToFireBase(
      String title, String description, String arcticleData) async {
    try {
      await Firestore.instance.collection('Articles').document().setData({
        'title': title,
        'description': description,
        'arcticleData': arcticleData
      });
    } catch (e) {
      print("Something ");
    }
  }
}
