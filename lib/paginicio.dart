import 'package:exemplo41/firebase.dart';
import 'package:exemplo41/nomesCadastrados.dart';
import 'package:flutter/material.dart';

class inicio extends StatefulWidget {
//TALVEZ COMENTAR O CONST //
  const inicio({Key? key}) : super(key: key);

  @override
  _inicioState createState() => _inicioState();
}

class _inicioState extends State<inicio> {
//definindo a variavel NOME e dizendo q ela e do tipo TextEditingController
//ou seja q a variavel NOME vai recer um valor TEXTUAL e esse valor
//sera digitado no teclado pelo usuario do APP
  TextEditingController nome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //esqueleto do app
    return Scaffold(
      //single child scroll view EU ACHO Q serve para q se tivermos varios
      //botoes/containers nessa pagina nos possamos rolar para baixo, e
      //ver os outros botoes, e conteudo da pagina
      body: SingleChildScrollView(
        //criando um formulario
        child: Form(
          //os campos desse formulario ficaram um em baixo do outro
          //ou seja em forma de COLUNA... SE fosse ROW seria em forma de
          //LINHA... um do lado do outro
          child: Column(
            //um dos "filhos" do colum no caso o CHILDREN permite q nos
            //colocamos varios WIDGETS de uma vez
            children: [
              //o primeiro WIDGET do nosso children é o TextFormField
              //ou seja é criar um CAMPO para DIGITAR um TEXTO
              TextFormField(
                //dizermos q o tipo de dado q sera passado é do tipo TEXT
                keyboardType: TextInputType.text,
                //aqui passamos parametros q iram ajudar a DECORAR"ficar bonito"
                //no casso vamos por uma frase simples em cima do campo
                //de digitar texto... a frase e INSIRA O SEU NOME
                decoration: InputDecoration(labelText: "insira o sue nome"),
                //alinhando o texto q digitamos no centro do campo de digitar
                //texto
                textAlign: TextAlign.center,
                //o valor digitado fica salvo na variavel NOME que é a variavel
                //do tipo Text Editing Controller q criamos ali em cima
                controller: nome,
              ),
              //criando um campo para detectar toque na tela do app
              GestureDetector(
                //se for dado um toque/clique
                onTap: () {
                  //passando os valores q estao armazenados na variavel NOME
                  //para a classe FB... Apos esses valores estarem na classe FB
                  //vamos passar esses valores para a FUNCAO ADDCADASATRO
                  //e a funcao ADDCADASTRO vai upar o valor da variavel NOME
                  //para o BANCO de dados FIREBASE
                  fb(nome.text).addCadastro(nome.text);
                },
                //os comandos q estao no Gesture Detector acima
                //só vao funcionar se forem clicados nesse container aqui
                child: Container(
                  //parametros de altura, largura, cor, e texto do container
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  child: Text('cadastrar nome'),
                ),
              ),
              //campo pra detectar toque na tela
              GestureDetector(
                //se for dado um toque
                onTap: () {
                  //aqui vai chamar a classe/funcao q nos leva para a PAG
                  //dos nomes digitados... no caso estamos chamando a /nomesCad
                  //q foi definido no arquivo main.dart q ao chamar ela "/nomeCad"
                  //ela vai chamar a funcao/classe NomesCadastrados
                  Navigator.of(context).pushNamed('/nomesCad');
                },
                //a funcao do gesture detector acima e acionada se clicarmos
                //no container a baixo
                child: Container(
                  //altura, largura, cor e nome do container
                  height: 100,
                  width: 100,
                  color: Colors.green,
                  child: Text('ver nomes cadastrados'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
