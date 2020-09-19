import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homeexp {
  final String id;
  final String name;
  final String date;
  final String roomnum;
  final String electricityprevnum;
  final String electricitynewnum;
  final String previousroomamount;
  final String newroomamount;
  final String wifiamount;
  final String waternum;
  Homeexp(
      {this.electricitynewnum,
      this.id,
      this.electricityprevnum,
      this.name,
      this.newroomamount,
      this.previousroomamount,
      this.roomnum,
      this.waternum,
      this.wifiamount,
      this.date});

  //converting object to map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['id'] = id;
    map['name'] = name;
    map['date'] = date;
    map['roomnum'] = roomnum;
    map['electricityprevnum'] = electricityprevnum;
    map['electricitynewnum'] = electricitynewnum;
    map[' previousroomamount'] = previousroomamount;
    map['newroomamount'] = newroomamount;
    map['wifiamount'] = wifiamount;
    map['waternum'] = waternum;
  }
}

class HomeVada with ChangeNotifier {
  List<Homeexp> _homeexpense = [];

  List<Homeexp> get homeexpense {
    return [..._homeexpense];
  }

  Future adddetail(Homeexp homeexp) async {
    final newDetails = Homeexp(
        id: DateTime.now().toString(),
        date: homeexp.date,
        electricitynewnum: homeexp.electricitynewnum,
        electricityprevnum: homeexp.electricityprevnum,
        name: homeexp.name,
        newroomamount: homeexp.newroomamount,
        previousroomamount: homeexp.previousroomamount,
        roomnum: homeexp.roomnum,
        waternum: homeexp.waternum,
        wifiamount: homeexp.wifiamount);

    final sp = await SharedPreferences.getInstance();

    sp.setString("newd", newDetails.toString());
    _homeexpense.add(sp.get("newd"));

    notifyListeners();
  }
}
