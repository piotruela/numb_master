import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:numb_master/core/error/failures.dart';

abstract class FutureUseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}