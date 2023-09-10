import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vital_pulse/db/services/get_user_info.dart';

class UserDataProvider with ChangeNotifier {
  String _email = '';
  String _userId = '';
  List _userInfo = [];
  String _name = '';
  String _age = '';
  String _stature = '';
  bool _isLoading = true; // Agregado un indicador de carga

  UserDataProvider() {
    subscribeToChanges();
  }
    // Suscríbete a los cambios en el estado de autenticación.
    Future<void> subscribeToChanges() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        _userId = user.uid;
        _email = user.email!;
        //print('User is currently signed in!');
        
        // Obtén la información del usuario y actualiza las variables.
        _userInfo = await getUserInfo(_userId);
        _name = _userInfo.isNotEmpty ? _userInfo[0]['nombre'] ?? 'Cargando..' : 'no hay datos';
        _age = _userInfo.isNotEmpty ? _userInfo[0]['edad'] ?? 'Cargando..' : 'no hay datos';
        _stature = _userInfo.isNotEmpty ? _userInfo[0]['talla'] ?? 'Cargando..' : 'no hay datos';
        
        // Los datos se han cargado, establece isLoading a false.
        _isLoading = false;
      } else {
        _userId = '';
        _email = '';
        _userInfo = [];
        _name = '';
        _age = '';
        _stature = '';
        _isLoading = false; // Importante, también establece isLoading en falso aquí.
       // print('User is signed out!');
      }
      
      // Notifica a los oyentes que los datos han cambiado.
      notifyListeners();
    });
  }

  String get email => _email;
  String get userId => _userId;
  String get name => _name;
  List get userInfo => _userInfo;
  String get age => _age;
  String get stature => _stature;
  bool get isLoading => _isLoading; // Agregado un getter para el indicador de carga.
}
