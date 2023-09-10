import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserInfoProvider with ChangeNotifier {
  String _name = '';
  String _age = '';
  String _gender = '';
  String _weight = '';
  String _stature = '';
  String _ethnicity = '';

  final String userId;

  UserInfoProvider(this.userId) {
    _checkUserInfo();
  }

  Future<void> _checkUserInfo() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> userInfo =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection('userInfo')
              .doc('_$userId')
              .get();

      if (userInfo.exists) {
       // print('El usuario existe');
        final data = userInfo.data() as Map<String, dynamic>;
        _name = data['nombre'] ?? '';
        _age = data['edad'] ?? '';
        _gender = data['genero'] ?? '';
        _weight = data['peso'] ?? '';
        _stature = data['talla'] ?? '';
        _ethnicity = data['etnia'] ?? '';
      }
    } catch (error) {
     // print('Error al obtener la información del usuario: $error');
    }

    notifyListeners();
  }

  String get name => _name;
  String get age => _age;
  String get gender => _gender;
  String get weight => _weight;
  String get stature => _stature;
  String get ethnicity => _ethnicity;
}
