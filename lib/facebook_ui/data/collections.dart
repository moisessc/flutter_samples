class Collection {
  Collection({
    required this.collectionImage,
    required this.collectionName,
  });

  final String collectionImage;
  final String collectionName;
}

List<Collection> collections = List.of({
  Collection(
    collectionImage: 'assets/common/images/profile_image.jpg',
    collectionName: 'Colección',
  ),
  Collection(
    collectionImage: 'assets/facebook_ui/images/profile/coverage.jpeg',
    collectionName: 'Colección',
  ),
  Collection(
    collectionImage: 'assets/facebook_ui/images/collections/1.jpg',
    collectionName: 'Colección',
  ),
  Collection(
    collectionImage: 'assets/facebook_ui/images/collections/2.jpg',
    collectionName: 'Colección',
  ),
  Collection(
    collectionImage: 'assets/facebook_ui/images/collections/3.jpg',
    collectionName: 'Colección',
  ),
  Collection(
    collectionImage: 'assets/facebook_ui/images/collections/4.jpg',
    collectionName: 'Colección',
  ),
  Collection(
    collectionImage: 'assets/facebook_ui/images/collections/5.jpg',
    collectionName: 'Colección',
  ),
});
