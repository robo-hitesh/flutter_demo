import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/router/routes.dart';
import 'package:flutter_assignment/core/utils/app_screen.dart';
import 'package:flutter_assignment/shared/presentation/widgets/star_rating_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> trendingProducts = [
    {
      "id": 9,
      'name': 'WD 2TB Elements Portable External Hard Drive - USB 3.0',
      'image': 'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg',
      'price': '\$100',
      'rating': 5.0,
    },
    {
      "id": 10,
      'name': 'SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s',
      'image': 'https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg',
      'price': '\$90',
      'rating': 4,
    },
    {
      "id": 15,
      'name': 'BIYLACLESEN Women\'s 3-in-1 Snowboard Jacket Winter Coats',
      'image': 'https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg',
      'price': '\$70',
      'rating': 3,
    },
  ];

  final List<Map<String, dynamic>> favoriteProducts = [
    {
      "id": 7,
      'name': 'White Gold Plated Princess',
      'image':
          'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg',
      'price': '\$120',
      'rating': 4.5,
    },
    {
      "id": 6,
      'name': 'Solid Gold Petite Micropave',
      'image':
          'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg',
      'price': '\$80',
      'rating': 4.0,
    },
    {
      "id": 8,
      'name': 'Pierced Owl Rose Gold Plated Stainless Steel Double',
      'image':
          'https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg',
      'price': '\$50',
      'rating': 3.5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Trending Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: trendingProducts.length,
                itemBuilder: (context, index) {
                  final product = trendingProducts[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: product['image'],
                        placeholder:
                            (context, url) => Center(
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(),
                              ),
                            ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        product['name'],
                        style: TextStyle(fontSize: 12),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product['price']),
                          StarRatingView(
                            totalStar: 5,
                            rating: product['rating'].toDouble(),
                          ),
                        ],
                      ),
                      onTap: () {
                        router.push(
                          '${AppScreen.productsPath}/${product['id']}',
                        );
                        // router.push(AppScreen.productDetailPath);
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Favorite Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200, // Adjusted height for better display
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: favoriteProducts.length,
                  itemBuilder: (context, index) {
                    final product = favoriteProducts[index];
                    return InkWell(
                      onTap: () {
                        router.push(
                          '${AppScreen.productsPath}/${product['id']}',
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            width: 150, // Adjusted width for better display
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: product['image'],
                                  placeholder:
                                      (context, url) => Center(
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                  errorWidget:
                                      (context, url, error) =>
                                          Icon(Icons.error),
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  product['name'],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(product['price']),
                                StarRatingView(
                                  totalStar: 5,
                                  rating: product['rating'].toDouble(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
