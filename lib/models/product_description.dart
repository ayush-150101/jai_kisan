class ProductDescription {
  String description;
  String brand;
  String seller;
  double rating;

  ProductDescription(
      {required this.description,
      required this.brand,
      required this.seller,
      required this.rating});

  Map<String,dynamic> toMap(){
    return {
      "description":description,
      "brand": brand,
      "seller": seller,
      "rating": rating,
    };
  }



}
