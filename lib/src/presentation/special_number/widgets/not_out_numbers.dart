import 'package:flutter/material.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:get/get.dart';

import '../../../configs/constanst/constants.dart';
import 'number_by_sum.dart';

class NotOutNumber extends StatelessWidget {
  NotOutNumber({Key? key}) : super(key: key);

  final ScrollController controller1 = ScrollController();

  final SpecialNumberViewModel _viewModel = Get.find<SpecialNumberViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Số chưa ra",
          style: AppTextStyles.normalSemiBold.copyWith(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16,),
        Expanded(
          child: Scrollbar(
            controller: controller1,
            isAlwaysShown: true,
            child: SingleChildScrollView(
              controller: controller1,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: List.generate(
                      19,
                      (index) => Column(
                            children: [
                              NumberBySum(
                                sum: index,
                                numbers: _viewModel.takeNumbersBySum(
                                    sum: index,
                                    numbers: List.from(
                                        _viewModel.numberData['not_out'])),
                                builder: (context, number) => buildNotOutChild(
                                  _viewModel.numberData['not_out']
                                      .firstWhere((e) => e == number),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                            ],
                          )),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNotOutChild(int number) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Số: $number",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
