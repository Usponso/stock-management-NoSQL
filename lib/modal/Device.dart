class Device {
  final int id;
  final String name, serialNumber;
  final double price;
  final int stockQuantity;
  String picture;

  Device(
      {required this.id,
      required this.name,
      required this.serialNumber,
      required this.price,
      required this.stockQuantity,
      this.picture =
          'https://upload.wikimedia.org/wikipedia/commons/f/fc/No_picture_available.png'});

  Device.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        serialNumber = json['serial_number'],
        price = json['price'].toDouble(),
        stockQuantity = json['stock_quantity'],
        picture = json['picture'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'serial_number': serialNumber,
        'price': price,
        'stock_quantity': stockQuantity,
        'picture': picture
      };
}
