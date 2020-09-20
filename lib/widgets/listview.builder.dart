import 'package:flutter/material.dart';
import 'package:nitesh/models/database.dart';

import 'package:provider/provider.dart';

import '../models/homeexpense.dart';

class ListViewBuilderr extends StatefulWidget {
  @override
  _ListViewBuilderrState createState() => _ListViewBuilderrState();
}

class _ListViewBuilderrState extends State<ListViewBuilderr> {
  List<Homeexp> homeexp = List();
  Future<void> getalldetails() async {
    homeexp = List<
        Homeexp>(); //clear the list before adding, else replicates will be there
    final db = DatabaseHelper.instance;
    //final List<Map<String, dynamic>> allqueries = await db.queryall();
    List<Map<String, dynamic>> allqueries = await db.queryall();

    print(allqueries);
    int count = allqueries.length;

    for (int i = 0; i < count; i++) {
      homeexp.add(Homeexp.extractfrommap(allqueries[i]));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getalldetails();
    //final res = Provider.of<HomeVada>(context, listen: false).homeexpense;
    //print(res[0].name);

    return Material(
      child: ListView.builder(
          itemCount: homeexp.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(homeexp[index].name),
                subtitle: Text(homeexp[index].roomnum),
                leading: Text(homeexp[index].electricitynewnum),
                trailing: Text(homeexp[index].electricityprevnum),
              )),
    );
  }
}
