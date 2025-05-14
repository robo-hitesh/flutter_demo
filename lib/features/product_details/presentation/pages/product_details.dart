import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/utils/injection.dart';
import 'package:flutter_assignment/features/product_details/presentation/bloc/product_details_bloc.dart';
import 'package:flutter_assignment/features/product_details/presentation/bloc/product_details_event.dart';
import 'package:flutter_assignment/features/product_details/presentation/bloc/product_details_state.dart';
import 'package:flutter_assignment/shared/presentation/widgets/star_rating_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productID});
  final String productID;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final productDetailsBloc = getIt<ProductDetailsBloc>();

  @override
  void initState() {
    super.initState();
    productDetailsBloc.add(ProductDetailsFetchEvent(widget.productID));
  }

  void _addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Product added to cart!"),
        backgroundColor: Colors.teal,
      ),
    );
  }

  void _handleProductEdit() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Edit option selected"),
        backgroundColor: Colors.teal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // 🎯 Set your desired back button color
        ),
        title: const Text(
          "Product Details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: Colors.teal,
      ),
      body: BlocProvider(
        create: (_) => productDetailsBloc,
        child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductDetailsSuccessState) {
              final product = state.productDetails;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display the product image
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: product.image,
                            placeholder:
                                (context, url) => Center(
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                            errorWidget:
                                (context, url, error) => Icon(Icons.error),
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        product.description,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 10),
                      StarRatingView(
                        totalStar: 5,
                        rating: product.rating?.rate ?? 0,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            // Add product to cart logic here
                            _addToCart();
                          },
                          child: const Text(
                            "Add to Cart",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ProductDetailsErrorState) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            return const Center(child: Text("Something went wrong!"));
          },
        ),
      ),
    );
  }
}
