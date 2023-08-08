class tourflowpath {
  // static final catalog_model = catalogmodel.internal();
  // catalogmodel.internal();
  // factory catalogmodel() => catalog_model;
  static List<flow> items = [
    flow(
        id: 001,
        name: "Day 1: Arrival",
        desc:
            "Arrive in Agra, the city of the iconic Taj Mahal. Stay in hotel overnight.",
        price: 999,
        end: "414, Cantt Rd, Namner, Idgah Colony, Agra, Uttar Pradesh 282001",
        start: "Agra Cantonment junction"),
    flow(
        id: 002,
        name: "Day 2",
        desc: "After breakfast, drive to Taj Mahal",
        price: 999,
        end: "Dharmapuri, Forest Colony, Tajganj, Agra, Uttar Pradesh 282001",
        start:
            "414, Cantt Rd, Namner, Idgah Colony, Agra, Uttar Pradesh 282001"),
    flow(
        id: 003,
        name: "Day 2",
        desc: "Heading towards Agra Fort after having lunch",
        price: 999,
        end: "Agra Fort, Rakabganj, Agra, Uttar Pradesh 282003",
        start:
            "Dharmapuri, Forest Colony, Tajganj, Agra, Uttar Pradesh 282001"),
    flow(
        id: 004,
        name: "Day 2",
        desc: "Reaching hotel and completion of the tour",
        price: 999,
        end: "414, Cantt Rd, Namner, Idgah Colony, Agra, Uttar Pradesh 282001",
        start: "Agra Fort, Rakabganj, Agra, Uttar Pradesh 282003"),
    flow(
        id: 005,
        name: "Day 3: Departure",
        desc:
            "Check out from the hotel and drive to Agra railway station to board your train back home.",
        price: 999,
        end: "Agra Cantonment junction",
        start:
            "414, Cantt Rd, Namner, Idgah Colony, Agra, Uttar Pradesh 282001"),
  ];
  // Getter for item by id
  // products getbyid(int id) =>
  //     items.firstWhere((element) => element.id == id, orElse: null);

  // products getbypositon(int pos) => items[pos];
}

class flow {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String end;
  final String start;

  flow(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.end,
      required this.start});

  factory flow.fromjson(Map<String, dynamic> map) {
    return flow(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        end: map["end"],
        start: map["start"]);
  }
  tojson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "end": end,
        "start": start,
      };
}
