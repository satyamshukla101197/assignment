import 'package:dartz/dartz.dart';
import 'package:supdup/core/error/failures.dart';
import 'package:supdup/features/data/entities/entities.dart';

abstract class Repository {
  Future<Either<Failure, UserModelEntity>> getAllUser();
}