abstract class ProductListEvent {
  ProductListEvent();
}

class ProductListFetchEvent extends ProductListEvent {
  ProductListFetchEvent();
}

class DeleteProductEvent extends ProductListEvent {
  DeleteProductEvent({required this.productID});
  int productID;
}
