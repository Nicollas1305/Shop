import 'package:flutter/material.dart';
import '../components/product_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewPage extends StatefulWidget {
  ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOny = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.filter_alt_rounded),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text('Somente favoritos'),
                  value: FilterOptions.Favorite),
              PopupMenuItem(child: Text('Todos'), value: FilterOptions.All),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorite) {
                  _showFavoriteOny = true;
                } else {
                  _showFavoriteOny = false;
                }
              });
            },
          ),
        ],
      ),
      body: ProductGrid(_showFavoriteOny),
    );
  }
}
