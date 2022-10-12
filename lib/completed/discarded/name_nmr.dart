import 'package:flutter/material.dart';

class NameNumberDiscarded extends StatefulWidget {
  const NameNumberDiscarded({Key? key}) : super(key: key);

  @override
  State<NameNumberDiscarded> createState() => _NameNumberDiscardedState();
}

class _NameNumberDiscardedState extends State<NameNumberDiscarded> {
  var dropdownvalue = '+45';
  var items = ['+45', '+40', '+21', '+52', '+68'];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(flex: 1, child: Icon(Icons.question_mark)),
                Expanded(flex: 5, child: SizedBox()),
                Expanded(flex: 1, child: Icon(Icons.close))
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Material(child: Text('What is your first name?')),
              const Material(
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                children: const [
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                      flex: 5,
                      child: Divider(
                        color: Colors.black,
                        thickness: 1.0,
                      )),
                  Expanded(flex: 1, child: SizedBox())
                ],
              )
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: (Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(child: Text('What is your phone number?')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Material(
                            child: DropdownButton(
                              value: dropdownvalue,
                              icon: const Icon(Icons.keyboard_arrow_down),

                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: const [
                          Material(
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.black,
                          )
                        ],
                      )),
                  const Expanded(flex: 1, child: SizedBox())
                ],
              ),
              const Expanded(
                  flex: 1,
                  child: Material(
                      child: Text(
                    'Ved at fortsætte, acceptere du JustDrives vilkår for brug af app\'en',
                    textAlign: TextAlign.center,
                  ))),
            ],
          )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/', arguments: "nothing");
                    },
                    child: const Material(
                      color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Center(
                            child: Text('Continue')),
                      ),
                    ),
                  ))
            ],
          ),
        )
      ],
    ));
  }
}
