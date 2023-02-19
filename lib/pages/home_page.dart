import 'package:flutter/material.dart';
import 'package:food_commerce/model/cart_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/grocery_item_tile.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  void _buyOptions(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 150,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Payment method coming soon')));
                  },
                  leading: const Icon(Icons.payment),
                  title: const Text('Buy Now'),
                ),
                ListTile(
                  onTap: () {
                    if(Provider.of<CartModel>(context, listen: false).checkExist(index)){
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Already in cart')));
                    }else {
                      Provider.of<CartModel>(context, listen: false).addToCart(
                          index);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to Cart')));
                    }
                  },
                  leading: const Icon(Icons.shopping_bag),
                  title: const Text('Add to cart'),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CartModel>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
      },backgroundColor: Colors.black, child:vm.cartItems.isEmpty ? const Icon(Icons.shopping_bag) : Text(vm.cartItems.length.toString()),),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Good Day'),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'What would you like to eat today?',
                style: GoogleFonts.notoSerif(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Fresh food',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Expanded(child: GridView.builder(
                    itemCount: vm.shopItems.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.3
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GroceryItemTile(
                          itemName: vm.shopItems[index][0],
                          itemPrice: vm.shopItems[index][1],
                          imagePath: vm.shopItems[index][2],
                          color: vm.shopItems[index][3],
                          onPressed: (){
                            _buyOptions(context, index);
                          },
                        ),
                      );
                    })
              )
          ],
        ),
      ),
    );
  }
}
