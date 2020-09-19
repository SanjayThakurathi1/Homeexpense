import 'package:flutter/material.dart';
import 'package:nitesh/calculatorbarin.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/homeexpense.dart';

class ListViewBuilderr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final res = Provider.of<HomeVada>(context, listen: false).homeexpense;
    print(" result is = $res");

    return Material(
      child: ListView.builder(
          itemCount: res.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(res[index].name),
                subtitle: Text(res[index].roomnum),
                leading: Text(res[index].electricitynewnum),
                trailing: Text(res[index].electricityprevnum),
              )),
    );
  }
}
