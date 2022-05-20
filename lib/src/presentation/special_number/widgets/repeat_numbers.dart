import 'package:flutter/material.dart';
import 'package:flutter_app/src/presentation/special_number/_viewmodel.dart';
import 'package:flutter_app/src/presentation/special_number/widgets/widgets.dart';
import 'package:get/get.dart';

import '../../../configs/configs.dart';

class RepeatNumbers extends StatelessWidget {
  RepeatNumbers({Key? key}) : super(key: key);

  final ScrollController controller1 = ScrollController();

  final SpecialNumberViewModel _viewModel = Get.find<SpecialNumberViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Số đã ra",
          style: AppTextStyles.normalSemiBold.copyWith(fontSize: 24),
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
                  children: List.generate(19, (index) => Column(
                    children: [
                      NumberBySum(
                        sum: index,
                        numbers: _viewModel.takeNumbersBySum(sum: index, numbers: List.from(_viewModel.numberData['repeat'].map((e) => e['num']))),
                        builder: (context, number) => buildChild(_viewModel.numberData['repeat'].firstWhere((e) => e['num'] == number),),
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

  Widget buildChild(Map<String, dynamic> r) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Số: ${r['num']}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Text(
              "Số lần ra: ${r['count']}",
              style: const TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
