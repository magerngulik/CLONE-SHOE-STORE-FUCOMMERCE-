import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartView extends ConsumerWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    CartController controller = ref.watch(cartController);
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        leading: Container(),
        leadingWidth: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              icon: const Icon(
                Icons.delete,
                size: 15,
                color: Colors.white,
              ),
              label: const Text(
                "Delete all",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                controller.deleteAll();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              icon: const Icon(
                Icons.refresh,
                size: 15,
                color: Colors.white,
              ),
              label: const Text(
                "Refresh",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                controller.refrest();
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                ListView.builder(
                  itemCount: CartService.cartItem.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = CartService.cartItem[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          backgroundImage: NetworkImage(
                            item.photo ?? "https://i.ibb.co/PGv8ZzG/me.jpg",
                          ),
                        ),
                        title: Text(item.productName ?? "No Name"),
                        subtitle: Text(item.price.toString()),
                        trailing: SizedBox(
                          width: 120.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.decQty(item);
                                },
                                child: Card(
                                  color: Colors.grey[800],
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  item.qty.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.addQty(item);
                                },
                                child: Card(
                                  color: Colors.grey[800],
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 50,
          child: ElevatedButton.icon(
            icon: const Icon(
              Icons.shopping_cart_checkout,
              color: Colors.white,
            ),
            label: const Text(
              "Checkout",
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CheckoutView()),
              );
            },
          ),
        ),
      ),
    );
  }
}
