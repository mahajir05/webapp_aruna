abstract class UseCase<Type, Params> {
  Future<Type> call(Params params, [bool isPrototype]);
}

class NoParams {}
