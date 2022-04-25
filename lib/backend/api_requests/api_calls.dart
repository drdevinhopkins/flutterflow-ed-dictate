import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class DetaTestCall {
  static Future<ApiCallResponse> call({
    String text = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deta test',
      apiUrl: 'https://smei51.deta.dev/nlp/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'text': text,
      },
      returnBody: true,
    );
  }
}
