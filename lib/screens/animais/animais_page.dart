import 'package:admin/screens/dashboard/components/header.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../responsive.dart';

class AnimaisPage extends StatelessWidget {
  const AnimaisPage({Key? key, required this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header( title: 'Animais', scaffoldKey: scaffoldKey),
              const SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: defaultPadding),
                        Container(
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
                                    'Animais',
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
                                    label: const Text('Novo Animal'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: defaultPadding,),

                            ],
                          ),
                        )
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
