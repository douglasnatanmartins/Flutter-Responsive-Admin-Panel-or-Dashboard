import 'package:cloud_firestore/cloud_firestore.dart';

class PropriedadeModel {
  PropriedadeModel(
      {this.idProprieade,
        this.name,
        this.idUser,
        this.area,
        this.qtdEdit,
        this.status,
        this.createAt,
        this.updateAt,
        this.imageUrl,
        this.recria,
        this.engorda,
        this.genetica,
        this.leiteiro,
        this.confinamento});

  PropriedadeModel.fromDocument(DocumentSnapshot doc) {
    idProprieade = doc.id;
    idUser = doc['idUser'] as String;
    name = doc['name'] as String;
    area = doc['area'] as num;
    qtdEdit = doc['qtdEdit'] as num;
    status = doc['status'] as bool;
    createAt = doc['createAt'] as Timestamp;
    updateAt = doc['updateAt'] as Timestamp;
    imageUrl = doc['imageUrl'] as String;
    recria = doc['recria'] as bool;
    engorda = doc['engorda'] as bool;
    confinamento = doc['confinamento'] as bool;
    leiteiro = doc['leiteiro'] as bool;
    genetica = doc['genetica'] as bool;
  }

  String? idProprieade;
  String? name;
  String? idUser;
  num? area;
  num? qtdEdit;
  bool? status;
  Timestamp? createAt;
  Timestamp? updateAt;
  String? imageUrl;
  bool? recria;
  bool? engorda;
  bool? genetica;
  bool? leiteiro;
  bool? confinamento;


  Map<String, dynamic> savePropriedade() {
    final data = {
      'idProprieade' : idProprieade,
      'idUser' : idUser,
      'name' : name,
      'area' : area,
      'qtdEdit' : qtdEdit,
      'status' : status,
      'createAt' : createAt,
      'updateAt' : updateAt,
      'imageUrl' : imageUrl,
      'recria' : recria,
      'engorda' : engorda,
      'confinamento' : confinamento,
      'leiteiro' : leiteiro,
      'genetica' : genetica
    };
    return data;
  }

  Map<String, dynamic> updatePropriedade() {
    final data = {
      'name' : name,
      'area' : area,
      'qtdEdit' : qtdEdit,
      'updateAt' : updateAt,
      'imageUrl' : imageUrl,
      'recria' : recria,
      'engorda' : engorda,
      'confinamento' : confinamento,
      'leiteiro' : leiteiro,
      'genetica' : genetica
    };
    return data;
  }

  @override
  String toString() {
    return 'PropriedadeModel{idProprieade: $idProprieade, name: $name,'
        ' idUser: $idUser, area: $area, status: $status,'
        ' createAt: $createAt, updateAt: $updateAt, imageUrl: $imageUrl, '
        'recria: $recria, engorda: $engorda, genetica: $genetica, '
        'leiteiro: $leiteiro, confinamento: $confinamento, qtdEdit: $qtdEdit}';
  }
}