import 'package:dio/dio.dart';
import '../../configs/configs.dart';
import '../../utils/utils.dart';
import '../resource.dart';

class LotteryRepository {
  LotteryRepository._();

  static LotteryRepository? _instance;

  factory LotteryRepository() {
    _instance ??= LotteryRepository._();
    return _instance!;
  }

  ///Example
  ///http://relax365.net/hsmoreapp?os=
  Future<NetworkState> getLotteryResult({int page = 1, int limit = 100}) async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) return NetworkState.withDisconnect();
    try {
      String api = AppEndpoint.DRAW_RESULT;
      Map<String, dynamic> params = {
        'lottery_id': 47,
        'page': page,
        'limit': limit,
      };
      Response response = await AppClients().get(api, queryParameters: params);
      return NetworkState.fromResponse(
        response,
        converter: (data) => LotteryResult.fromJson(data),
      );
    } on DioError catch (e) {
      return NetworkState.withError(e);
    }
  }
}
