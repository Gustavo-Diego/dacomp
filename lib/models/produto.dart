class Produtos {
  String foto;
  String descricao;
  String preco;

  Produtos({this.foto, this.descricao, this.preco});

  Produtos.fromJson(Map<String, dynamic> json) {
    foto = json['foto'];
    descricao = json['descricao'];
    preco = json['preco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foto'] = this.foto;
    data['descricao'] = this.descricao;
    data['preco'] = this.preco;
    return data;
  }
}