import 'package:get/get.dart';

import '../../resource/repo/lottery_repository.dart';
import '../../resource/resource.dart';
import '../presentation.dart';

class SpecialNumberViewModel extends BaseViewModel {

  LotteryResult? lotteryResult;

  Map<String, dynamic> get numberData => {
    'repeat': getRepeatNumber(),
    'not_out': getNotOutNumber(),
  };

  init() async {
    await getLotteryResult();
  }

  Future getLotteryResult() async {
    setLoading(true);
    final _ = await LotteryRepository().getLotteryResult();
    if (_.isSuccess) {
      lotteryResult = _.data;
      notifyListeners();
    }
    setLoading(false);
  }

  List<int> getNotOutNumber(){
    List<int> result = [];
    if(lotteryResult?.list != null){
      for(int i = 0; i < 100; i++){
        int count = 0;
        for(int j = 0; j < lotteryResult!.list!.length; j++){
          final currentTemp = lotteryResult!.list![j].openNumbersFormatted!;
          var currentNumber = int.parse('${currentTemp[3]}${currentTemp[4]}');

          if(i == currentNumber) count+=1;
        }

        if(count == 0){
          result.add(i);
        }
      }
    }

    return result;
  }

  List<Map<String, dynamic>> getRepeatNumber(){
    List<int> removeNumbers = [];
    List<Map<String, dynamic>> listRepeat = [];
    if(lotteryResult?.list != null) {
      for(int i = 0; i < lotteryResult!.list!.length; i++){
        final currentTemp = lotteryResult!.list![i].openNumbersFormatted!;
        var currentNumber = int.parse('${currentTemp[3]}${currentTemp[4]}');

        if(!removeNumbers.contains(currentNumber)){
          int count = 1;

          for(int j = i + 1; j < lotteryResult!.list!.length; j++){
            final nextTemp = lotteryResult!.list![j].openNumbersFormatted!;
            var nextNumber = int.parse('${nextTemp[3]}${nextTemp[4]}');

            if(currentNumber == nextNumber){
              removeNumbers.add(nextNumber);
              count += 1;
            }
          }

          listRepeat.add({
            'num': currentNumber,
            'count': count,
          });

          listRepeat.sort((a,b) => a['num'].compareTo(b['num']));
        }
      }
    }

    return listRepeat;
  }

  List<int> takeNumbersBySum({required int sum, required List<int> numbers}){
    List<int> result = [];
    for(var num in numbers){
      var temp = int.parse(num.toString());
      int sumOfNum = 0;
      late int splitNum;
      while(temp != 0){
        splitNum = temp % 10;
        sumOfNum += splitNum;
        temp = temp ~/ 10;
      }
      if(sum == sumOfNum) result.add(num);
    }
    return result;
  }
}
