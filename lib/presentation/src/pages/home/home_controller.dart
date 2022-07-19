import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:location/location.dart' as L;
import 'package:tyba_restaurant/presentation/src/data/helpers/formControl.dart';
import 'package:tyba_restaurant/presentation/src/data/models/formModel.dart';

class HomeController extends GetxController {
  late GooglePlace googlePlace;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late L.PermissionStatus _permissionGranted;
  late L.LocationData _locationData;
  String searchValue = '';
  @override
  void onInit() {
    super.onInit();
    String apiKey = 'AIzaSyC5YFhhEvFvKBA9du8i0gmoxayMzO6U7PM';
    googlePlace = GooglePlace(apiKey);
  }

  List<String> history = [];

  List<SearchResult> places = [];
  FormControls form = FormControls(form: {
    'search': FormModel(value: '', validators: []),
  });

  void search() {
    EasyDebounce.debounce('tag', const Duration(milliseconds: 300), () async {
      if (searchValue != '') {
        var _box = Hive.box('userData');
        _box.add(searchValue);

        TextSearchResponse? result = await googlePlace.search
            .getTextSearch(searchValue, type: 'restaurant');

        if (result != null) {
          if (result.results!.isNotEmpty) {
            places = result.results!;
            update(['places']);
          }
        }
      }
    });
  }

  void getLocation() async {
    _permissionGranted = await L.Location().hasPermission();
    if (_permissionGranted == L.PermissionStatus.denied) {
      _permissionGranted = await L.Location().requestPermission();
      if (_permissionGranted != L.PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await L.Location().getLocation();

    NearBySearchResponse? result = await googlePlace.search.getNearBySearch(
        Location(lat: _locationData.latitude, lng: _locationData.latitude),
        10000,
        type: 'restaurant');

    if (result != null) {
      if (result.results!.isNotEmpty) {
        places = result.results!;

        update(['places']);
      }
    }
  }

  void _signOut() async {
    await _auth.signOut();
  }

  void signOut() async {
    final User? user = _auth.currentUser;
    if (user == null) {
      Get.snackbar('Error', 'No has iniciado sesión');
      Get.toNamed('/login');
      return;
    }
    _signOut();
    final String uid = user.uid;
    Get.snackbar('Exito!', 'Sesión cerrada correctamente.',
        colorText: Colors.white);
    //Get.snackbar('Out', uid + 'sesion cerrada');

    Get.toNamed('/login');
  }
}
