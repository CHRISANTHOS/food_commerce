import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_commerce/model/cart_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: vm.cartItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Slidable(
                      endActionPane:
                          ActionPane(motion: ScrollMotion(), children: [
                        SlidableAction(
                          onPressed: (context){
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
                          leading: Image.asset(vm.cartItems[index][2]),
                          title: Text(vm.cartItems[index][0]),
                          subtitle:
                              Text('\$' + vm.cartItems[index][1].toString()),
                        ),
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

class RoundIconButton extends StatelessWidget {

  final VoidCallback onPressed;
  final IconData icon;
  RoundIconButton({required this.icon,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Colors.black26,
      textStyle: TextStyle(color: Colors.white),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
          width: 10.0,
          height: 10.0
      ),
    );
  }
}
