class CartItem {
  final String itemsName, itemsNameEn, itemsImage, des;
  final int itemsPrice;
  final int id;
  int count;
  CartItem({
    required this.des,
    required this.itemsName,
    required this.itemsNameEn,
    required this.itemsImage,
    required this.itemsPrice,
    required this.id,
    required this.count,
  });
}

// List<CartItem> cartItem = [
//   CartItem(name: 'القطه الكبيره', price: 20, image: 'assets/images/perfum.jpg'),
//   CartItem(name: 'القطه الكبيره', price: 20, image: 'assets/images/perfum.jpg'),
//   CartItem(name: 'القطه الكبيره', price: 20, image: 'assets/images/perfum.jpg'),
//   CartItem(name: 'القطه الكبيره', price: 20, image: 'assets/images/perfum.jpg'),
//   CartItem(name: 'القطه الكبيره', price: 20, image: 'assets/images/perfum.jpg'),
// ];
