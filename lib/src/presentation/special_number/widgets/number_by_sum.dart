import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

class NumberBySum extends StatefulWidget {
  final int sum;
  final List<int> numbers;
  final Widget Function(BuildContext context, int number) builder;
  const NumberBySum(
      {Key? key,
      required this.sum,
      required this.numbers,
      required this.builder})
      : super(key: key);

  @override
  State<NumberBySum> createState() => _NumberBySumState();
}

class _NumberBySumState extends State<NumberBySum> {
  late bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 4,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Tổng ${widget.sum}",
                    style: AppTextStyles.normalBoldBlack
                        .copyWith(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '(gồm có ${widget.numbers.length} số)',
                    style: AppTextStyles.normalSemiBold
                        .copyWith(fontSize: 18, color: Colors.red),
                  ),
                  Spacer(),
                  Transform.rotate(
                    angle: -pi / 2,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isShow = !isShow;
                        });
                      },
                      child: SizedBox(
                        width: 44,
                        height: 44,
                        child: Center(
                          child: AnimatedCrossFade(
                            duration: const Duration(milliseconds: 150),
                            crossFadeState: isShow
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            firstChild: Icon(Icons.arrow_forward_ios),
                            secondChild: Icon(Icons.arrow_back_ios),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 250),
              crossFadeState:
                  isShow ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: widget.numbers.length > 0 ? Container(
                padding: EdgeInsets.all(16).copyWith(top: 0),
                child: Column(
                  children: <Widget>[Divider()] + List.generate(
                    widget.numbers.length,
                    (index) => widget.builder(context, widget.numbers[index]),
                  ),
                ),
              ) : SizedBox(),
              secondChild: SizedBox(width: Get.width,),
            ),
          ],
        ),
      ),
    );
  }
}
