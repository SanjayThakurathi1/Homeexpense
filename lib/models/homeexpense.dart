import 'package:flutter/cupertino.dart';
import '../models/database.dart';

class Homeexp {
  int id;
  String name;
  String date;
  String roomnum;
  String electricityprevnum;
  String electricitynewnum;
  String previousroomamount;
  String newroomamount;
  String wifiamount;
  String waternum;
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
      this.date = "2055/06/11"});

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
    map['epunit'] = electricityprevnum;
    map['ecunit'] = electricitynewnum;
    map[' puranovada'] = previousroomamount;
    map['newvada'] = newroomamount;
    map['wifiprice'] = wifiamount;
    map['wunit'] = waternum;
    return map;
  }

  //function to extract a detail object from map object
  Homeexp.extractfrommap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.date = map['date'];
    this.roomnum = map['roomnum'];
    this.electricityprevnum = map['epunit'];
    this.electricitynewnum = map['ecunit'];
    this.previousroomamount = map['puranovada'];
    this.newroomamount = map['newvada'];
    this.wifiamount = map['wifiprice'];
    this.waternum = map['wunit'];
  }
}

class HomeVada with ChangeNotifier {
  List<Homeexp> _homeexpense = [];

  List<Homeexp> get homeexpense {
    return [..._homeexpense];
  }

  Future adddetail(Homeexp homeexp) async {
    final newDetails = Homeexp(
        date: homeexp.date,
        electricitynewnum: homeexp.electricitynewnum,
        electricityprevnum: homeexp.electricityprevnum,
        name: homeexp.name,
        newroomamount: homeexp.newroomamount,
        previousroomamount: homeexp.previousroomamount,
        roomnum: homeexp.roomnum,
        waternum: homeexp.waternum,
        wifiamount: homeexp.wifiamount);

    // _homeexpense.add(newDetails);

    notifyListeners();
  }

  Future<List<Homeexp>> getalldetails() async {
    _homeexpense = List<
        Homeexp>(); //clear the list before adding, else replicates will be there
    final db = DatabaseHelper.instance;
    final List<Map<String, dynamic>> allqueries = await db.queryall();
    int count = allqueries.length;

    for (int i = 0; i < count; i++) {
      _homeexpense.add(Homeexp.extractfrommap(allqueries[i]));
    }

    notifyListeners();
  }
}
