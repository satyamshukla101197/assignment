import 'package:dartz/dartz.dart';
import 'package:supdup/core/error/exceptions.dart';
import 'package:supdup/core/error/failures.dart';
import 'package:supdup/core/network/network_info.dart';
import 'package:supdup/core/utils/constants.dart';
import 'package:supdup/features/data/datasource/local_datasource.dart';
import 'package:supdup/features/data/datasource/remote_datasource.dart';
import 'package:supdup/features/data/entities/entities.dart';
import 'package:supdup/features/domain/repositories/repository.dart';

class RepositoryImpl extends Repository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl(
      {required this.networkInfo,
      required this.localDataSource,
      required this.remoteDataSource});

  @override
  Future<Either<Failure, UserModelEntity>> getAllUser() async {
    if (await networkInfo.isConnected) {
      try {
        final customerDetails = await remoteDataSource.getAllUSer();




        final userDetails = List<UserModelEntity>.empty(growable: true);
        final useList = List<UserModelEntity>.empty(growable: true);

        customerDetails.userResult!.forEach((element) {
          //userDetails.add(Address(street: '', geo: null, city: ''));
          });
        return Right(userDetails());
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: Constants.ERROR_NO_INTERNET));
    }
  }
}
