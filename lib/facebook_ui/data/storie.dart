class Storie {
  const Storie({
    required this.previewStory,
    required this.userImage,
    required this.userName,
  });

  final String previewStory;
  final String userImage;
  final String userName;
}

List<Storie> stories = List.of({
  const Storie(
    previewStory: 'assets/common/images/profile_image.jpg',
    userImage: 'none',
    userName: 'Crear historia',
  ),
  const Storie(
    previewStory: 'assets/facebook_ui/images/people/mao_lop.png',
    userImage: 'assets/facebook_ui/images/people/mao_lop.png',
    userName: 'Mao',
  ),
  const Storie(
    previewStory: 'assets/facebook_ui/images/stories/fernanda_preview.png',
    userImage: 'assets/facebook_ui/images/people/fernanda.png',
    userName: 'Fernanda',
  ),
  const Storie(
    previewStory: 'assets/facebook_ui/images/stories/james_preview.png',
    userImage: 'assets/facebook_ui/images/people/james.png',
    userName: 'James',
  ),
  const Storie(
    previewStory: 'assets/facebook_ui/images/stories/samanta_preview.png',
    userImage: 'assets/facebook_ui/images/people/samanta_smith.jpeg',
    userName: 'Samanta',
  ),
  const Storie(
    previewStory: 'assets/facebook_ui/images/stories/marcus_preview.png',
    userImage: 'assets/facebook_ui/images/people/marcus_dail.jpeg',
    userName: 'Marcus',
  ),
  const Storie(
    previewStory: 'assets/facebook_ui/images/stories/cloe_preview.png',
    userImage: 'assets/facebook_ui/images/people/cloe_thompson.jpeg',
    userName: 'Cloe',
  ),
});
