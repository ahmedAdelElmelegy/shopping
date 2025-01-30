import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';

abstract class ParameterUseCase<Type, Parameter> {
  Future<Either<Failure, Type>> call(Parameter parm);
}
