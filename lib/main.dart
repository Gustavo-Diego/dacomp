import 'package:flutter/material.dart';

import 'models/informacao.dart';
import 'models/produto.dart';
import 'models/timeDA.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DACOMP UFU',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Aplicativo(),
    );
  }
}

class Aplicativo extends StatefulWidget {
  @override
  _AplicativoState createState() => _AplicativoState();
}

class _AplicativoState extends State<Aplicativo> {

  final pageController = PageController();
  int get indexPage => pageController?.page?.round() ?? 0;

  var produtos = new List<Produtos>();
  var time = new List<Time>();
  var informacao = new List<Info>();
  
  _AplicativoState(){

    produtos = [];
    produtos.add(Produtos(foto: "img/refri.png", descricao: "Refri(Coca, Fanta, Mineiro)", preco: "2,50"));
    produtos.add(Produtos(foto: "img/cerveja.png", descricao: "Cerveja(lata)", preco: "1 por 3, 4 por 10"));
    produtos.add(Produtos(foto: "img/agua.png", descricao: "Água", preco: "1,50"));
    produtos.add(Produtos(foto: "img/todinho.png", descricao: "Todinho", preco: "1,00"));
    produtos.add(Produtos(foto: "img/bolacha.png", descricao: "Bolacha(Passatempo)", preco: "2,00"));
    produtos.add(Produtos(foto: "img/salgadinho.png", descricao: "Salgadinho", preco: "1,50"));
    produtos.add(Produtos(foto: "img/geladinho.png", descricao: "Geladinho", preco: "0,50"));

    time = [];
    time.add(Time(nome: "Cirilo(Murilo)", foto: "img/murilo.jpeg", cargo: "Presidente"));
    time.add(Time(nome: "Max", foto: "img/max.jpeg", cargo: "Vice-Presidente"));
    time.add(Time(nome: "Julia", foto: "img/julia.jpeg", cargo: "Diretoria Financeira"));
    time.add(Time(nome: "Gustavo", foto: "img/gustavo.jpeg", cargo: "Vice-diretoria financeira"));
    time.add(Time(nome: "Nathaly", foto: "img/nat.jpeg", cargo: "Diretoria Política"));
    time.add(Time(nome: "Pedro(McLovin)", foto: "img/tannus.jpeg", cargo: "Vice-diretoria política"));
    time.add(Time(nome: "Cairo(Cheddar)", foto: "img/cairo.jpeg", cargo: "Diretoria de Eventos"));
    time.add(Time(nome: "Thiago", foto: "img/thiago.jpeg", cargo: "Vice Direroria de Eventos"));

    informacao = [];
    informacao.add(Info(imagem: "img/pg1.png"));
    informacao.add(Info(imagem: "img/pg2.png"));
    informacao.add(Info(imagem: "img/pg3.png"));
    informacao.add(Info(imagem: "img/pg4.png"));
    informacao.add(Info(imagem: "img/pg5.png"));
    informacao.add(Info(imagem: "img/pg6.png"));
    informacao.add(Info(imagem: "img/pg7.png"));
    informacao.add(Info(imagem: "img/pg8.png"));

  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title:AnimatedBuilder(
          animation: pageController,
          builder: (_,__){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children:[
                <Widget>[
                  Text("Produtos do DACOMP", style: TextStyle(fontSize: 20, color: Colors.blue)),
                  new Image.asset("img/pp.jpeg")
                ],
                <Widget>[
                  Text("Informações - UFU", style: TextStyle(fontSize: 20, color: Colors.blue)),
                  new Image.asset("img/pp.jpeg")
                ],
                <Widget>[
                  Text("Time do DA", style: TextStyle(fontSize: 20, color: Colors.blue)),
                  new Image.asset("img/pp.jpeg")
                ],
              ]
              [indexPage],
            );
          }
        )
      ),

      body: PageView(
        controller: pageController,
        children: <Widget>[

          Container(
            color: Colors.blue.withOpacity(0.3),
            child: ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index){
                return ListTile(
                  leading: SizedBox(
                    child:  Image.asset(produtos[index].foto, fit: BoxFit.cover),
                    height: 120,
                    width: 100,
                  ),
                  title: Text(
                    produtos[index].descricao
                  ),
                  subtitle: Text(
                    produtos[index].preco
                  ),
                );
              },
            ),
          ),

          Container(
            color: Colors.blue.withOpacity(0.3),
            child: ListView.builder(
            itemCount: informacao.length,
            itemBuilder: (context, index){
              return ListTile(
                title: new Image.asset(informacao[index].imagem),
              );
            },
            )
          ),

          Container(
            color: Colors.blue.withOpacity(0.3),
            child: ListView.builder(  
            itemCount: time.length,
            itemBuilder: (context, index){
              return ListTile(
                leading: new Image.asset(time[index].foto),
                title: Text(
                  time[index].nome
                ),
                subtitle: Text(
                  time[index].cargo
                ),
              );
            },
            )
          ),

        ],
      ),

      bottomNavigationBar: AnimatedBuilder(
        animation: pageController,
        builder: (_,__){
          return BottomNavigationBar(
            onTap: (index){
              pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut
              );
            },
            currentIndex: indexPage,
            items: [
              BottomNavigationBarItem(icon:
                Icon(Icons.home, color: Colors.black, size: 30),
                title: Text("Home"), backgroundColor: Colors.blue),
              BottomNavigationBarItem(icon:
                Icon(Icons.info, color: Colors.black, size: 30),
                title: Text("Informações"), backgroundColor: Colors.blue),
              BottomNavigationBarItem(icon:
                Icon(Icons.supervised_user_circle, color: Colors.black, size: 30),
                title: Text("Time DACOMP"), backgroundColor: Colors.blue),
            ]
          );
        }
      )

    );
  }
}