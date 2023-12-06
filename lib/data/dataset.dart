class MeinDatensatz {
  int? id;
  String spalte1;
  int spalte2;

  MeinDatensatz({this.id, required this.spalte1, required this.spalte2});

  //Konvertierung MeinDatensatz zu Map-Objekt
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'spalte1': spalte1,
      'spalte2': spalte2,
    };
  }

  //Konvertierung Map-Objekt zu MeinDatensatz
  factory MeinDatensatz.fromMap(Map<String, dynamic> map) {
    return MeinDatensatz(
      id: map['id'],
      spalte1: map['spalte1'],
      spalte2: map['spalte2'],
    );
  }
}
