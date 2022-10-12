import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/cover4.jpg'), fit: BoxFit.cover)),
      child: Column(
        children: [
          const Expanded(
            flex: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                color: Colors.transparent,
                child: Text(
                  'JustDrive',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2
                  ),
                ),
              ),
            ),
          ),
          const Expanded(flex: 12, child: SizedBox()),
          Expanded(
            flex: 10,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/NameAndNumber', arguments: "nothing");

                      },
                      child: (const Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 60.0),
                          child: Material(
                            color: Colors.transparent,
                            child: FittedBox(
                              child: Text(
                                'Get started',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/PrimaryFrame', arguments: "nothing");
                        },
                        child: const Material(
                          color: Colors.transparent,
                          child: Text(
                            'Privacy policy',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w300
                            ),
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios,
                      color: Colors.white, size: 20,)
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Expanded(
                        flex: 20,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              'Powered by',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w300
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                        flex: 20,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              'CoSoCo',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                letterSpacing: 2
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox())
              ],
            ),
          )
        ],
      ),
    );
  }
}
