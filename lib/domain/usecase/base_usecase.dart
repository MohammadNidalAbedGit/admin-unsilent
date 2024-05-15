import 'package:admin_panel_unsilent/data/model/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<In,Out>{

  Future<Either<Failure , Out>> execute(In input);
}