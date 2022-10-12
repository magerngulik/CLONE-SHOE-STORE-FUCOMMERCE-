import 'package:fhe_template/core.dart';

class CartService {
  static List<Product> cartItem = [];

  static addItem(Product product) {
    cartItem.add(product);
  }

  static removeItem(Product product) {
    cartItem.removeWhere((p) => p.id == product.id);
  }

  static deleteAll() {
    cartItem.clear();
  }

  static addQty(Product product) {
    var newProduct = product.copyWith(qty: product.qty! + 1);
    var index = cartItem.indexWhere((p) => p.id == product.id);
    cartItem[index] = newProduct;
  }

  static decQty(Product product) {
    if (product.qty == 1) {
      cartItem.removeWhere((p) => p.id == product.id);
      return;
    }
    //untuk dapat data baru yang akan di update
    var newProduct = product.copyWith(qty: product.qty! - 1);
    //untuk get dimana lokasi dari index yang di update
    var index = cartItem.indexWhere((p) => p.id == product.id);
    cartItem[index] = newProduct;
  }

  //cek variable ada atau tidak di dalam sebuat list
  static isExists(Product product) {
    return cartItem.where((p) => p.id == product.id).isNotEmpty;
  }

  static get total {
    int? totalBarang;
    for (var p in cartItem) {
      totalBarang = p.price! * p.qty!;
    }
    return totalBarang!.toDouble();
  }
}
