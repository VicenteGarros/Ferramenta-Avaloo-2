import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

TextEditingController ontController = TextEditingController();
TextEditingController ont_2Controller = TextEditingController();
TextEditingController ttController = TextEditingController();
TextEditingController tt_2Controller = TextEditingController();

double porcentagem() {
  double tempoTotal = double.parse(ttController.text);
  double tempoTotal2 = double.parse(ttController.text);
  double porcentagemCalculo;
  return porcentagemCalculo = (tempoTotal2 * 100) / tempoTotal;
}

double valorPlanejadoCalculo(){
  double tempoTotal = double.parse(ttController.text);
  double orcamentoTotal = double.parse(ontController.text);
  double valorPlanejado = orcamentoTotal * ((tempoTotal*100/tempoTotal)/100);
}

double valorAgregadoCalculo(){
  double tempoTotal = double.parse(ttController.text);
  double valorAgregado = tempoTotal * (porcentagem()/100);
}

/*void indicedeCustoCalculo(){
  double tempoTotal2 = double.parse(tt_2Controller.text);
  double indicedeCusto = valorAgregadoCalculo()/tempoTotal2;
  if(indicedeCusto < 1){
    return 'ATRASADO';
  }
  else if (indicedeCusto > 1){
    return "ADIANTADO";
  }

  else{
    return  'DENTRO DO\n' 'PLANEJADO';
  }
}

void indicedePrazoCalculo(){
  double indicedePrazo = (valorAgregadoCalculo() / valorPlanejadoCalculo());
  if(indicedePrazo < 1){
    return 'ACIMA DO\n' 'CUSTO';
  }
  else{
    return 'ABAIXO DO\n' 'CUSTO';
  }
}*/



void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Tela Inicial;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        heroTag: "btn0",
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Page01()));
        },
        tooltip: 'Criar novo projeto',
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
      body: new Column(children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(45.0, 80.0, 0.0, 0.0),
          child: Row(children: <Widget>[
            Expanded(
              child: RichText(
                text: TextSpan(
                    text: 'Bem vindo\n',
                    style: TextStyle(
                        fontWeight: FontWeight.values[2],
                        fontFamily: 'Helvetica',
                        fontSize: 26,
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Seus\nProjetos',
                          style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.values[8],
                              fontSize: 51,
                              color: Colors.black))
                    ]),
              ),
            ),
          ]),
        ),
        new Container(
          height: (200.00),
          width: (200.00),
          margin: EdgeInsets.fromLTRB(0.0, 50.0, 110.0, 0.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(6.00, 7.00),
                color: Colors.black.withOpacity(0.20),
                blurRadius: (6),
              ),
            ],
            borderRadius: BorderRadius.circular((20.00)),
          ),
          padding: EdgeInsets.fromLTRB(13.0, 70.0, 0.0, 0.0),
          child: RichText(
            text: TextSpan(
                text: 'Projeto\n',
                style: TextStyle(
                    fontWeight: FontWeight.values[8],
                    fontFamily: 'Helvetica',
                    fontSize: 30,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: 'App Consultoria',
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.values[2],
                          fontSize: 23,
                          color: Colors.black))
                ]),
          ),
        )
      ]),
    );
  }
}

class Page01 extends StatefulWidget {
  @override
  _Page01State createState() => _Page01State();
}

class _Page01State extends State<Page01> {

  @override
  Widget build(BuildContext context) {
    //final text;
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
      ),
      floatingActionButton: FloatingActionButton(
        //ELSE
        heroTag: "btn1",
        onPressed: () {
          double calculo1 = double.parse(ontController.text) * (porcentagem()/100);//Valor Agregado (VA)
          double calculo2 = double.parse(ontController.text) * ((double.parse(ttController.text) * 100/100)/100);//Valor Planejado (VP)
          double calculo3 = calculo1 - calculo2;//IDP
          double calculo4 = double.parse(ont_2Controller.text) - calculo1;//IDC

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PageResult()));
        },
        tooltip: 'Próximo',
        backgroundColor: Colors.black,
        child: Icon(Icons.arrow_right),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Insira as informações\n',
              style: TextStyle(
                  fontWeight: FontWeight.values[2],
                  fontFamily: 'Helvetica',
                  fontSize: 21,
                  color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: 'do seu projeto',
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.values[8],
                        fontSize: 25,
                        color: Colors.black))
              ]),
        ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(children:<Widget>[
              buildTextField("Orçamento total", ontController),
              Divider(color: Colors.white),
              buildTextField("Orçamento gasto", ont_2Controller),
              Divider(color: Colors.white),
              buildTextField("Prazo planejado", ttController),
              Divider(color: Colors.white),
              buildTextField("Prazo cumprido", tt_2Controller),
            ]
                    ),
                  ),
            ]),
          ),
    );
  }
}
Widget buildTextField (String label, TextEditingController c){
  return TextField(
      decoration: new InputDecoration(
      labelText: label,
      fillColor: Colors.white,
      border: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(25.0),
      borderSide: new BorderSide(),
      ),
  ),
      keyboardType: TextInputType.number,
      style: new TextStyle(
          fontFamily: 'Helvetica',
          fontWeight: FontWeight.values[4],
          fontSize: 15,
          color: Colors.black)
  );
}

class PageResult extends StatefulWidget {

  String calculo3;
  String calculo4;

  PageResult({this.calculo3, this.calculo4});

  @override
  _PageResult createState() => _PageResult();
}

class _PageResult extends State<PageResult> {
  String valorIDP = "result";
  String valorIDC = "result";
  @override
  Widget build(BuildContext context) {
    valorIDP = widget.calculo3;
    valorIDC = widget.calculo4;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: BackButton(
            color: Colors.black,
          )),
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(43.0, 10.0, 10.0, 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "btn3",
              onPressed: () {},
              child: Icon(Icons.save),
              tooltip: 'Salvar Projeto',
              backgroundColor: Colors.black,
            ),
            FloatingActionButton(
              heroTag: "btn5",
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Page01()));
              },
              child: Icon(Icons.edit),
              tooltip: 'Editar Informações',
              backgroundColor: Colors.black,
            ),
            FloatingActionButton(
              heroTag: "btn6",
              onPressed: () {},
              child: Icon(Icons.delete),
              tooltip: 'Excluir Projeto',
              backgroundColor: Colors.black,
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Seu prazo está\n',
                style: TextStyle(
                    fontWeight: FontWeight.values[2],
                    fontFamily: 'Helvetica',
                    fontSize: 20,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: this.valorIDP,
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.values[8],
                          fontSize: 40,
                          color: Colors.black))
                ]),
          ),
        ),
        Container(
          //Divisor
          height: 1,
          width: 300,
          color: Colors.grey,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Seu orçamento está\n',
                style: TextStyle(
                    fontWeight: FontWeight.values[2],
                    fontFamily: 'Helvetica',
                    fontSize: 20,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: this.valorIDC,
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.values[8],
                          fontSize: 40,
                          color: Colors.black))
                ]),
          ),
        ),
      ]),
    );
  }
}