abstract class CartEvent {
  CartEvent();
}

class CartFetchEvent extends CartEvent {
  CartFetchEvent(this.cartId);
  String cartId;
}
