abstract class Failure {}

class NetworkFailure extends Failure {}

class ServerFailure extends Failure {}

class TooManyRequestsFailure extends Failure {}

class ClientFailure extends Failure {}

class UnknownFailure extends Failure {}
