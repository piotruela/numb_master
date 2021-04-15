import 'package:dartz/dartz.dart';
import 'package:numb_master/core/error/failures.dart';

abstract class UseCase<T, Params> {
  Either<Failure, T> call(Params params);
}