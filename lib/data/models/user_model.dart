class UserModel {
  UserModel({
    this.customerId,
    this.customerCode,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.gender,
    this.fullAddress,
    this.isValidEmail,
    this.urlImgIdentFront,
    this.urlImgIdentBack,
    this.urlImgAvatar,
    this.description,
    this.statusValid,
    this.identityNumber,
    this.issueDate,
    this.issueBy,
    this.accountBankCode,
    this.userId,
    this.accountName,
    this.accountNumber,
    this.json,
    this.customerSource,
    this.cusCateId,
    this.cusGroupId,
    this.bankName,
    this.beforeDataChange,
    this.currentAddress,
    this.accountBankBranch,
    this.accountBankProvinceId,
    this.subAccount,
    this.accountBankId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      customerId: json['CustomerId'].toString(),
      customerCode: json['CustomerCode'].toString(),
      fullName: json['FullName'].toString(),
      email: json['Email'].toString(),
      phoneNumber: json['PhoneNumber'].toString(),
      dateOfBirth: DateTime.tryParse(json['DateOfBirth'].toString()),
      gender: int.parse(json['Gender'].toString()),
      fullAddress: json['FullAddress'].toString(),
      isValidEmail: (json['IsValidEmail'].toString() == false) ? false : true,
      urlImgAvatar: json['UrlImgAvata'].toString(),
      description: json['Description'].toString(),
      statusValid: int.parse(json['StatusValid'].toString()),
      identityNumber: json['IdentityNumber'].toString(),
      issueDate: json['DateOfIssue'].toString(),
      issueBy: json['PlaceOfIssue'].toString(),
      accountBankCode: json['AccountBankCode'].toString(),
      accountName: json['AccountName'].toString(),
      accountNumber: json['AccountNumber'].toString(),
      accountBankId: json['AccountBankId'].toString(),
      userId: json['UserId'].toString(),
      json: json,
      customerSource: int.parse(json['CustomerSource'].toString()),
      cusCateId: int.parse(json['CusCateId'].toString()),
      cusGroupId: json['CusGroupId'].toString(),
      bankName: json['BankName'].toString(),
      currentAddress: json['CurrentAddress'].toString(),
      accountBankBranch: json['AccountBankBranch'].toString(),
      accountBankProvinceId: json['AccountBankProvinceId'].toString(),
      //SubAccount: 7 || 9 m???i c?? value
      subAccount: json['SubAccount'].toString(),
      // beforeDataChange: json['BeforeDataChange'] != null
      //     ? UserModel.fromJson(json['BeforeDataChange'])
      //     : null,
    );
  }

  final String? customerId;
  final String? customerCode;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final DateTime? dateOfBirth;
  final int? gender;
  final String? fullAddress;
  final bool? isValidEmail;
  final String? urlImgIdentFront;
  final String? urlImgIdentBack;
  final String? urlImgAvatar;
  final String? description;
  // 6 CHUA_XAC_THUC Ch??a x??c th???c
  // 7 CHUA_HOAN_TAT Ch??a ho??n t???t
  // 8 CHO_PHE_DUYET Ch??? ph?? duy???t
  // 9 DA_XAC_THUC ???? x??c th???c
  //n???u ???? valid t??i kho???n bank ( is_valid_bank_acc) + ???? ekyc => 8:???? x??c th???c
  //ch??a ekyc => 6: ch??a x??c th???c
  //???? ekyc + ch??a valid tk bank => 7: ch??a ho??n t???t
  //s???a ekyc => 8: ch??? ph?? duy???t

  int? statusValid;
  final String? identityNumber;
  final String? issueDate;
  final String? issueBy;
  final String? accountBankCode;
  final String? accountNumber;
  final String? accountName;
  final String? userId;
  final Map<String, dynamic>? json;
  int? customerSource;
  int? cusCateId;
  String? cusGroupId;
  String? bankName;
  final UserModel? beforeDataChange;
  final String? currentAddress;
  final String? accountBankBranch;
  final String? accountBankProvinceId;
  final String? subAccount;
  final String? accountBankId;
}
