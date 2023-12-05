abstract class HomeEvent {
  const HomeEvent();
}

class GetProductsEvent extends HomeEvent {
  const GetProductsEvent();
}

class DisplayProductEvent extends HomeEvent {
  final int index;
  const DisplayProductEvent(this.index);
}

class LogOutEvent extends HomeEvent {
  const LogOutEvent();
}
