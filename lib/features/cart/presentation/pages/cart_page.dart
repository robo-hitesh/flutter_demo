import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/utils/injection.dart';
import 'package:flutter_assignment/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter_assignment/features/cart/presentation/bloc/cart_event.dart';
import 'package:flutter_assignment/features/cart/presentation/widgets/cart_product_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartBloc = getIt<CartBloc>();

  @override
  void initState() {
    super.initState();
    cartBloc.add(CartFetchEvent("1"));
  }

  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
      'price': 109.95,
      'quantity': 1,
    },
    {
      'name': 'Mens Casual Premium Slim Fit T-Shirts',
      'price': 22.3,
      'quantity': 1,
    },
    {'name': 'Mens Cotton Jacket', 'price': 55.99, 'quantity': 1},
  ];

  double _calculateTotal() {
    return _cartItems.fold(
      0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }

  void _checkout() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Checkout successful!'),
        backgroundColor: Colors.teal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart', style: TextStyle(color: Colors.white)),
        centerTitle: false,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return CartProductItem(
                  item: item,
                  index: index,
                  onQuantityUpdate: (idx, quantity) {
                    _cartItems[idx]['quantity'] = quantity;
                  },
                  onCartItemDelete: (idx) {
                    _cartItems.removeAt(idx);
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${_calculateTotal().toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                ElevatedButton(
                  onPressed: _cartItems.isEmpty ? null : _checkout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
