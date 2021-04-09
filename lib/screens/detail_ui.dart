import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ui_km1/constants.dart';
import 'package:flutter_svg/svg.dart';

class DetailUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 15.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 25.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 21),
                      blurRadius: 53.0,
                      color: Colors.black.withOpacity(0.05),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Confirm Cases',
                          style: TextStyle(
                            color: kTextMediumColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                          ),
                        ),
                        SvgPicture.asset('assets/icons/more.svg')
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Text(
                          '1062',
                          style: Theme.of(context).textTheme.headline2.copyWith(color: kPrimaryColor, height: 1.2),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          '9.5%',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        SvgPicture.asset('assets/icons/increase.svg')
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'From Helth Center',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: kTextMediumColor,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    WeeklyChart(),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '6.58%',
                              style: Theme.of(context).textTheme.headline5.copyWith(
                                    color: kPrimaryColor,
                                    height: 1.2,
                                  ),
                            ),
                            Text(
                              'From Last Week',
                              style: TextStyle(
                                color: kTextMediumColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '9.45%',
                              style: Theme.of(context).textTheme.headline5.copyWith(
                                    color: kPrimaryColor,
                                    height: 1.2,
                                  ),
                            ),
                            Text(
                              'Recovery Rate',
                              style: TextStyle(
                                color: kTextMediumColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 25.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 21),
                      blurRadius: 53.0,
                      color: Colors.black.withOpacity(0.05),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Global Map',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/more.svg'
                        )
                      ],
                    ),
                    SvgPicture.asset('assets/icons/map.svg'),
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
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}

class WeeklyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: BarChart(
        BarChartData(
            barGroups: getBarGroups(),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
                leftTitles: SideTitles(
                  showTitles: false,
                ),
                bottomTitles: SideTitles(
                    showTitles: true,
                    getTitles: getWeek,
                    getTextStyles: (a) {
                      return TextStyle(
                        color: Color(0xFF7589A2),
                        fontSize: 10,
                        fontWeight: FontWeight.w200,
                      );
                    }))),
      ),
    );
  }

  String getWeek(double value) {
    switch (value.toInt()) {
      case 0:
        return 'MON';
      case 1:
        return 'TUE';
      case 2:
        return 'WED';
      case 3:
        return 'THU';
      case 4:
        return 'FRI';
      case 5:
        return 'SAT';
      case 6:
        return 'SUN';
      default:
        return '';
    }
  }

  getBarGroups() {
    List<double> barChartDatas = [6, 10, 8, 7, 10, 15, 9];
    List<BarChartGroupData> barChartGroups = [];
    barChartDatas.asMap().forEach(
          (i, value) => barChartGroups.add(
            BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  y: value,
                  width: 16,
                  colors: [i == 4 ? kPrimaryColor : kInactiveChartColor],
                ),
              ],
            ),
          ),
        );
    return barChartGroups;
  }
}
