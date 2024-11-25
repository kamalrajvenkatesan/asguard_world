abstract class UseCases<Type, Params> {
  Future<Type> call(Params params);
}

class NoParam {}
