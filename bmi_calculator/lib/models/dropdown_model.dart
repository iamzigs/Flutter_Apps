class Gender{
  int id;
  String gender;

  Gender(this.id, this.gender);

  static List <Gender> getGender(){
    return <Gender>[
      Gender(1,'Male'),
      Gender(2,'Female'),
    ];
  }
}

class Height{
  int id;
  String height;

  Height(this.id, this.height);

  static List <Height> getHeight(){
    return <Height>[
      Height(1,'cm'),
      Height(2,'ft'),
    ];
  }
}

class Weight{
  int id;
  String weight;

  Weight(this.id, this.weight);

  static List <Weight> getWeight(){
    return <Weight>[
      Weight(1,'kg'),
      Weight(2,'g'),
    ];
  }
}
