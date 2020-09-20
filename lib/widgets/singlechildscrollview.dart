import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nitesh/calculatorbarin.dart';
import 'package:nitesh/models/database.dart';
import 'package:nitesh/models/homeexpense.dart';
import 'package:nitesh/widgets/listview.builder.dart';
import 'package:provider/provider.dart';

class HomeExpense extends StatefulWidget {
  @override
  _HomeExpenseState createState() => _HomeExpenseState();
}

class _HomeExpenseState extends State<HomeExpense> {
  final _formkey = GlobalKey<FormState>();

  String vadaname,
      roomnum,
      wnum,
      epnum,
      ecnum,
      proomamount,
      nroomamount,
      wifiamount;

  String date = DateFormat.yMEd().add_jms().format(DateTime.now());
  var _newdetail = Homeexp(
    date: "",
    electricitynewnum: "",
    electricityprevnum: "",
    name: "",
    newroomamount: "",
    previousroomamount: '',
    roomnum: "",
    waternum: "",
    wifiamount: "",
  );
  void _savedetail() {
    _formkey.currentState.save();
    //Provider.of<HomeVada>(context, listen: false).adddetail(_newdetail);
    Provider.of<HomeVada>(context, listen: false).getalldetails();

    final db = DatabaseHelper.instance;
    db.insert(_newdetail);
  }

  void insertdata() {}

  void queryall() {
    // final res = db.queryall();
    // print(res.then((value) {
    //   print(value);
    // }));
    final db = DatabaseHelper.instance;
    db.deletedata();
  }

