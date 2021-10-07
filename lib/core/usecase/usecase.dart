import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:project1/core/error/failures.dart';
import 'package:project1/features/number_trivia/domain/entities/number_trivia.dart';

abstract class UseCase <Type,Params>{
  @override
  Future<Either<Failure,Type>> call(Params params);
}

class NoParams extends Equatable{}