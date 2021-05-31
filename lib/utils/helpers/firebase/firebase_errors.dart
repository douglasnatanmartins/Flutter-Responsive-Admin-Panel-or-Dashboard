import 'package:flutter/material.dart';

String getErrorStringFirebase( String code, BuildContext context ) {
  switch (code) {
    case 'weak_password':
      return 'Su contraseña es muy debil.';
    case 'invalid_email':
      return 'Su correo es inválido.';
    case 'email-already-in-use':
      return 'Este correo ya se esta utilizando en outra cuenta.';
    case 'invalid_credential':
      return 'Su correo es inválido.';
    case 'wrong-password':
      return 'Contaseña incorrecta.';
    case 'tenant_not_found':
      return 'No existe ningun usuario encontrado.';
    case 'ERROR_USER_DISABLED':
      return 'Este usuario fue desabilitado.';
    case 'ERROR_TOO_MANY_REQUESTS':
      return 'Muchas solicitudes. intente nuevamente mas tarde.';
    case 'operation_not_allowed':
      return 'Operación no permitida.';
    case "user-not-found":
      return "Usuário no Encontrado, Verifique!";
    case "unavailable":
      return "No fue possible Conectar al Servidor!";
    default:
      return 'Um error indefinido occurrio.';
  }
}