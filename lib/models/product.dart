class Product {
  final String id;
  final String name;
  final String price;
  final String image;
  final String? description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });
}

List<Product> productList = [
  Product(
    id: "1",
    name: "Apple iPhone 16 128GB|Teal",
    price: "\$700.00",
    image: "assets/images/iphone_16.png",
    description:
        "• This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.\n"
        "• There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmetic imperfections when held at an arm’s length.\n"
        "• This product will have a battery which exceeds 80% capacity relative to new.\n"
        "• Accessories will not be original, but will be compatible and fully functional. Product may come in generic Box.\n"
        "• This product is eligible for a replacement or refund within 90 days of receipt if you are not satisfied.",
  ),
  Product(
    id: "2",
    name: 'M4 Macbook Air 13” 256GB|Sky blue',
    price: "\$1000.00",
    image: "assets/images/macbook_m4_air.png",
    description: null,
  ),
  Product(
    id: "3",
    name: "Google Pixel 9A 128GB|Iris",
    price: "\$499.00",
    image: "assets/images/google_pixel_9.png",
    description: null,
  ),
  Product(
    id: "4",
    name: 'Apple Airpods 4 Active Noise Cancellation|Teal',
    price: "\$129.00",
    image: "assets/images/airpods_pro_4.png",
    description: null,
  ),
];
