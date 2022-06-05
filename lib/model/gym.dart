

class Gym {
  String gymTable;
  int? id;
  String? company_name;
  String? description;
  String? type_of_period;
  double? price;

  Gym(this.id, this.company_name, this.description, this.type_of_period, this.price);
  Map<String, dynamic>toMap(){

    final map = Map<String, dynamic>();
    map['gymTable'] = gymTable;
    map['id'] = id;
    map['company_name'] = company_name;
    map['description'] = description;
    map['type_of_period'] = type_of_period;
    map['price'] = price;
    return map;





  }

  Gym.fromMap(Map<String, dynamic>map){
    gymTable = map['gymTable'];
    id = map['id'];
    company_name = map['company_name'];
    description = map['description'];
    type_of_period = map['type_of_period'];
    price = map['price'];


  }
}