import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_ui_km1/constants.dart';
import 'package:flutter_app_ui_km1/screens/detail_ui.dart';
import 'package:flutter_svg/svg.dart';

class HomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //height: 300.0,
            padding: EdgeInsets.all(20.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.03),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Wrap(
              runSpacing: 20.0,
              spacing: 20.0,
              children: [
                CardCovidResult(
                  title: "Confirmed Cases",
                  iconColor: Color(0xFFFF8C00),
                  effectedNum: 1062,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return DetailUI();
                      }),
                    );
                  },
                ),
                CardCovidResult(
                  title: "Total Deaths",
                  iconColor: Color(0xFFFF2D55),
                  effectedNum: 75,
                  press: () {},
                ),
                CardCovidResult(
                  title: "Total Recovered",
                  iconColor: Color(0xFF50E3C2),
                  effectedNum: 689,
                  press: () {},
                ),
                CardCovidResult(
                  title: "New Cases",
                  iconColor: Color(0xFF5856D6),
                  effectedNum: 75,
                  press: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preventions',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PreventionCard(
                          svgCard: 'assets/icons/hand_wash.svg',
                          title: 'Wash Hands',
                        ),
                        PreventionCard(
                          svgCard: 'assets/icons/use_mask.svg',
                          title: 'Use Masks',
                        ),
                        PreventionCard(
                          svgCard: 'assets/icons/Clean_Disinfect.svg',
                          title: 'Clean_Disinfect',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 150.0,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            height: 130.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF60BE93),
                                  Color(0xFF1B8D59),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .4,
                              top: 20,
                              right: 20,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Dial 999 for \nMedical Help!\n",
                                    style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
                                  ),
                                  TextSpan(
                                    text: "If any symptoms appear",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: SvgPicture.asset('assets/icons/nurse.svg'),
                          ),
                          Positioned(
                            top: 30,
                            right: 10,
                            child: SvgPicture.asset("assets/icons/virus.svg"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.1),
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/icons/menu.svg'),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          onPressed: () {},
        )
      ],
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String svgCard;
  final String title;

  const PreventionCard({
    Key key,
    this.svgCard,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgCard),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1.copyWith(color: kPrimaryColor),
        )
      ],
    );
  }
}

class CardCovidResult extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  final Function press;

  const CardCovidResult({
    Key key,
    this.title,
    this.effectedNum,
    this.iconColor,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: press,
          child: Container(
            //width: 200.0,
            width: constraints.maxWidth / 2 - 10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        height: 30.0,
                        width: 30.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: iconColor.withOpacity(0.12),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/running.svg',
                          height: 12.0,
                          width: 12.0,
                          color: iconColor,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: kTextColor),
                          children: [
                            TextSpan(
                              text: "$effectedNum\n",
                              style: Theme.of(context).textTheme.headline6.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            TextSpan(
                              text: "People",
                              style: TextStyle(
                                fontSize: 12,
                                height: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: LineReportChart()),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LineReportChart extends StatelessWidget {
  const LineReportChart({Key key}) : super(key: key);

  List<FlSpot> getSports() {
    return [
      FlSpot(0, .5),
      FlSpot(1, 1.5),
      FlSpot(2, .5),
      FlSpot(3, .7),
      FlSpot(4, .2),
      FlSpot(5, 2),
      FlSpot(6, 1.5),
      FlSpot(7, 1.7),
      FlSpot(8, 1),
      FlSpot(9, 2.8),
      FlSpot(10, 2.5),
      FlSpot(11, 2.65),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: getSports(),
              isCurved: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
              colors: [kPrimaryColor],
              barWidth: 4,
            ),
          ],
        ),
      ),
    );
  }
}
