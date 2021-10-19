class Influencer {
  Influencer(
      {this.firstname,
      this.lastname,
      this.region,
      this.country,
      this.bio,
      this.post,
      this.followers,
      this.following,
      this.profilepic});

  String? firstname;
  String? lastname;
  String? region;
  String? country;
  String? bio;
  int? post;
  int? followers;
  int? following;
  String? profilepic;

  factory Influencer.fromJason(Map<String, dynamic> parsedJason) {
    return Influencer(
        firstname: parsedJason['first_name'],
        lastname: parsedJason['last_name'],
        region: parsedJason['region'],
        country: parsedJason['country'],
        bio: parsedJason['bio'],
        post: parsedJason['post'],
        followers: parsedJason['followers'],
        following: parsedJason['following'],
        profilepic: parsedJason['profile_pic']);
  }
}
