import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/router/routes.dart';
import 'package:flutter_assignment/core/utils/app_screen.dart';
import 'package:flutter_assignment/core/utils/injection.dart';
import 'package:flutter_assignment/features/product_list/presentation/bloc/product_list_bloc.dart';
import 'package:flutter_assignment/features/product_list/presentation/bloc/product_list_event.dart';
import 'package:flutter_assignment/features/product_list/presentation/bloc/product_list_state.dart';
import 'package:flutter_assignment/features/product_list/presentation/widgets/product_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductListPage> {
  final productListBloc = getIt<ProductListBloc>();

  @override
  void initState() {
    super.initState();
    productListBloc.add(ProductListFetchEvent());
  }

  void handleDeleteTap(int id) {
    productListBloc.add(DeleteProductEvent(productID: id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              router.push(
                '${AppScreen.productsPath}/${AppScreen.addProductPath}',
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (context) => productListBloc,
          child: BlocConsumer<ProductListBloc, ProductListState>(
            listener: (BuildContext context, ProductListState state) {
              if (state is ProductDeleteSuccessState) {
                final String message =
                    state.productID > 0
                        ? "Product Deleted successfully!"
                        : "Failed to delete Product";
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor:
                        Colors.teal, // Set background color to teal
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is ProductListLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.teal, // Teal color for the progress indicator
                  ),
                );
              } else if (state is ProductListSuccessState) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 16.0, // Spacing between columns
                    mainAxisSpacing: 16.0, // Spacing between rows
                    childAspectRatio: 0.75, // Aspect ratio of each grid item
                  ),
                  itemCount: state.productList.length,
                  itemBuilder: (context, index) {
                    return ProductItem(
                      product: state.productList[index],
                      onDeleteTap: handleDeleteTap,
                    );
                  },
                );
              } else if (state is ProductListErrorState) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(
                      color: Colors.teal,
                    ), // Teal color for error text
                  ),
                );
              } else {
                return const SizedBox.shrink(); // Unknown state
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productListBloc.add(ProductListFetchEvent());
        },
        backgroundColor: Colors.teal, // Teal color for the FAB
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}
