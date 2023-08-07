class city {
  // static final catalog_model = catalogmodel.internal();
  // catalogmodel.internal();
  // factory catalogmodel() => catalog_model;
  static List<cities> all = [
    cities(
        id: 001,
        name: "Agra",
        desc: "Starting at Rs. 5000",
        price: 999,
        // color: "#33505a",
        image: "assets/images/taj.jpg"),
    cities(
        id: 002,
        name: "Mumbai",
        desc: "Starting at Rs. 5000",
        price: 999,
        // color: "#33505a",
        image: "assets/images/gateway.jpg")
  ];
  static List<cities> popular = [
    cities(
        id: 001,
        name: "Agra",
        desc: "Starting at Rs. 5000",
        price: 999,
        // color: "#33505a",
        image: "assets/images/taj.jpg"),
  ];
  // Getter for item by id
  // products getbyid(int id) =>
  //     items.firstWhere((element) => element.id == id, orElse: null);

  // products getbypositon(int pos) => items[pos];
}

class cities {
  final int id;
  final String name;
  final String desc;
  final num price;
  // final String color;
  final String image;

  cities(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      // required this.color,
      required this.image});

  factory cities.fromjson(Map<String, dynamic> map) {
    return cities(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        // color: map["color"],
        image: map["image"]);
  }
  tojson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        // "color": color,
        "image": image,
      };
}
