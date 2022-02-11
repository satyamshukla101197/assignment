import 'package:dartz/dartz.dart';
import 'package:supdup/core/error/exceptions.dart';
import 'package:supdup/core/error/failures.dart';
import 'package:supdup/core/network/network_info.dart';
import 'package:supdup/core/utils/constants.dart';
import 'package:supdup/features/data/Model/user_model.dart';
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
        final userDetails = List<UserResultEntity>.empty(growable: true);
       customerDetails.userResult!.forEach((element) {

         userDetails.add(UserResultEntity(
             company: CompanyEntity(
                 name: element.company!.name,
                 catchPhrase: element.company!.catchPhrase,
                 bs: element.company!.bs
             ),
             id: element.id,
             phone: element.phone,
             address: AddressEntity(
                 geo: GeoEntity(
                     long: element.address!.geo.long,
                     lat: element.address!.geo.lat
                 ),
                 suite: element.address!.suite,
                 zipcode: element.address!.zipcode,
                 street: element.address!.street,
                 city: element.address!.city
             ),
             email: element.email,
             username: element.username,
             website: element.website,
             name: element.name
         )
         );
       });


        return Right(UserModelEntity(userResult:userDetails ));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: Constants.ERROR_NO_INTERNET));
    }
  }
}
