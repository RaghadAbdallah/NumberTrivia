import 'package:dartz/dartz.dart';
import 'package:project1/core/error/failures.dart';
import 'package:project1/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure,NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure,NumberTrivia>> getRandomNumberTrivia(int number);
}