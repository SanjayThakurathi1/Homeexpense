import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nitesh/models/homeexpense.dart';

import 'package:nitesh/widgets/singlechildscrollview.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeVada(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeExpense(),
      ),
    );
  }
}
