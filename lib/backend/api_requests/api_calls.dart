import 'api_manager.dart';

Future<dynamic> detaTestCall({
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
    returnResponse: true,
  );
}
