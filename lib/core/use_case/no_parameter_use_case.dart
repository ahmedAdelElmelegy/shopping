import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/error/failure.dart';

abstract class NoParameterUseCase<Type> {
  Future<Either<Failure, Type>> call();
}
