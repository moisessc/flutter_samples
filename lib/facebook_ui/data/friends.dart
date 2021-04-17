class Friend {
  Friend({
    required this.friendImage,
    required this.friendName,
  });

  final String friendImage;
  final String friendName;
}

List<Friend> friends = List.of({
  Friend(
    friendImage: 'assets/facebook_ui/images/people/wilber_garcia.png',
    friendName: 'Wilber Garcia',
  ),
  Friend(
    friendImage: 'assets/facebook_ui/images/people/michael_gais.png',
    friendName: 'Michael Gais',
  ),
  Friend(
    friendImage: 'assets/facebook_ui/images/people/daniela_fernandez.png',
    friendName: 'Daniela Fernández',
  ),
  Friend(
    friendImage: 'assets/facebook_ui/images/people/sarai_perez.png',
    friendName: 'Saraí Pérez',
  ),
  Friend(
    friendImage: 'assets/facebook_ui/images/people/samanta_smith.jpeg',
    friendName: 'Samanta Smith',
  ),
  Friend(
    friendImage: 'assets/facebook_ui/images/people/marcus_dail.jpeg',
    friendName: 'Marcus',
  ),
  Friend(
    friendImage: 'assets/facebook_ui/images/people/kate_rob.jpeg',
    friendName: 'Kate Rob',
  ),
});
