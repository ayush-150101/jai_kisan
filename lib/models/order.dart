class Order {
  String phoneNumber;
  int itemId;
  int price;
  int quantity;
  String address;

  Order(
      {required this.phoneNumber,
      required this.itemId,
      required this.price,
      required this.quantity,
      required this.address});

  Map<String, dynamic> toMap() {
    return {
      "phoneNumber": phoneNumber,
      "itemId": itemId,
      "price": price,
      "quantity": quantity,
      "address":address,
    };
  }
}
