import 'package:chopper/chopper.dart';

part 'api.chopper.dart';

const DOMAIN = 'rickandmortyapi.com';
const String BASE_URL = 'https://$DOMAIN';

@ChopperApi()
abstract class Api extends ChopperService {
  // ignore: unused_field
  static _$Api _apiService;

  @Get(path: '/api/character')
  Future<Response> characters(@Query('page') int page);

  @Get(path: '/api/character/{id}')
  Future<Response> characterDetail(@Path('id') int id);

  @Get(path: '/api/episode')
  Future<Response> episodes(@Query('page') int page);

  @Get(path: '/api/episode/{id}')
  Future<Response> epicodeDetail(@Path('id') int id);

  @Get(path: '/api/location')
  Future<Response> locations(@Query('page') int page);

  @Get(path: '/api/location/{id}')
  Future<Response> locationDetail(@Path('id') int id);

  static _$Api create() => _initService(BASE_URL);

  static _$Api _initService(String baseUrl) {
    chopperLogger.clearListeners();
    chopperLogger.onRecord.listen((rec) {
      print('${rec.level.name} : ${rec.time} : ${rec.message}');
    });

    final client = ChopperClient(
      baseUrl: baseUrl,
      interceptors: [
        HeadersInterceptor({'Cache-Control': 'no-cache'}),
        HttpLoggingInterceptor(),
      ],
      services: [
        _$Api(),
      ],
    );

    return _$Api(client);
  }
}
