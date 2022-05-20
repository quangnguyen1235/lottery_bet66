import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

import '../presentation.dart';
import 'widgets/widgets.dart';

class SpecialNumberScreen extends StatefulWidget {
  const SpecialNumberScreen({Key? key}) : super(key: key);

  @override
  _SpecialNumberScreenState createState() => _SpecialNumberScreenState();
}

class _SpecialNumberScreenState extends State<SpecialNumberScreen>
    with ResponsiveWidget {
  late SpecialNumberViewModel _viewModel;

  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SpecialNumberViewModel>(
      viewModel: SpecialNumberViewModel(),
      onViewModelReady: (viewModel) {
        _viewModel = viewModel..init();
      },
      // child: WidgetBackground(),
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            body: _buildBody(),
          ),
        );
      },
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: buildUi(context),
          ),
          buildButton(),
        ],
      ),
    );
  }

  Widget buildButton() {
    return Container(
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
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    // TODO: implement buildDesktop
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: RepeatNumbers(),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: NotOutNumber(),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    // TODO: implement buildMobile
    return PageView(
      controller: pageController,
      children: [
        RepeatNumbers(),
        NotOutNumber(),
      ],
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    // TODO: implement buildTablet
    return PageView(
      controller: pageController,
      children: [
        RepeatNumbers(),
        NotOutNumber(),
      ],
    );
  }
}
