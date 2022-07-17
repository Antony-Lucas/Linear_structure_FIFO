import 'package:flutter/material.dart';

//Criação do widget que receberá a nomeclatura de textFieldDefault para ser invocado.
//O mesmo tem dois parâmetros, um opcional(hint) que também pode ser nulo(modificador "?") e o outro obrigatório(controlador).
Widget textFieldDefault(
    {String? hint, required TextEditingController controller}) {
  //Será retornado um textfield padrão para o mesmo, este que poderá ser personalizado e receberá
  //o controlador e o texto placeholder estabelecidos na classe main.dart
  return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hint,
      ));
}
