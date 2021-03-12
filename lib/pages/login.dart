import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: constraints.maxHeight / 9,
                ),
                Text(
                  'Inicio de sesión',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width < 600
                      ? constraints.maxWidth
                      : constraints.maxWidth / 4,
                  height: kToolbarHeight * 2 + 2,
                  child: Column(
                    children: [
                      Container(
                        height: kToolbarHeight,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                decoration:
                                    InputDecoration(hintText: 'Username'),
                              ),
                            ),
                            VerticalDivider(),
                            Flexible(
                              child: TextFormField(
                                decoration:
                                    InputDecoration(hintText: 'Password'),
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                      ),
                      InkWell(
                        onTap: (){
                          showDialog(context: context, builder: (BuildContext context) {  
                            return AlertDialog(
                              title: Text('Hola'),
                              content: Text('Como Estas?'),
                              actions: [
                                ElevatedButton(onPressed: (){}, child: Text('OK')),
                                ElevatedButton(onPressed: (){}, child: Text('CANCELAR'))
                              ],
                            );
                          }, );
                        },
                        child: Container(
                          padding: EdgeInsets.zero,
                          height: kToolbarHeight,
                          width: double.infinity,
                          child: Center(
                              child: Text(
                            'Ingresar',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(20))),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
