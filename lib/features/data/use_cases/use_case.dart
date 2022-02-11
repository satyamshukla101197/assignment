
import 'package:dartz/dartz.dart';
import 'package:supdup/core/error/failures.dart';
import 'package:supdup/core/usecse/usecase.dart';
import 'package:supdup/features/data/entities/entities.dart';
import 'package:supdup/features/domain/repositories/repository.dart';

class HomeScreenUseCase
    extends UseCase<UserModelEntity,NoParams>{
  final Repository _repository;

  HomeScreenUseCase(this._repository);

  @override
  Future<Either<Failure, UserModelEntity>> call(NoParams params) async{
    print("usecase data");
    return await _repository.getAllUser();
  }

}

