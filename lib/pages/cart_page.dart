import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_commerce/model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: Text('My Cart', style: TextStyle(color: Colors.black54),),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
                itemCount: vm.cartItems.length,
                itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200]
                  ),
                  child: ListTile(
                    leading: Image.asset(vm.cartItems[index][2]),
                    title: Text(vm.cartItems[index][0]),
                    subtitle: Text('\$'+ vm.cartItems[index][1].toString()),
                    trailing: IconButton(onPressed: (){
                      vm.removeItem(index);
                    }, icon: Icon(Icons.cancel)),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
