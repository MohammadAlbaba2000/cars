class UserModel{
  bool isSeller;
  String name;
  String email;
  String phone;
  String uId;
  String bio;
  String image;
  bool isPhoneVerified;

  UserModel({
    this.isSeller,
    this.email,
    this.name,
    this.phone,
    this.uId,
    this.bio,
    this.image,
    this.isPhoneVerified,
  });
  UserModel.fromJson(Map<String, dynamic> json){
    isSeller = json['isSeller'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    bio = json['bio'];
    image = json['image'];
    isPhoneVerified = json['isEmailVerified'];
  }
  Map<String, dynamic> toMap(){
    return{
      'isSeller': isSeller,
      'name' : name,
      'email' : email,
      'phone' : phone,
      'uId' : uId,
      'bio' : bio,
      'image' : image,
      'isEmailVerified' : isPhoneVerified,
    };
  }
}