class CustomerBill{
  final int id;
  final String date;
  final double total;

  CustomerBill({required this.id, required this.date, required this.total});

  CustomerBill.fromJson(Map<String, dynamic> json)
      :
        id = json['id'],
        date = json['bill_date'],
        total = json['total'].toDouble();

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date
  };
}