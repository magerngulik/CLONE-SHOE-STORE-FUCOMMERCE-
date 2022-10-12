import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/model/product/product.dart';
import 'package:fhe_template/model/product/seller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductService {
  static addProduct(Product product) async {
    await FirebaseFirestore.instance.collection("products").add({
      "product_name": product.productName,
      "photo": product.photo,
      "price": product.price,
      "description": product.description,
      "seller": {
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "seller_name": FirebaseAuth.instance.currentUser!.displayName
      },
      "galleries": [
        "https://i.ibb.co/S32HNjD/no-image.jpg",
        "https://i.ibb.co/PGv8ZzG/me.jpg",
        "https://i.ibb.co/S32HNjD/no-image.jpg",
      ],
      "qty": product.qty,
      "brand": product.brand,
      "category": product.category
    });
  }

  static var products = [
    Product(
        id: "1",
        productName: "Red Adidas",
        photo:
            "https://images.unsplash.com/photo-1575537302964-96cd47c06b1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        price: 500000,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        seller: Seller(sellerName: "Adidas Official"),
        galleries: [
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
        ],
        qty: 0,
        category: "Sneakers",
        brand: "Adidas"),
    Product(
        id: "2",
        productName: "Orange Nike",
        photo:
            "https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80",
        price: 1000000,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        seller: Seller(sellerName: "Nike Official"),
        galleries: [
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
        ],
        qty: 0,
        category: "Sneakers",
        brand: "Nike"),
    Product(
        id: "3",
        productName: "Black Edition Nike",
        photo:
            "https://images.unsplash.com/photo-1605408499391-6368c628ef42?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHNob2VzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        price: 1200000,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        seller: Seller(sellerName: "Nike Official"),
        galleries: [
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
        ],
        qty: 0,
        category: "Sneakers",
        brand: "Nike"),
    Product(
        id: "4",
        productName: "Pink Editon New Balance",
        photo:
            "https://images.unsplash.com/photo-1551107696-a4b0c5a0d9a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1112&q=80",
        price: 800000,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        seller: Seller(sellerName: "New Balance Official"),
        galleries: [
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
        ],
        qty: 0,
        category: "Sneakers",
        brand: "New Balance"),
    Product(
        id: "5",
        productName: "Deep Grey Edition Nike",
        photo:
            "https://images.unsplash.com/photo-1576672843344-f01907a9d40c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
        price: 400000,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        seller: Seller(sellerName: "Nike Official"),
        galleries: [
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
        ],
        qty: 0,
        category: "Sneakers",
        brand: "Nike"),
    Product(
        id: "6",
        productName: "Nike Grey Summer Edition",
        photo:
            "https://images.unsplash.com/photo-1604671801908-6f0c6a092c05?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        price: 500000,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
        seller: Seller(sellerName: "Nike Official"),
        galleries: [
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
        ],
        qty: 0,
        category: "Sneakers",
        brand: "Nike"),
    Product(
        id: "7",
        productName: "Yellow Air Nike Summer Edition",
        photo:
            "https://images.unsplash.com/photo-1628253747716-0c4f5c90fdda?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
        price: 500000,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        seller: Seller(sellerName: "Nike Official"),
        galleries: [
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
        ],
        qty: 0,
        category: "Sneakers",
        brand: "Nike"),
    Product(
        id: "8",
        productName: "Nike White Pink",
        photo:
            "https://images.unsplash.com/photo-1600185365778-7875a359b924?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80",
        price: 900000,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        seller: Seller(sellerName: "Nike Official"),
        galleries: [
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
        ],
        qty: 0,
        category: "Sneakers",
        brand: "Nike"),
    Product(
        id: "9",
        productName: "Skin Boots Orang",
        photo:
            "https://images.unsplash.com/photo-1605733160314-4fc7dac4bb16?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1190&q=80",
        price: 2200000,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        seller: Seller(sellerName: "Panthople Official"),
        galleries: [
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
        ],
        qty: 0,
        category: "Boots",
        brand: "Panthople"),
    Product(
        id: "10",
        productName: "Nike Black Yellow Edition 2016",
        photo:
            "https://images.unsplash.com/photo-1620138546344-7b2c38516edf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
        price: 2200000,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        seller: Seller(sellerName: "Nike Official"),
        galleries: [
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
        ],
        qty: 0,
        category: "Sneakers",
        brand: "Nike"),
    Product(
        id: "11",
        productName: "Nike Green Grey",
        photo:
            "https://images.unsplash.com/photo-1539185441755-769473a23570?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80",
        price: 1100000,
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        seller: Seller(sellerName: "Nike Official"),
        galleries: [
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
          "https://i.ibb.co/S32HNjD/no-image.jpg",
        ],
        qty: 0,
        category: "Sneakers",
        brand: "Nike"),
  ];
}
