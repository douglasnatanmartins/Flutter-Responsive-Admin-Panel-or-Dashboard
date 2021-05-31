import 'dart:io';

import 'package:admin/Repository/constantes/table_keys.dart';
import 'package:admin/models/propriedade_model/propriedade_model.dart';
import 'package:admin/utils/helpers/firebase/firebase_errors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class PropriedadeRepository {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  String generateId(String idUser) {
    final CollectionReference idPropriedade = FirebaseFirestore.instance
        .collection(KeyFazendasTable)
        .doc(idUser).collection(ParamListPropriedade);
    return idPropriedade.doc().id;
  }

  Future<List<PropriedadeModel>> getPropriedade(
      String idUser, BuildContext context) async {
    try {
      List<PropriedadeModel> listPropriedades = [];

      final query = await _firestore
          .collection(KeyFazendasTable)
          .doc(idUser)
          .collection(ParamListPropriedade)
          .get();
      if (query.docs.isNotEmpty) {
        final List<DocumentSnapshot> listDoc = query.docs;
        for (final doc in listDoc) {
          final result = PropriedadeModel.fromDocument(doc);
          listPropriedades.add(result);
        }
        return listPropriedades;
      } else {
        return listPropriedades = [];
      }
    } on FirebaseException catch (e) {
      return Future.error(getErrorStringFirebase(e.code, context));
    }
  }

  Future<void> savePropriedade(PropriedadeModel propriedade) async {
    try {
      await _firestore
          .collection(KeyFazendasTable)
          .doc(propriedade.idUser)
          .collection(ParamListPropriedade)
          .doc(propriedade.idProprieade)
          .set(propriedade.savePropriedade());
    } on FirebaseException catch (e) {
      return Future.error(e.code);
    }
  }

  Future<void> updatePropriedade(PropriedadeModel propriedade) async {
    try {
      await _firestore
          .collection(KeyFazendasTable)
          .doc(propriedade.idUser)
          .collection(ParamListPropriedade)
          .doc(propriedade.idProprieade)
          .update(propriedade.updatePropriedade());
    } on FirebaseException catch (e) {
      return Future.error(e.code);
    }
  }

  Future<String> uploadImage(File image, String idUser) async {
    try{
      final taskSnapShot =  await _storage.ref().child(KeyFazendasTable)
          .child(idUser).putFile(image);
      final result = taskSnapShot.ref.getDownloadURL();
      return result;
    } on FirebaseException catch (e) {
      return Future.error(e.code);
    }
  }

  Future<void> updateQtdEdit(PropriedadeModel propriedade) async {
    try{
      await _firestore
          .collection(KeyFazendasTable)
          .doc(propriedade.idUser)
          .collection(ParamListPropriedade)
          .doc(propriedade.idProprieade)
          .update({'qtdEdit' : 0});
    } on FirebaseException catch (e){
      return Future.error(e.code);
    }
  }
}