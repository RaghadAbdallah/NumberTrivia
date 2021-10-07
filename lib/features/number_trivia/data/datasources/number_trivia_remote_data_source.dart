import 'dart:convert';

import 'package:project1/core/error/exceptions.dart';
import 'package:project1/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:project1/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:http/http.dart' as http;

abstract class NumberTriviaRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource{
  final http.Client client;

  NumberTriviaRemoteDataSourceImpl({
    required this.client});
  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) => _getTriviaFromUrl('http://numbersapi.com/$number');
  @override
  Future<NumberTriviaModel> getRandomNumberTrivia()  => _getTriviaFromUrl('http://numbersapi.com/random');

  Future<NumberTriviaModel> _getTriviaFromUrl(String url) async{
    final response = await client.get(Uri.parse(url));

    if(response.statusCode == 200){
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else{
      throw ServerException();
    }
  }

}
