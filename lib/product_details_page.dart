import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_basic/cart_provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailPage({
    super.key,
    required this.product
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedSize = 0;

  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false)
          .addProduct(
          {
            'id': widget.product['id'],
            'title': widget.product['title'],
            'price': widget.product['price'],
            'size': selectedSize,
            'imageUrl': widget.product['imageUrl'],
            'company': widget.product['company']
          }
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product add successfully !'))
      );
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a size!'))
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Details',style: Theme.of(context).appBarTheme.titleTextStyle,),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          const Spacer(flex: 2,),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$ ${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index){
                      final size = (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                              label: Text(size.toString()),
                            backgroundColor: selectedSize == size
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(double.infinity, 50)
                      ),
                      child: const Text(
                        'Add To Cart',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                        ),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
