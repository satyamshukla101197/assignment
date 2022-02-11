



import 'package:dio/dio.dart';
import 'package:supdup/core/error/exceptions.dart';
import 'package:supdup/core/utils/constants.dart';
import 'package:supdup/core/utils/custom_extension.dart';
import 'package:supdup/features/data/Model/user_model.dart';
import 'package:supdup/features/data/client/client.dart';


/// Abstract class to get/push data from Remote Server
abstract class RemoteDataSource {



  Future<UserModel> getAllUSer();
}

/// Implementation class to get/push data from Remote Server
class RemoteDataSourceImpl extends RemoteDataSource {
  final RestClient client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> getAllUSer() async{
    try {
      return await client.getAllUser();
    } on DioError catch (e) {
      throw ServerException(message: e.getErrorFromDio());
    } on Exception {
      throw ServerException(message: Constants.ERROR_NO_INTERNET);
    }
  }


}