  @override
  Widget build(BuildContext context) {
    queryall();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  // insertdata();
                  final db = DatabaseHelper.instance;
                  var res = db.queryall();
                  res.then((value) {
                    print(value);
                  });
                  // _savedetail();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ListViewBuilderr()));
                })
          ],
          backgroundColor: Colors.amber,
          title: Text(
            "Home Expense",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 35,
              ),
              /*  TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "मिति"),
              ),
              SizedBox(
                height: 15,
              ),
              */
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return " please Enter name";
                  }
                  return null;
                }, //
                onChanged: (value) {
                  vadaname = value;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "भाडावालाकाे नाम"),
                onSaved: (newValue) {
                  _newdetail = Homeexp(
                    date: _newdetail.date,
                    electricitynewnum: _newdetail.electricitynewnum,
                    electricityprevnum: _newdetail.electricityprevnum,
                    name: newValue,
                    newroomamount: _newdetail.newroomamount,
                    previousroomamount: _newdetail.previousroomamount,
                    roomnum: _newdetail.roomnum,
                    waternum: _newdetail.waternum,
                    wifiamount: _newdetail.wifiamount,
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return " please Enter room num";
                  }
                  return null;
                }, //
                onChanged: (value) {
                  roomnum = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "काेठा नं."),
                onSaved: (newValue) {
                  _newdetail = Homeexp(
                    date: _newdetail.date,
                    electricitynewnum: _newdetail.electricitynewnum,
                    electricityprevnum: _newdetail.electricityprevnum,
                    name: _newdetail.name,
                    newroomamount: _newdetail.newroomamount,
                    previousroomamount: _newdetail.previousroomamount,
                    roomnum: newValue,
                    waternum: _newdetail.waternum,
                    wifiamount: _newdetail.wifiamount,
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return " please Enter Unit";
                  }
                  return null;
                }, //
                onChanged: (value) {
                  wnum = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "पानिकाे  बिधुत अंक"),
                onSaved: (newValue) {
                  _newdetail = Homeexp(
                    date: _newdetail.date,
                    electricitynewnum: _newdetail.electricitynewnum,
                    electricityprevnum: _newdetail.electricityprevnum,
                    name: _newdetail.name,
                    newroomamount: _newdetail.newroomamount,
                    previousroomamount: _newdetail.previousroomamount,
                    roomnum: _newdetail.roomnum,
                    waternum: newValue,
                    wifiamount: _newdetail.wifiamount,
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return " please Enter Unit";
                  }
                  return null;
                }, //
                onChanged: (value) {
                  epnum = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "पुरानाे  बिधुत युनिट अंक",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                onSaved: (newValue) {
                  _newdetail = Homeexp(
                    date: _newdetail.date,
                    electricitynewnum: _newdetail.electricitynewnum,
                    electricityprevnum: newValue,
                    name: _newdetail.name,
                    newroomamount: _newdetail.newroomamount,
                    previousroomamount: _newdetail.previousroomamount,
                    roomnum: _newdetail.roomnum,
                    waternum: _newdetail.waternum,
                    wifiamount: _newdetail.wifiamount,
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return " please Enter Unit";
                  }
                  return null;
                }, //
                onChanged: (value) {
                  ecnum = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "अहिलेकाे बिधुत युनिट अंक",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                onSaved: (newValue) {
                  _newdetail = Homeexp(
                    date: _newdetail.date,
                    electricitynewnum: newValue,
                    electricityprevnum: _newdetail.electricityprevnum,
                    name: _newdetail.name,
                    newroomamount: _newdetail.newroomamount,
                    previousroomamount: _newdetail.previousroomamount,
                    roomnum: _newdetail.roomnum,
                    waternum: _newdetail.waternum,
                    wifiamount: _newdetail.wifiamount,
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              /*  TextFormField(
                decoration: InputDecoration(
                  labelText: "जम्मा  बिधुत अंक",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              */
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return " please Enter Previous room rent";
                  }
                  return null;
                }, //
                onChanged: (value) {
                  proomamount = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "पुरानाे काेठा भाडा",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                onSaved: (newValue) {
                  _newdetail = Homeexp(
                    date: _newdetail.date,
                    electricitynewnum: _newdetail.electricitynewnum,
                    electricityprevnum: _newdetail.electricityprevnum,
                    name: _newdetail.name,
                    newroomamount: _newdetail.newroomamount,
                    previousroomamount: newValue,
                    roomnum: _newdetail.roomnum,
                    waternum: _newdetail.waternum,
                    wifiamount: _newdetail.wifiamount,
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return " please Current room rent";
                  }
                  return null;
                }, //
                onChanged: (value) {
                  nroomamount = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: " अहिलेकाे काेठा भाडा",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                onSaved: (newValue) {
                  _newdetail = Homeexp(
                    date: _newdetail.date,
                    electricitynewnum: _newdetail.electricitynewnum,
                    electricityprevnum: _newdetail.electricityprevnum,
                    name: _newdetail.name,
                    newroomamount: newValue,
                    previousroomamount: _newdetail.previousroomamount,
                    roomnum: _newdetail.roomnum,
                    waternum: _newdetail.waternum,
                    wifiamount: _newdetail.wifiamount,
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return " please Enter Wifi Price";
                  }
                  return null;
                }, //
                onChanged: (value) {
                  wifiamount = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "WIFI Price",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                onSaved: (newValue) {
                  _newdetail = Homeexp(
                    date: _newdetail.date,
                    electricitynewnum: _newdetail.electricitynewnum,
                    electricityprevnum: _newdetail.electricityprevnum,
                    name: _newdetail.name,
                    newroomamount: _newdetail.newroomamount,
                    previousroomamount: _newdetail.previousroomamount,
                    roomnum: _newdetail.roomnum,
                    waternum: _newdetail.waternum,
                    wifiamount: newValue,
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 380,
                height: 55,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {
                    if (_formkey.currentState.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CalculatorBrain(
                                    date: date,
                                    electricitynewnum: double.parse(ecnum),
                                    electricityprevnum: double.parse(epnum),
                                    name: vadaname,
                                    newroomamount: double.parse(nroomamount),
                                    previousroomamount:
                                        double.parse(proomamount),
                                    roomnum: double.parse(roomnum),
                                    waternum: double.parse(wnum),
                                    wifiamount: double.parse(wifiamount),
                                  )));
                    } else {
                      return Center(
                        child: Text("please fill the field"),
                      );
                    }
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  color: Colors.amber,
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
