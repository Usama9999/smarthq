import 'package:flutter/material.dart';
import 'package:smarthq/responsive.dart';
import 'package:smarthq/utils/styles.dart';

class ItemLists extends StatefulWidget {
  final String icon;
  final String name;
  final bool upgradeOnly;
  bool isOpen;
  ItemLists({
    super.key,
    required this.icon,
    required this.name,
    this.upgradeOnly = false,
    this.isOpen = false,
  });

  @override
  State<ItemLists> createState() => _ItemListsState();
}

class _ItemListsState extends State<ItemLists> {
  @override
  Widget build(BuildContext context) {
    return MaintainHeight(
      isScrollable: Responsive.isMobile(context),
      child: widget.isOpen || Responsive.isDesktop(context)
          ? Container(
              height: 200,
              margin: EdgeInsets.symmetric(
                  horizontal: Responsive.isMobile(context) ? 0 : 8,
                  vertical: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.name,
                          style: subHeadingText(),
                        ),
                      ),
                      Text(
                        'View All',
                        style: subHeadingText(size: 14),
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  ),
                  const Divider(
                    color: Color(0xFFF1F1F1),
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                        color: Color(0xFFF1F1F1),
                      ),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Image.asset(
                              'assets/${widget.icon}',
                              height: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              'Air conditioning maintenance building A',
                              style: regularText(size: 12),
                            )),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              size: 25,
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          : GestureDetector(
              onTap: () {
                widget.isOpen = true;
                setState(() {});
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/${widget.icon}',
                      height: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        widget.name,
                        style: subHeadingText(),
                      ),
                    ),
                    Text(
                      '10',
                      style: regularText(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 25,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
