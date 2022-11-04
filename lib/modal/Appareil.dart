class Appareil{
    final String? name;
    final String? numCode;
    final double? price;
    final double? quantity;
    final String? image;

    Appareil({required this.name, required this.numCode, required this.price, required this.quantity, required this.image});

    Appareil.fromJson(Map<String, dynamic> json)
        :
        name = json['AP_NAME'],
        numCode = json['AP_NUMCODE'],
        price = json['AP_PRICE'],
        quantity = json['AP_QUANTITY'],
        image = json['AP_PHOTO'];

    Map<String, dynamic> toJson() => {
        'AP_NAME': name,
        'AP_NUMCODE': numCode,
        'AP_PRICE': price,
        'AP_QUANTITY': quantity,
        'AP_PHOTO': image
    };
    
}