import 'package:flutter/material.dart';
import 'package:flutter_design/completed/meta/constants.dart';
import '../meta/helpers.dart';

class Lovpakke extends StatefulWidget {
  const Lovpakke({Key? key}) : super(key: key);

  @override
  State<Lovpakke> createState() => _LovpakkeState();
}

class _LovpakkeState extends State<Lovpakke> {
  Color textGreen = Constants.textGreen;
  Color primaryGreen = Constants.primaryGreen;
  Color backgroundWhite = Constants.backgroundWhite;
  Color textWhite = Constants.textWhite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGreen,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 15),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/Information',
                                arguments: "nothing");
                          },
                          child: Icon(Icons.arrow_back_ios,
                          color: textWhite,)),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 30, bottom: 30),
                        child: Text(
                          'Komplet Lovpakke',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: textWhite
                          ),
                        ),
                      )),
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25, top: 30),
                            child: Column(
                              children: [
                                Text(
                                  'Ubegrrænset teori (min. 8 lovpligtige moduler)\n\n'
                                  '7 x kørelektioner på vej (2x45 min)\n\n'
                                  '1 x mørkekørsel (45 min)\n\n'
                                  'Manøvrebanekursus (180 min)\n\n'
                                  'Glatbanekursus (180 min)\n\n'
                                  'Inkl. Alle forsikringer - 0kr i selvrisiko\n\n'
                                  'App & fleksibel booking\n\n'
                                  'Kundesupport: Chat/Mail/Tlf',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text(
                            'Samlet pris',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            '11,995 kr',
                            style: TextStyle(
                              color: textGreen,
                              fontSize: 35,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Row(
                            children: [
                              Expanded(flex: 3, child: SizedBox()),
                              Expanded(
                                flex: 2,
                                child: Divider(
                                  thickness: 2,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              Expanded(flex: 3, child: SizedBox())
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Powered by',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w300
                              ),),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2),
                                child: SizedBox(),
                              ),

                              Text('CoSoCo',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.5
                              ),)
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Helpers.createClickText(
                              'Se betingelser & faktaark',
                              15,
                              Colors.grey.shade400,
                              MainAxisAlignment.center),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 50),
                          child: Helpers.createClickText('Kontakt os', 15,
                              Colors.grey.shade400, MainAxisAlignment.center),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(flex: 1, child: Material(
                      color: backgroundWhite,
                    )),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/Creditcard', arguments: "nothing");
                        },
                        child: Material(
                          color: primaryGreen,
                          child: const Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Center(
                                child: Text(
                              'Continue',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
