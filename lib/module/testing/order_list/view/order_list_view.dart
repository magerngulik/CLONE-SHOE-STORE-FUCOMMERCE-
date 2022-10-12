import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/model/order/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/order_list_controller.dart';

class OrderListView extends ConsumerWidget {
  const OrderListView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    OrderListController controller = ref.watch(orderListController);
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Order List',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Container(),
        leadingWidth: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("orders")
                    .where("customer.uid",
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  if (snapshot.data == null) return Container();
                  if (snapshot.data!.docs.isEmpty) {
                    return const Text("No Data");
                  }

                  final data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item =
                          (data.docs[index].data() as Map<String, dynamic>);
                      item["id"] = data.docs[index].id;
                      var order = Order.fromJson(item);

                      // var date = order.createdAt as DateTime;
                      // var output = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);
                      DateTime dt = (order.createdAt as Timestamp).toDate();
                      var time = dt.toString().substring(0, 10);

                      return Card(
                        child: ListTile(
                          title: Text(time.toString()),
                          subtitle: Text("${order.items!.length} item(s)"),
                          trailing: Text(
                            "${order.total} ",
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
