import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'fullname')
  String? name;
  String? email;
  String? phone;
  String? cpf;
  String? passwod;
  String? id;
  String? token;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.cpf,
    this.passwod,
    this.id,
    this.token,
  });

  // factory UserModel.fromMap(Map<String, dynamic> map) {
  //   return UserModel(
  //       name: map['fullname'],
  //       email: map['email'],
  //       phone: map['phone'],
  //       cpf: map['cpf'],
  //       passwod: map['passwod'],
  //       id: map['id'],
  //       token: map['token']);
  // }
  //
  // Map<String, dynamic> toMap() {
  //   return {
  //     'fullname': name,
  //     'email': email,
  //     'phone': phone,
  //     'cpf': cpf,
  //     'passwod': passwod,
  //     'id': id,
  //     'token': token
  //   };
  // }

  //flutter pub run build_runner build

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString(){
    return 'name: $name | cpf: $cpf';
  }
}
