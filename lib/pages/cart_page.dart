import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:food_commerce/model/cart_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CartModel>(context);
    int quantity = 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'My Cart',
              style: GoogleFonts.notoSerif(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: vm.cartItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Slidable(
                      startActionPane: ActionPane(motion: ScrollMotion(), children: [
                        SlidableAction(
                          onPressed: (context){
                            setState(() {
                              vm.cartItems[index][4]++;
                            });
                          },
                          backgroundColor: Colors.blue,
                          icon: Icons.add,
                        ),
                        SlidableAction(
                          onPressed: (context){
                            setState(() {
                              vm.cartItems[index][4]--;
                            });
                          },
                          backgroundColor: Colors.white12,
                          icon: Icons.minimize,
                        )
                      ]),
                      endActionPane:
                          ActionPane(motion: ScrollMotion(), children: [
                        SlidableAction(
                          onPressed: (context){
                            setState(() {
                              vm.cartItems[index][4] = quantity;
                            });
                            vm.removeItem(index);
                          },
                          backgroundColor: Colors.redAccent,
                          icon: Icons.delete,
                          label: 'delete',
                        )
                      ]),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: ListTile(
                          leading: Container(width: 100, child: Image.asset(vm.cartItems[index][2])),
                          title: vm.cartItems[index][4] > 1 ? Text(vm.cartItems[index][0] + ' x${vm.cartItems[index][4]}') : Text(vm.cartItems[index][0]),
                          subtitle:
                              Text('\$' + vm.cartItems[index][1].toString()),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black45
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Total Price', style: TextStyle(color: Colors.white30),),
                        const SizedBox(
                          height: 5,
                        ),
                        Text('\$${vm.calculateTotal()}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Payment method coming soon')));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)
                        ),
                        child: Row(
                          children: const [
                            Text('Pay Now', style: TextStyle(color: Colors.white),),
                            Icon(Icons.chevron_right, size: 13, color: Colors.white,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}