// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Stream collectionSream =
//    FirebaseFirestore.instance.collection('cadastro').snapshots();

//criando a classe NOMESCAD
class nomesCad extends StatefulWidget {
//TALVEZ COMENTAR O CONST //
  const nomesCad({Key? key}) : super(key: key);
  @override
  _nomesCadState createState() => _nomesCadState();
}

class _nomesCadState extends State<nomesCad> {
  //EU ACHO Q estamos chamando a funcao STREAM e passamos para ela
  //um QUERY-SNAPSHOT (algo como requesicao de snapshot/foto)
  //q sera chamado pelo o nome sera cadastroStream(poderia ser outro nome)...
  //e sera realizado uma conexao com o FB e esera feito um SNAPSHOT/FOTO
  //da collection CADASTRO.. e dps vamos chamar esse SnapShot apenas pelo
  //comando CADASTROSTREAM
  final Stream<QuerySnapshot> cadastroStream =
      FirebaseFirestore.instance.collection('cadastro').snapshots();

  @override
  Widget build(BuildContext context) {
    //nos vamos retornar um StreamBuilder(metodo q fica escutando algo ex: link
    // ou banco de dados, etc... e quando ele o link se mexe o Builder constroi algo)
    // é como se sempre q houver algo alterado no FB ele vai construi um novo
    //ListTittle ou container etc...
    //neste exemplo estamos informando q vamos receber um
    //QUERYSNAPSHOT  que é o CadastroStream
    //q é a funcao acima q acessa a COLLECTION CADASTRO do FIREBASE
    return StreamBuilder<QuerySnapshot>(
      //dizendo q o STREAM q sera o q sera monitorado sera o nosso CADASTROSTREAM
      //q é a conexao q temos com a COLLECTION CADASTRO NO FIREBASE
      stream: cadastroStream,
      //e aqui vamos dizer o q iremos construir
      // de forma ASSINCRONA/ASYNC (nao sequencial), estamos dizendo q vamos
      //q vamos passar um SnapShot<querySnapshot> e entao nos chamamos o
      //.snapshot la de cima EU ACHO
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //se houver algum erro... tipo sem internet etc... exibe a mensagem
        if (snapshot.hasError) {
          return Text("ops, erro");
        }
        //se a conexao estiver ok... exibe a mensagem
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        //apos ocorre ok a conexao acima... iremos retornar um ListView
        return ListView(
          //ACHO Q se houver DADOS no SNAPSHOT nos vamos fazer um MAP (chave:valor)
          //dos dados q estao dentro dos document
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            //fazendo um MAP com CHAVE:VALOR... de um lado temos a
            //CHAVE do documento tipo 'FUNCIONARIO' e do outro lado temos o
            //VALOR do tipo DYNAMIC pois o FUNCIONARIO pode ser um NOME, NUMERO, etc...
            //
            //data a baixo vai receber os valores dos documents no formato de MAP
            //{chave}: valor
            Map<dynamic, dynamic> data =
                document.data()! as Map<dynamic, dynamic>;
            //entao iremos retornar um material
            return Material(
              //com um listtile...
              child: ListTile(
                //e para cada DOC q tiver no COLLECTION do FB
                //iremos criar uma ListTile para exibir o NOME q foi cadastrado
                title:
                    //eu gostaria de ler as informacoes na forma de MAP
                    //da seguinte forma
                    //
                    // cadastro
                    //Empresa>'funcionario':>'setordeTI':> {'nomeFuncionario': nome}
//pois assim eu poderia tipo: empresa>Funcionarios>
//Varios Setores>Setor de TI>nome do funcionario
//seria mais organizado... Mas pelo o q eu entendi do q eu falei com o Rafa(gurizao q manja
//de Flutter)... ele disse q isso nao e possivel fazer... Só se fizer subcollection
//collecao e docs dentro de collecoes...
                    Text(data['nomedeFuncionario'].toString()),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
