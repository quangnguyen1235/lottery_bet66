import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

import '../presentation.dart';

class SpecialNumberScreen extends StatefulWidget {
  const SpecialNumberScreen({Key? key}) : super(key: key);

  @override
  _SpecialNumberScreenState createState() => _SpecialNumberScreenState();
}

class _SpecialNumberScreenState extends State<SpecialNumberScreen> {
  late SpecialNumberViewModel _viewModel;

  final ScrollController controller1 = ScrollController();
  final ScrollController controller2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SpecialNumberViewModel>(
      viewModel: SpecialNumberViewModel(),
      onViewModelReady: (viewModel) {
        _viewModel = viewModel..init();
      },
      // child: WidgetBackground(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: _buildBody(),
        );
      },
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "Số trùng lặp",
                style: AppTextStyles.normalSemiBold.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                "Số chưa ra",
                style: AppTextStyles.normalSemiBold.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Expanded(
          child: IntrinsicHeight(
            child: Row(
              children: [
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
                                _viewModel.numberData['repeat'].length,
                                (index) => buildChild(
                                    _viewModel.numberData['repeat'][index]))),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Scrollbar(
                    controller: controller2,
                    isAlwaysShown: true,
                    child: SingleChildScrollView(
                      controller: controller2,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                            children: List.generate(
                                _viewModel.numberData['not_out'].length,
                                (index) => buildNotOutChild(
                                    _viewModel.numberData['not_out'][index]))),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FlatButton(
                color: Colors.blue,
                onPressed: () => _viewModel.getLotteryResult(),
                child: const Center(
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
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
