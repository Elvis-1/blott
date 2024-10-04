class Beneficiary {
  String? bankAccountType;
  String? walletId;
  String? accountName;
  bool? favourite;
  bool? enabled;
  String? createdAt;
  String? id;
  int? bankId;
  int? accountNumber;
  String? label;
  String? verifiedAt;
  String? status;
  String? updatedAt;
  String? bankName;

  Beneficiary({
    this.bankName,
    this.bankAccountType,
    this.walletId,
    this.accountName,
    this.favourite,
    this.enabled,
    this.createdAt,
    this.id,
    this.bankId,
    this.accountNumber,
    this.label,
    this.verifiedAt,
    this.status,
    this.updatedAt,
  });

  factory Beneficiary.fromJson(Map<String, dynamic> json) {
    return Beneficiary(
        bankAccountType: json['bank_account_type'] as String?,
        walletId: json['wallet_id'] as String?,
        accountName: json['account_name'] as String?,
        favourite: json['favourite'] as bool?,
        enabled: json['enabled'] as bool?,
        createdAt: json['created_at'] as String?,
        id: json['id'] as String?,
        bankId: json['bank_id'] as int?,
        accountNumber: json['account_number'] as int?,
        label: json['label'] as String?,
        verifiedAt: json['verified_at'] as String?,
        status: json['status'] as String?,
        updatedAt: json['updated_at'] as String?,
        bankName: json['bank_name'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {
      "bank_name": bankName,
      'bank_account_type': bankAccountType,
      'wallet_id': walletId,
      'account_name': accountName,
      'favourite': favourite,
      'enabled': enabled,
      'created_at': createdAt,
      'id': id,
      'bank_id': bankId,
      'account_number': accountNumber,
      'label': label,
      'verified_at': verifiedAt,
      'status': status,
      'updated_at': updatedAt,
    };
  }
}
