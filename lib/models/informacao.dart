class Info {
  String imagem;

  Info({this.imagem});

  Info.fromJson(Map<String, dynamic> json) {
    imagem = json['imagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagem'] = this.imagem;
    return data;
  }
}