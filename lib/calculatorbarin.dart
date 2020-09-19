import 'package:flutter/material.dart';

class CalculatorBrain extends StatelessWidget {
  final String name;
  final String date;
  final double roomnum;
  final double electricityprevnum;
  final double electricitynewnum;
  final double previousroomamount;
  final double newroomamount;
  final double wifiamount;
  final double waternum;
  CalculatorBrain(
      {this.electricitynewnum,
      this.electricityprevnum,
      this.name,
      this.newroomamount,
      this.previousroomamount,
      this.roomnum,
      this.waternum,
      this.wifiamount,
      this.date});
  @override
  Widget build(BuildContext context) {
    double remainingelectricitynum = (electricitynewnum - electricityprevnum);
    double totalAmount = (remainingelectricitynum + waternum) * 13;
    double totalroomamount = (previousroomamount + newroomamount);
    double wholecalculation = (totalAmount + totalroomamount + wifiamount);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.amber,
        title: Text(
          "जम्मा रकम = $wholecalculation /-",
          style: buildTextStyle().copyWith(color: Colors.green, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 42,
              ),
              Text(
                "Date $date",
                style: buildTextStyle().copyWith(color: Colors.deepOrange),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "भाडावालाकाे नाम : $name",
                style: buildTextStyle()
                    .copyWith(fontSize: 22, color: Colors.lightBlue),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "काेठा नं ${roomnum.toInt()}",
                style: buildTextStyle()
                    .copyWith(fontSize: 22, color: Colors.lightBlue),
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              Text(
                "पुरानाे  बिधुत युनिट अंक =  $electricityprevnum ",
                style: buildTextStyle(),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              Text(
                " अहिलेकाे बिधुत युनिट अंक =  $electricitynewnum",
                style: buildTextStyle(),
              ),
              SizedBox(
                height: 14,
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              Text(
                "जम्मा  बिधुत अंक =  $remainingelectricitynum",
                style: buildTextStyle(),
              ),
              SizedBox(
                height: 14,
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              Text(
                "पानिकाे  बिधुत अंक =  $waternum",
                style: buildTextStyle(),
              ),
              SizedBox(
                height: 14,
              ),
              Divider(
                color: Colors.amber,
                thickness: 6,
              ),
              Text(
                "जम्मा  बिधुत रकम  = $totalAmount /-",
                style: buildTextStyle()
                    .copyWith(fontSize: 22, color: Colors.green),
              ),
              Divider(
                color: Colors.amber,
                thickness: 6,
              ),
              Text(
                "पुरानाे काेठा भाडा = $previousroomamount",
                style: buildTextStyle(),
              ),
              SizedBox(
                height: 14,
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              Text(
                "अहिलेकाे काेठा भाडा  = $newroomamount",
                style: buildTextStyle(),
              ),
              SizedBox(
                height: 14,
              ),
              Divider(
                color: Colors.amber,
                thickness: 6,
              ),
              Text(
                "जम्मा काेठा भाडा = $totalroomamount /-",
                style: buildTextStyle()
                    .copyWith(fontSize: 22, color: Colors.green),
              ),
              Divider(
                color: Colors.amber,
                thickness: 6,
              ),
              Text(
                "wifi  रकम  =  $wifiamount /-",
                style: buildTextStyle()
                    .copyWith(fontSize: 22, color: Colors.green),
              ),
              Divider(
                color: Colors.amber,
                thickness: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle buildTextStyle() =>
      TextStyle(fontWeight: FontWeight.bold, fontSize: 17);
}
