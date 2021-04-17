class Post {
  Post({
    required this.userProfileIcon,
    required this.userName,
    required this.timePost,
    required this.descriptionPost,
    required this.postImage,
    required this.comments,
    required this.shared,
    required this.reactions,
    required this.principalUserReaction,
    required this.comment,
  });

  final String userProfileIcon;
  final String userName;
  final String timePost;
  final String descriptionPost;
  final String postImage;
  final int comments;
  final int shared;
  final int reactions;
  final String principalUserReaction;
  final Comment comment;
}

class Comment {
  Comment({
    required this.userProfileIcon,
    required this.userName,
    required this.comment,
  });

  final String userProfileIcon;
  final String userName;
  final String comment;
}

List<Post> posts = List.of({
  Post(
    userProfileIcon:
        'assets/facebook_ui/images/people/daniela_fernandez(2).png',
    userName: 'Daniela Fernández Ramos',
    timePost: 'Hace 3 días',
    descriptionPost: 'Me encanto la sesión de fotos que me hizo mi amigo 😍🥺 ',
    postImage: 'assets/facebook_ui/images/people/daniela_fernandez.png',
    comments: 30,
    shared: 5,
    reactions: 50,
    principalUserReaction: 'Mao Lop',
    comment: Comment(
      userProfileIcon: 'assets/facebook_ui/images/people/michael_bruno.png',
      userName: 'Michael Bruno',
      comment: 'Esta foto está muy cool, deberías ser modelo',
    ),
  ),
  Post(
    userProfileIcon: 'assets/facebook_ui/images/people/samanta_smith.jpeg',
    userName: 'Samanta Smith',
    timePost: 'Hace 2 días',
    descriptionPost: 'I love this photo 😍',
    postImage: 'assets/facebook_ui/images/people/samanta_smith.jpeg',
    comments: 50,
    shared: 20,
    reactions: 66,
    principalUserReaction: 'Jhonny',
    comment: Comment(
      userProfileIcon: 'assets/facebook_ui/images/people/michael_bruno.png',
      userName: 'Michael Bruno',
      comment: '📸 📸 📸',
    ),
  ),
  Post(
    userProfileIcon: 'assets/facebook_ui/images/people/cloe_thompson.jpeg',
    userName: 'Cloe Thompson',
    timePost: 'Hace 1 día',
    descriptionPost: 'Relax... 🍃 🍂',
    postImage: 'assets/facebook_ui/images/people/cloe_thompson.jpeg',
    comments: 53,
    shared: 2,
    reactions: 53,
    principalUserReaction: 'Cloe',
    comment: Comment(
      userProfileIcon: 'assets/facebook_ui/images/people/michael_bruno.png',
      userName: 'Michael Bruno',
      comment: '✨ ✨ ✨',
    ),
  ),
  Post(
    userProfileIcon: 'assets/facebook_ui/images/people/james_paul.jpeg',
    userName: 'James Paul',
    timePost: 'Hace 2 días',
    descriptionPost: 'Work hard! 💪 🤙',
    postImage: 'assets/facebook_ui/images/people/james_paul.jpeg',
    comments: 32,
    shared: 1,
    reactions: 57,
    principalUserReaction: 'Mónica',
    comment: Comment(
      userProfileIcon: 'assets/facebook_ui/images/people/michael_bruno.png',
      userName: 'Michael Bruno',
      comment: 'Ohh! Yess! 😎 😎 ',
    ),
  ),
  Post(
    userProfileIcon: 'assets/facebook_ui/images/people/marcus_dail.jpeg',
    userName: 'Marcus Dail',
    timePost: 'Hace 4 días',
    descriptionPost: 'Just do it!!... 😎',
    postImage: 'assets/facebook_ui/images/people/marcus_dail.jpeg',
    comments: 55,
    shared: 12,
    reactions: 64,
    principalUserReaction: 'Daniela',
    comment: Comment(
      userProfileIcon: 'assets/facebook_ui/images/people/michael_bruno.png',
      userName: 'Michael Bruno',
      comment: '🔥 🔥 🔥 🔥',
    ),
  ),
  Post(
    userProfileIcon: 'assets/facebook_ui/images/people/kate_rob.jpeg',
    userName: 'Kate Rob',
    timePost: 'Hace 3 días',
    descriptionPost: 'Nueva sesión... 😍 👀',
    postImage: 'assets/facebook_ui/images/people/kate_rob.jpeg',
    comments: 70,
    shared: 18,
    reactions: 84,
    principalUserReaction: 'Marcus',
    comment: Comment(
      userProfileIcon: 'assets/facebook_ui/images/people/kate_rob.jpeg',
      userName: 'Michael Bruno',
      comment: '🙌 🎉 🎉',
    ),
  ),
});
