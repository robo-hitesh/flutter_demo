abstract class ProductDetailsEvent {
  ProductDetailsEvent();
}

class ProductDetailsFetchEvent extends ProductDetailsEvent {
  ProductDetailsFetchEvent(this.productID);
  String productID;
}
