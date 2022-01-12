class Time {
  String nome;
  String foto;
  String cargo;

  Time({this.nome, this.foto, this.cargo});

  Time.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    foto = json['foto'];
    cargo = json['cargo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['foto'] = this.foto;
    data['cargo'] = this.cargo;
    return data;
  }
}