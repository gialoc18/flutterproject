class Account{
  String id,type, fullName, email, phone, gender, birthDate, address,avatar;
  Account({
    this.id,
    this.type,
    this.fullName,
    this.email,
    this.phone,
    this.gender,
    this.birthDate,
    this.address,
    this.avatar,
  });
  Account.fromMap(Map<String, dynamic> map){
    this.id = map['id'].toString();
    this.type = map['type'].toString();
    this.fullName = map['fullName'].toString();
    this.email = map['email'].toString();
    this.phone = map['phone'].toString();
    this.gender = map['gender'].toString();
    this.birthDate = map['birthDate'].toString();
    this.address = map['address'].toString();
    this.avatar = map['avatar'].toString();
  }
  Map<String, String> toJson(){
    final Map<String, String> data = new Map<String, String>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['birthDate'] = this.birthDate;
    data['address'] = this.address;
    data['avatar'] = this.avatar;
  }
}