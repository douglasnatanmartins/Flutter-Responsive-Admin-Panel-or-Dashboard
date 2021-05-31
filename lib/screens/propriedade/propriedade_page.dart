import 'package:admin/controllers/propriedade/propriedade_controller.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:admin/screens/propriedade/widgets/list_propriedades.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class PropriedadePage extends StatelessWidget {
  PropriedadePage({Key? key, required this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final PorpriedadeController controller = PorpriedadeController();

  @override
  Widget build(BuildContext context) {
    controller.setBuilContext(context);
    controller.listPro();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header( title: 'Propriedade', scaffoldKey: scaffoldKey,),
              const SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: defaultPadding),
                        ListPropriedades(controller: controller,),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
