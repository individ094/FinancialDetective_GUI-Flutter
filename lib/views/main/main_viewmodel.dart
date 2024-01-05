import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  bool _receivedCheckValue = true;
  bool get receivedCheckValue => _receivedCheckValue;

  bool _sendCheckValue = false;
  bool get sendCheckValue => _sendCheckValue;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void onReceivedCheckChanged(value) {
    _receivedCheckValue = value;
    notifyListeners();
  }

  void onSendCheckChanged(value) {
    _sendCheckValue = value;
    notifyListeners();
  }

  void onHomeButtonClicked() {
    // Get the current route.
    final currentRoute = ModalRoute.of(_scaffoldKey.currentContext!)?.settings.name;

    // Close the drawer.
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    }

    // If the current route is not the home route, navigate to the home route.
    if (currentRoute != '/home') {
      Navigator.of(_scaffoldKey.currentContext!).pushNamed('/home');
    }
  }
}
