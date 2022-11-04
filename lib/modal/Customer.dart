class Customer {
  final int? id;
  final String companyName;
  final String siret;
  final String phoneNumber;

  Customer({this.id = 0,required this.companyName, required this.siret, required this.phoneNumber});

  Customer.fromJson(Map<String, dynamic> json)
      :
        id = json['id'],
        companyName = json['company_name'],
        siret = json['siret'],
        phoneNumber = json['phone_number'];

  Map<String, dynamic> toJson() => {
    'company_name': companyName,
    'siret': siret,
    'phone_number' : phoneNumber
  };
  

}