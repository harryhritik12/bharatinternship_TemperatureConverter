import 'package:flutter/material.dart';


class TempApp extends StatefulWidget{
@override
 TempState createState()=> TempState();

}
class TempState extends State<TempApp>{
   double input=0 ;
  double output=0;
  bool forC=true;
  @override
  Widget build(BuildContext){
    TextField inputfield=TextField(
        keyboardType: TextInputType.number,
        onChanged: (value){
          try{
            input=double.parse(value);

          } catch(e){
            input=0.0;
          }

        },
        decoration: InputDecoration(
          labelText: "Input Value in ${forC==false ?"farenfite":"Celsius"}"
        ),

      );
      AppBar appBar =AppBar(
        title: Text('Temperature Calculator'),

      );

     Container tempSwitch = Container(
      padding: EdgeInsets.all(20.0),
      /*Switch(
           value: forC, 
            
           onChanged:(e){
            setState(() {
              forC=!forC;
            });
           })*/
           /*Checkbox(
            value: forC, 
            onChanged:(e){
              setState(() {
                forC=!forC;
              });
            }
            ),*/
      child: Column(
        children: [
          Text("Choose Fahrenheit or Celsius"),
          Row(
            children: [
              Radio<bool>(
                groupValue: forC,
                value: false,
                onChanged: (v) {
                  setState(() {
                    forC = v!;
                  });
                },
              ),
              const Text("F"),
            ],
          ),
          Row(
            children: [
              Radio<bool>(
                groupValue: forC,
                value: true,
                onChanged: (v) {
                  setState(() {
                    forC = v!;
                  });
                },
              ),
              const Text("C"),
            ],
          ),
        ],
      ),
    );
    Container Caclc= Container(
        child: ElevatedButton(
          child: Text("calculate"),
          onPressed: (){
            setState(() {
              forC == false
                ? output = (input - 32) * (5 / 9)
                : output = (input * 9 / 5) + 32;
            });
                      AlertDialog dialog = AlertDialog(
            content: forC == false
                ? Text(
                    "${input.toStringAsFixed(5)} F : ${output.toStringAsFixed(5)} C")
                : Text(
                    "${input.toStringAsFixed(5)} C : ${output.toStringAsFixed(5)} F"),
          );
          showDialog(builder: (context) => dialog, context: context);

          },
        ),
    );
    


    return Scaffold(
        appBar: appBar,
    
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children:<Widget> [
            
            inputfield,
            tempSwitch,
            Caclc,

          ],

        ),


      ),

    );
  }
  
} 