import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/router/routes.dart';
import 'package:flutter_assignment/core/utils/app_screen.dart';
import 'package:flutter_assignment/features/product_list/data/models/product_model.dart';
import 'package:go_router/go_router.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
    required this.onDeleteTap,
  });

  final ValueChanged<int> onDeleteTap;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () {
          router.push('${AppScreen.productsPath}/${product.id}');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: product.image,
                placeholder:
                    (context, url) => Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                height: 105,
                width: double.infinity,
                fit: BoxFit.scaleDown,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.teal,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '\$${product.price.toString()}',
                style: const TextStyle(
                  color: Colors.teal,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.teal, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    product.rating?.rate.toString() ?? "",
                    style: const TextStyle(fontSize: 12, color: Colors.teal),
                  ),
                  Spacer(),
                  IconButton(
                    color: Colors.amber,
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.teal,
                      size: 20,
                    ),
                    onPressed: () {
                      // Handle delete logic
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text("Delete Product"),
                              content: const Text(
                                "Are you sure you want to delete this product?",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    onDeleteTap(product.id);
                                    // Perform delete action
                                    context.pop();
                                  },
                                  child: const Text("Delete"),
                                ),
                              ],
                            ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
