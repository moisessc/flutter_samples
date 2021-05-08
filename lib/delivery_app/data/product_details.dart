class ProductDetails {
  ProductDetails({
    required this.top,
    required this.productName,
    required this.weight,
    required this.stars,
    required this.price,
    required this.size,
    required this.crust,
    required this.deliveryTime,
    required this.image,
    required this.ingredients,
  });

  final String top;
  final String productName;
  final String weight;
  final double stars;
  final double price;
  final String size;
  final String crust;
  final String deliveryTime;
  final String image;
  final List<String> ingredients;
}

List<ProductDetails> detailsProducts = List.of({
  ProductDetails(
    top: 'top of the week',
    productName: 'Primavera Pizza',
    weight: 'Weight 540 gr',
    stars: 5.0,
    price: 5.99,
    size: 'Medium 14"',
    crust: 'Thin Crust',
    deliveryTime: '30 min',
    image: 'assets/delivery_app/images/pizza_primavera.png',
    ingredients: List.of({
      'assets/delivery_app/images/peperoni.png',
      'assets/delivery_app/images/tomatos.png',
      'assets/delivery_app/images/onion.png',
      'assets/delivery_app/images/cheese.png',
    }),
  ),
  ProductDetails(
    top: 'top of the day',
    productName: 'Sausage Pizza',
    weight: 'Weight 240 gr',
    stars: 4.5,
    price: 3.99,
    size: 'Medium 14"',
    crust: 'Thin Crust',
    deliveryTime: '20 min',
    image: 'assets/delivery_app/images/pizza_uno.png',
    ingredients: List.of({
      'assets/delivery_app/images/peperoni.png',
      'assets/delivery_app/images/tomatos.png',
      'assets/delivery_app/images/onion.png',
      'assets/delivery_app/images/cheese.png',
    }),
  ),
});
