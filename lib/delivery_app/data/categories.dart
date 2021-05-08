class Category {
  Category({
    required this.categoryName,
    required this.categoryImage,
    required this.semanticLabel,
  });

  final String categoryName;
  final String categoryImage;
  final String semanticLabel;
}

List<Category> categories = List.of({
  Category(
    categoryName: 'Pizza',
    categoryImage: 'assets/delivery_app/icons/pizza.svg',
    semanticLabel: 'Pizza Label',
  ),
  Category(
    categoryName: 'Seafood',
    categoryImage: 'assets/delivery_app/icons/shrimp.svg',
    semanticLabel: 'Seafood Label',
  ),
  Category(
    categoryName: 'Soft Drinks',
    categoryImage: 'assets/delivery_app/icons/soda.svg',
    semanticLabel: 'Soft Drinks Label',
  ),
  Category(
    categoryName: 'Hamburger',
    categoryImage: 'assets/delivery_app/icons/hamburger.svg',
    semanticLabel: 'Hamburger Label',
  ),
  Category(
    categoryName: 'Italian Food',
    categoryImage: 'assets/delivery_app/icons/spaghetti.svg',
    semanticLabel: 'Spaghetti Label',
  ),
});
