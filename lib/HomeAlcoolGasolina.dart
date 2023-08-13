import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAlcoolGasolina extends StatefulWidget {
  const HomeAlcoolGasolina({Key? key}) : super(key: key);

  @override
  _HomeAlcoolGasolinaState createState() => _HomeAlcoolGasolinaState();
}

class _HomeAlcoolGasolinaState extends State<HomeAlcoolGasolina> {

  TextEditingController _tecPrecoAlcool = TextEditingController();
  TextEditingController _tecPrecoGasolina = TextEditingController();

  String resultado = "";

  void _calcular(){
    //double precoAlcool =  double.parse( _tecPrecoAlcool.text );
    double? precoAlcool =  double.tryParse( _tecPrecoAlcool.text );
    double? precoGasolina =  double.tryParse( _tecPrecoGasolina.text );


    if(precoAlcool == null || precoGasolina == null){
      setState(() {
        resultado = "Número inválido, digite números maiores que 0 e utilizando (.) ";
      });
    }else{
      print(precoAlcool / precoGasolina);
        if((precoAlcool / precoGasolina) >= 0.7){
          setState(() {
            resultado = "Melhor abastecer com Gasolina";
          });
        }else{
          setState(() {
            resultado = "Melhor abastecer com Álcool";
          });
        }

        //_limparCampos();
    }
  }

  void _limparCampos(){
    _tecPrecoAlcool.text = "";
    _tecPrecoGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Álcool ou Gasolina",
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: TextField(
                  controller: _tecPrecoAlcool,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço do Álcool. Ex.: 1.59"
                  ),
                  style: TextStyle(
                      fontSize: 22
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: TextField(
                  controller: _tecPrecoGasolina,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço do Gasolina. Ex.: 3.59"
                  ),
                  style: TextStyle(
                      fontSize: 22
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: _calcular,
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                    //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 10, color: Colors.white))
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: Text(
                  resultado,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
