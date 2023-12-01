import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthq/home_page/measure_size.dart';
import 'package:smarthq/home_page/widgets/chart.dart';
import 'package:smarthq/home_page/widgets/duration_dropdown.dart';
import 'package:smarthq/home_page/widgets/financial_report_chart.dart';
import 'package:smarthq/home_page/widgets/item_lists.dart';
import 'package:smarthq/home_page/widgets/property_dropdown.dart';
import 'package:smarthq/responsive.dart';
import 'package:smarthq/utils/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double fixHeight = Get.height;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    bool allowScroll = screenHeight < 750;
    return Scaffold(
      backgroundColor: Color(0xFF272625),
      body: Column(
        children: [
          appBar(),
          Expanded(
            child: Responsive(
              desktop: Row(
                children: [
                  const SizedBox(
                    width: 100,
                  ),
                  Expanded(
                    child: allowScroll
                        ? SingleChildScrollView(
                            child: dekstopData(allowScroll),
                          )
                        : dekstopData(allowScroll),
                  ),
                ],
              ),
              mobile: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                children: [
                  chartSection(),
                  propertyCount(),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What's New",
                          style: headingText(size: 18, color: Colors.white),
                        ),
                        const Divider(
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  Container(
                      child: ItemLists(icon: 'ic_refund.png', name: 'REFUNDS')),
                  ItemLists(icon: 'ic_notification.png', name: 'NOTIFICATIONS'),
                  ItemLists(icon: 'ic_checkboard.png', name: 'TASK MANAGEMENT'),
                  ItemLists(icon: 'ic_warning.png', name: 'ADVANCED DIAGNOSTIC')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row dekstopData(bool allowScroll) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: MeasureSize(
            onChange: (Size size) {
              fixHeight = size.height;
              setState(() {});
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                revenueDekstop(),
                propertyCount(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PropertyDropdown(
                    onCallBack: () {},
                  ),
                ),
                connectedAppliances(),
                MaintainHeight(
                    isScrollable: allowScroll,
                    child: automatedFictionalReporting())
              ],
            ),
          ),
        ),
        chartSection(),
        Expanded(
          flex: 8,
          child: SizedBox(
            height: fixHeight,
            child: Column(
              children: [
                ItemLists(icon: 'ic_refund.png', name: 'REFUNDS'),
                ItemLists(icon: 'ic_notification.png', name: 'NOTIFICATIONS'),
                ItemLists(icon: 'ic_checkboard.png', name: 'TASK MANAGEMENT'),
                ItemLists(icon: 'ic_warning.png', name: 'ADVANCED DIAGNOSTIC')
              ],
            ),
          ),
        )
      ],
    );
  }

  Responsive chartSection() {
    return Responsive(
      desktop: Expanded(
          flex: 14,
          child: Container(
            height: fixHeight - 12,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'REVENUE',
                          style: subHeadingText(size: 30),
                        ),
                      ),
                      const DurationDropdown()
                    ],
                  ),
                  const Divider(
                    color: Color(0xFFF1F1F1),
                  ),
                  Text(
                    '\$30000',
                    style: headingText(size: 30),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Expanded(child: CustomChart())
                ],
              ),
            ),
          )),
      mobile: Container(
        height: 250,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TOTAL REVENUE',
                            style: subHeadingText(size: 14),
                          ),
                          Text(
                            'Totals may be delayed by 5 minutes',
                            style: normalText(size: 8),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$12,888',
                      style: subHeadingText(size: 25),
                    ),
                  ],
                ),
              ),
              Divider(),
              const Row(
                children: [
                  Spacer(),
                  DurationDropdown(
                    height: 25,
                    width: 100,
                    textSize: 10,
                  )
                ],
              ),
              const Expanded(child: CustomChart())
            ],
          ),
        ),
      ),
    );
  }

  Container automatedFictionalReporting() {
    return Container(
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Automated financial reporting',
            style: subHeadingText(),
          ),
          const Divider(
            color: Color(0xFFF1F1F1),
          ),
          Container(height: 250, width: double.infinity, child: MyHomePage())
        ],
      ),
    );
  }

  Row appliancesCount(
      {required String name, required String count, required String icon}) {
    return Row(
      children: [
        Image.asset(
          'assets/${icon}',
          height: 18,
        ),
        Text(
          ' ${count} ',
          style: headingText(size: 12),
        ),
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              name,
              style: normalText(size: 12),
            ),
          ),
        ),
      ],
    );
  }

  Responsive propertyCount() {
    return Responsive(
      desktop: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '3 Total Properties',
              style: headingText(size: 18, color: Colors.white),
            ),
            const Divider(
              color: Colors.white,
            )
          ],
        ),
      ),
      mobile: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 9),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.amber),
            borderRadius: BorderRadius.circular(7)),
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [
            Image.asset(
              'assets/ic_property.png',
              color: Colors.white,
              height: 23,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                'Total Properties',
                style: headingText(size: 16, color: Colors.white),
              ),
            ),
            Text(
              '999',
              style: headingText(size: 16, color: Colors.white),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Container revenueDekstop() {
    return Container(
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TOTAL REVENUE',
            style: subHeadingText(),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Totals may be delayed by 5 minutes',
            style: subHeadingText(size: 12, color: Color(0xFF979797)),
          ),
          const Divider(
            color: Color(0xFFF1F1F1),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            '\$7,189.10',
            style: headingText(size: 30),
          ),
        ],
      ),
    );
  }

  Container connectedAppliances() {
    return Container(
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CONNECTED APPLIANCES',
            style: headingText(color: Color(0xFF525252)),
          ),
          const Divider(
            color: Color(0xFFF1F1F1),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  appliancesCount(
                      name: 'Drayer', count: '220', icon: 'ic_dryer.png'),
                  const SizedBox(
                    height: 5,
                  ),
                  appliancesCount(
                      name: 'Washer', count: '220', icon: 'ic_washer.png'),
                ],
              )),
              Expanded(
                  child: Column(
                children: [
                  appliancesCount(
                      name: 'Leaked Sensor',
                      count: '220',
                      icon: 'ic_senser.png'),
                  const SizedBox(
                    height: 5,
                  ),
                  appliancesCount(
                      name: 'Smart Plug',
                      count: '220',
                      icon: 'ic_smart_plug.png'),
                ],
              ))
            ],
          )
        ],
      ),
    );
  }

  Responsive appBar() {
    return Responsive(
      desktop: Container(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 15),
        margin: EdgeInsets.only(bottom: Responsive.isMobile(context) ? 3 : 10),
        height: 70,
        child: Row(
          children: [
            Image.asset('assets/ic_logo.png'),
            Expanded(
                child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('TOURO COLLEGE OF OSTEOPATHIC MEDICINE',
                    style: subHeadingText(size: 19, color: Colors.white)),
              ),
            )),
            iconCountWidget(count: '2', icon: 'ic_checkboard.png'),
            iconCountWidget(count: '2', icon: 'ic_notification.png'),
            iconCountWidget(count: '2', icon: 'ic_warning.png'),
            const SizedBox(
              width: 20,
            ),
            CircleAvatar(
              backgroundColor: Colors.amber,
              child: Text(
                "US",
                style: headingText(size: 18),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ketty Shrewbarry',
                    style: subHeadingText(color: Colors.white, size: 14),
                  ),
                  Text(
                    'Owner',
                    style: normalText(color: Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      mobile: AppBar(
        backgroundColor: Color(0xFF272625),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: CircleAvatar(
            backgroundColor: Colors.amber,
            child: Text(
              "US",
              style: headingText(size: 18),
            ),
          ),
        ),
        title: Text(
          'COMPANY NAME',
          style: subHeadingText(size: 18, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Image.asset('assets/ic_add_machine.png'),
          )
        ],
      ),
    );
  }

  Padding iconCountWidget({required String count, required String icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Image.asset(
            'assets/${icon}',
            height: 23,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            "(${count})",
            style: regularText(size: 17, color: Colors.white),
          )
        ],
      ),
    );
  }
}
