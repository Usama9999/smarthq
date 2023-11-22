import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthq/utils/styles.dart';

import 'drop_down/dropdown_button2.dart';

// import '../custom_ui/drop_down/dropdown_button2.dart';
// import '../global/app_style.dart';

class PropertyDropdown extends StatefulWidget {
  final Function? onCallBack;

  const PropertyDropdown({Key? key, this.onCallBack}) : super(key: key);

  @override
  PropertyDropdownState createState() => PropertyDropdownState();
}

class PropertyDropdownState extends State<PropertyDropdown> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var languages = ["Laundromat Store A", "Laundromat Store B"];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        alignment: Alignment.centerLeft,
        leadingWidget: Row(children: [
          Image.asset(
            'assets/ic_property.png',
            color: Colors.black,
            height: 23,
          ),
          const SizedBox(
            width: 5,
          ),
        ]),
        isExpanded: true,
        items: languages
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Row(
                    children: [
                      SizedBox(
                        child: Text(
                          item,
                          style: subHeadingText(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
        value: languages[0],
        onChanged: (locale) {
          if (widget.onCallBack != null) {
            widget.onCallBack!();
          }
        },
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.grey.shade400,
        ),
        iconDisabledColor: Colors.grey,
        buttonHeight: 33,
        buttonWidth: double.infinity,
        buttonPadding: const EdgeInsets.only(left: 10, right: 10),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        borderColor: Color(0xFF999999),
        itemHeight: 33,
        dropdownMaxHeight: 100,
        dropdownPadding: null,
        focusColor: Colors.transparent,
        dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        scrollbarRadius: const Radius.circular(1),
        scrollbarThickness: 1,
        scrollbarAlwaysShow: true,
        offset: const Offset(0, 0),
      ),
    );
  }
}
