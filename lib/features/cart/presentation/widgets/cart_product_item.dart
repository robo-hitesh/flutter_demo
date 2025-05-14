import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/cart/presentation/widgets/quantity_selector.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({
    super.key,
    required this.item,
    required this.index,
    required this.onQuantityUpdate,
    required this.onCartItemDelete,
  });

  final Map<String, dynamic> item;
  final int index;
  final void Function(int index, int quantity) onQuantityUpdate;
  final void Function(int index) onCartItemDelete;

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  void _incrementQuantity(int index) {
    setState(() {
      widget.onQuantityUpdate(index, widget.item['quantity']++);
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (widget.item['quantity'] > 1) {
        widget.item['quantity']--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      widget.onCartItemDelete(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal.shade100,
          child: Text(
            widget.item['name'][0],
            style: const TextStyle(color: Colors.teal),
          ),
        ),
        title: Text(
          widget.item['name'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$${widget.item['price']}',
              style: TextStyle(color: Colors.teal.shade700),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 40,
              child: QuantitySelector(
                quantity: widget.item['quantity'],
                onIncrement: () => _incrementQuantity(widget.index),
                onDecrement: () => _decrementQuantity(widget.index),
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.teal),
          onPressed: () => _removeItem(widget.index),
        ),
      ),
    );
  }
}
