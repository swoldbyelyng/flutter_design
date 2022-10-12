import 'package:flutter/material.dart';
import 'package:flutter_design/completed/meta/constants.dart';
import '../meta/helpers.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  bool checkTerms = false;
  bool checkMail = false;

  Color textGreen = Constants.textGreen;
  Color primaryGreen = Constants.primaryGreen;
  Color backgroundWhite = Constants.backgroundWhite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryGreen,
      body: MediaQuery.removePadding(
        context: context,
          removeTop: true,
        child: ListView(
          children: [
            Material(
              color: Constants.backgroundWhite,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 35),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                '/ConfirmPin',
                                arguments: "nothing");
                          },
                          child: Icon(Icons.arrow_back_ios)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, bottom: 15),
                      child: Material(
                        color: Constants.backgroundWhite,
                        child: const Text(
                          'Dine oplysninger',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 45),
                    child: Helpers.createInputBox('E-mail'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Helpers.createInputBox('CPR-number'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40, top: 12),
                    child: Text.rich(
                      TextSpan(
                          style: TextStyle(fontSize: 13.0, color: Colors.black),
                          children: [
                            const TextSpan(
                                text: 'Når du indtaster dit cpr-nummer giver du samtykke til, at vi må behandle det. '),
                            TextSpan(
                                text: 'Læs mere',
                                style: TextStyle(
                                    color: primaryGreen,
                                    decoration: TextDecoration.underline)),
                          ]),
                      textAlign: TextAlign.left,
                    )
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: backgroundWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )
                ),

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Checkbox(
                                value: checkTerms,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkTerms = newValue!;
                                  });
                                },
                                //fillcolor
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return primaryGreen.withOpacity(.32);
                                  }
                                  return primaryGreen;
                                })),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'De oplysninger jeg har givet er rigtige og jeg har læst og accepteret JustDrive\'s:',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Helpers.createClickText(
                                      'Vilkår og betingelser', 13, Colors.grey, MainAxisAlignment.start),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Helpers.createClickText(
                                      'Indhentning og behandling af persondata',
                                      13,
                                      Colors.grey, MainAxisAlignment.start),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 40),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Checkbox(
                                value: checkMail,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkMail = newValue!;
                                  });
                                },
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return primaryGreen.withOpacity(.32);
                                  }
                                  return primaryGreen;
                                })),
                          ),
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Giv mig besked over e-mail eller gennem appen når JustDrive har relevante nyheder, rådgivning eller tilbud til mig.',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(flex: 1, child: Container(color: backgroundWhite, height: 66, width: 100,)),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/Lovpakke', arguments: "nothing");
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
          ],
        ),
      ),
    );
  }
}

