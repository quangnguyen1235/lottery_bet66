/// total : null
/// per_page : 1
/// current_page : "1"
/// last_page : null
/// lottery_code : "mb45g"
/// lottery_id : 47
/// series_id : 2
/// non_periodic : 0
/// series_code : "northern"
/// list : [{"issue":"202205180273","open_numbers":"95815|33465|77317,20170|75738,26155,79208,13749,53097,37739|6034,5078,8545,2503|5339,1001,5808,5089,7861,0781|090,548,617|93,65,44,80","encoded_time":"2022-05-18 10:24:51","official_time":"2022-05-18 10:24:45","end_time":"2022-05-18 10:24:45","open_numbers_formatted":["9","5","8","1","5"],"open_result":{"bigSmall":[{"name":"big","result":"big"},{"name":"big","result":"big"},{"name":"big","result":"big"},{"name":"small","result":"small"},{"name":"big","result":"big"}],"oddEven":[{"name":"odd","result":"odd"},{"name":"odd","result":"odd"},{"name":"even","result":"even"},{"name":"odd","result":"odd"},{"name":"odd","result":"odd"}],"sumTotalList":{"sumTotal":28,"bigSmall":{"name":"big","result":"big"},"oddEven":{"name":"even","result":"even"}}}}]

class LotteryResult {
  LotteryResult({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.lotteryCode,
    this.lotteryId,
    this.seriesId,
    this.nonPeriodic,
    this.seriesCode,
    this.list,
  });

  LotteryResult.fromJson(dynamic json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    lotteryCode = json['lottery_code'];
    lotteryId = json['lottery_id'];
    seriesId = json['series_id'];
    nonPeriodic = json['non_periodic'];
    seriesCode = json['series_code'];
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list?.add(LotteryData.fromJson(v));
      });
    }
  }
  dynamic total;
  int? perPage;
  String? currentPage;
  dynamic lastPage;
  String? lotteryCode;
  int? lotteryId;
  int? seriesId;
  int? nonPeriodic;
  String? seriesCode;
  List<LotteryData>? list;

  LotteryResult copyWith({
    dynamic total,
    int? perPage,
    String? currentPage,
    dynamic lastPage,
    String? lotteryCode,
    int? lotteryId,
    int? seriesId,
    int? nonPeriodic,
    String? seriesCode,
    List<LotteryData>? list,
  }) =>
      LotteryResult(
        total: total ?? this.total,
        perPage: perPage ?? this.perPage,
        currentPage: currentPage ?? this.currentPage,
        lastPage: lastPage ?? this.lastPage,
        lotteryCode: lotteryCode ?? this.lotteryCode,
        lotteryId: lotteryId ?? this.lotteryId,
        seriesId: seriesId ?? this.seriesId,
        nonPeriodic: nonPeriodic ?? this.nonPeriodic,
        seriesCode: seriesCode ?? this.seriesCode,
        list: list ?? this.list,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['per_page'] = perPage;
    map['current_page'] = currentPage;
    map['last_page'] = lastPage;
    map['lottery_code'] = lotteryCode;
    map['lottery_id'] = lotteryId;
    map['series_id'] = seriesId;
    map['non_periodic'] = nonPeriodic;
    map['series_code'] = seriesCode;
    if (list != null) {
      map['list'] = list?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// issue : "202205180273"
/// open_numbers : "95815|33465|77317,20170|75738,26155,79208,13749,53097,37739|6034,5078,8545,2503|5339,1001,5808,5089,7861,0781|090,548,617|93,65,44,80"
/// encoded_time : "2022-05-18 10:24:51"
/// official_time : "2022-05-18 10:24:45"
/// end_time : "2022-05-18 10:24:45"
/// open_numbers_formatted : ["9","5","8","1","5"]
/// open_result : {"bigSmall":[{"name":"big","result":"big"},{"name":"big","result":"big"},{"name":"big","result":"big"},{"name":"small","result":"small"},{"name":"big","result":"big"}],"oddEven":[{"name":"odd","result":"odd"},{"name":"odd","result":"odd"},{"name":"even","result":"even"},{"name":"odd","result":"odd"},{"name":"odd","result":"odd"}],"sumTotalList":{"sumTotal":28,"bigSmall":{"name":"big","result":"big"},"oddEven":{"name":"even","result":"even"}}}

class LotteryData {
  LotteryData({
    this.issue,
    this.openNumbers,
    this.encodedTime,
    this.officialTime,
    this.endTime,
    this.openNumbersFormatted,
  });

  LotteryData.fromJson(dynamic json) {
    issue = json['issue'];
    openNumbers = json['open_numbers'];
    encodedTime = json['encoded_time'];
    officialTime = json['official_time'];
    endTime = json['end_time'];
    openNumbersFormatted = json['open_numbers_formatted'] != null
        ? json['open_numbers_formatted'].cast<String>()
        : [];
  }
  String? issue;
  String? openNumbers;
  String? encodedTime;
  String? officialTime;
  String? endTime;
  List<String>? openNumbersFormatted;

  LotteryData copyWith({
    String? issue,
    String? openNumbers,
    String? encodedTime,
    String? officialTime,
    String? endTime,
    List<String>? openNumbersFormatted,
  }) =>
      LotteryData(
        issue: issue ?? this.issue,
        openNumbers: openNumbers ?? this.openNumbers,
        encodedTime: encodedTime ?? this.encodedTime,
        officialTime: officialTime ?? this.officialTime,
        endTime: endTime ?? this.endTime,
        openNumbersFormatted: openNumbersFormatted ?? this.openNumbersFormatted,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['issue'] = issue;
    map['open_numbers'] = openNumbers;
    map['encoded_time'] = encodedTime;
    map['official_time'] = officialTime;
    map['end_time'] = endTime;
    map['open_numbers_formatted'] = openNumbersFormatted;
    return map;
  }
}

/// bigSmall : [{"name":"big","result":"big"},{"name":"big","result":"big"},{"name":"big","result":"big"},{"name":"small","result":"small"},{"name":"big","result":"big"}]
/// oddEven : [{"name":"odd","result":"odd"},{"name":"odd","result":"odd"},{"name":"even","result":"even"},{"name":"odd","result":"odd"},{"name":"odd","result":"odd"}]
/// sumTotalList : {"sumTotal":28,"bigSmall":{"name":"big","result":"big"},"oddEven":{"name":"even","result":"even"}}
