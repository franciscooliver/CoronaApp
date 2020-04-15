class Paises {
  List<Pais> paises;
  String totalCasos;
  String totalMortes;
  String totalCurados;
  String ultimaAtualizacao;

  Paises(
      {this.paises,
      this.totalCasos,
      this.totalMortes,
      this.totalCurados,
      this.ultimaAtualizacao});

  Paises.fromMap(Map<String, dynamic> json) {
    paises = json['paises'];
    totalCasos = json['totalCasos'];
    totalMortes = json['totalMortes'];
    totalCurados = json['totalCurados'];
    ultimaAtualizacao = json['ultimaAtualizacao'];
    // paises = json['paises'];
  }
  Map<String, dynamic> toJson() => {
        'totalCasos': totalCasos,
        'totalMortes': totalMortes,
        'totalCurados': totalCurados,
        'ultimaAtualizacao': ultimaAtualizacao,
        'paises': paises
        // 'paises': paises,
      };
}

class Pais {
  int totalCasos;
  int novosCasos;
  int totalMortes;
  int novasMortes;
  int totalCurados;
  int casosAtivos;
  int casosGraves;
  int total1MPop;

  Pais(
      {
      this.totalCasos,
      this.novosCasos,
      this.totalMortes,
      this.novasMortes,
      this.totalCurados,
      this.casosAtivos,
      this.casosGraves,
      this.total1MPop});

  Pais.fromMap(Map<String, dynamic> json) {
    totalCasos = json['totalCasos'];
    novosCasos = json['novosCasos'];
    totalMortes = json['totalMortes'];
    novasMortes = json['novasMortes'];
    totalCurados = json['totalCurados'];
    casosAtivos = json['casosAtivos'];
    casosGraves = json['casosGraves'];
    total1MPop = json['Total/1M pop'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCasos'] = this.totalCasos;
    data['novosCasos'] = this.novosCasos;
    data['totalMortes'] = this.totalMortes;
    data['novasMortes'] = this.novasMortes;
    data['totalCurados'] = this.totalCurados;
    data['casosAtivos'] = this.casosAtivos;
    data['casosGraves'] = this.casosGraves;
    data['Total/1M pop'] = this.total1MPop;
  
    return data;
  }
}
