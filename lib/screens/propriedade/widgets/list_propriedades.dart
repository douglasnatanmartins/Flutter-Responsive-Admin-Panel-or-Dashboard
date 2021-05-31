import 'dart:ui';
import 'package:admin/controllers/propriedade/propriedade_controller.dart';
import 'package:admin/models/propriedade_model/propriedade_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants.dart';
import '../../../responsive.dart';

class ListPropriedades extends StatelessWidget {
  const ListPropriedades({Key? key, required this.controller}) : super(key: key);

  final PorpriedadeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Propriedades',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                    defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Nova Propriedade'),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding,),
          SizedBox(
            width: double.infinity,
            child: Observer(builder: (_) {
              if(controller.listPropriedades.isEmpty){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return DataTable(
                  horizontalMargin: 15,
                  columnSpacing: defaultPadding,
                  columns: <DataColumn>[
                    const DataColumn(
                      label: Text('ID'),
                    ),
                    const DataColumn(
                      label: Text('Propriedade'),
                    ),
                    const DataColumn(
                      label: Text('Área'),
                    ),
                    const DataColumn(
                      label: Text('Status'),
                    ),
                    const DataColumn(
                      label: Text('Ações'),
                    ),
                  ],
                  rows: List.generate(
                    controller.listPropriedades.length, (index) {
                    final PropriedadeModel propriedade = controller.listPropriedades[index];
                    return DataRow(
                        cells: [
                          DataCell(
                              Text(propriedade.idProprieade!.substring(0,4))
                          ),
                          DataCell(
                              Text(propriedade.name!)
                          ),
                          DataCell(
                              Text(propriedade.area!.toStringAsFixed(2))
                          ),
                          DataCell(
                              Row(
                                children: [
                                  Text(propriedade.status! ? 'Ativo' : 'Inativo'),
                                  const SizedBox(width: 10,),
                                  Icon(
                                    propriedade.status! ?
                                    FontAwesomeIcons.solidCircle :
                                    FontAwesomeIcons.timesCircle,
                                    color:propriedade.status! ?  Colors.green : Colors.red,
                                    size: 12,
                                  ),
                                ],
                              )
                          ),
                          DataCell(
                              !Responsive.isMobile(context) ?
                              Row(
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: (){},
                                    icon: const Icon(FontAwesomeIcons.pencilAlt, size: 12,),
                                    label: const Text('Editar'),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.yellow.shade800
                                    ),
                                  ),
                                  const SizedBox(width: 12,),
                                  ElevatedButton.icon(
                                    onPressed: (){},
                                    icon: const Icon(FontAwesomeIcons.trashAlt, size: 12),
                                    label: const Text('Inativar'),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red.shade600
                                    ),
                                  ),
                                ],
                              ) :
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(FontAwesomeIcons.pencilAlt),
                                    onPressed: (){},
                                    splashRadius: 18,
                                    iconSize: 14,
                                    color: Colors.yellow.shade800,
                                  ),
                                  IconButton(
                                    icon: const Icon(FontAwesomeIcons.trashAlt),
                                    onPressed: (){},
                                    splashRadius: 18,
                                    iconSize: 14,
                                    color: Colors.red.shade600,
                                  )
                                ],
                              )
                          ),
                        ]
                    );
                  },
                  ),
                );
              }
            },)
          )
        ],
      ),
    );
  }
}