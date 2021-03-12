import 'package:flutter/material.dart';


class InicioPage extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: constraints.maxHeight/13,),
            Text('SISTEMA EVALUACIÓN ARTÍCULOS SENNOVA', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: constraints.maxHeight/9,),
        Text('Bienvenidos al Sistema de Investigación del SENA SENNOVA de la Regional Huila. Estamos encargardados de xxxxx.', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
    });
  }
}