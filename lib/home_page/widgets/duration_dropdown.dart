import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthq/utils/styles.dart';

import 'drop_down/dropdown_button2.dart';

// import '../custom_ui/drop_down/dropdown_button2.dart';
// import '../global/app_style.dart';

class DurationDropdown extends StatefulWidget {
  final double height;
  final double width;
  final double textSize;
  final Function? onCallBack;

  const DurationDropdown(
      {Key? key,
      this.onCallBack,
      this.height = 33,
      this.width = 130,
      this.textSize = 14})
      : super(key: key);

  @override
  DurationDropdownState createState() => DurationDropdownState();
}

class DurationDropdownState extends State<DurationDropdown> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var languages = ["This Week", "This Month"];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        alignment: Alignment.centerLeft,
        isExpanded: true,
        items: languages
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Row(
                    children: [
                      SizedBox(
                        child: Text(
                          item,
                          style: regularText(size: widget.textSize),
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
        buttonHeight: widget.height,
        buttonWidth: widget.width,
        buttonPadding: const EdgeInsets.only(left: 10, right: 10),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color(0xFFF4F4F4),
        ),
        borderColor: Color(0xFFF4F4F4),
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
