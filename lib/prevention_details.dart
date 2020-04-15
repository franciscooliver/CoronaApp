import 'package:corona_app/utils/navigator.dart';
import 'package:flutter/material.dart';

class PreventionDetails extends StatelessWidget {
  final int indexText;
  PreventionDetails(this.indexText);

  List<InlineSpan> textSpanList1 = [
    WidgetSpan(
        child: Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      child: Text(
          'Para proteger você e sua família, o Ministério da Saúde orienta a produção de modelos simples, de pano, que também funcionam como barreiras na propagação da doença. ',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 16.0),
          ),
    )),
    WidgetSpan(
      child: Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Text( 'Desde o início da pandemia provocada pelo coronavírus, uma corrida mundial em busca de máscaras de proteção fez com que elas sumissem das prateleiras. O Ministério da Saúde está realizando compras de fornecedores nacionais e internacionais, em grandes quantidades, para garantir a proteção dos profissionais de saúde, que trabalham na assistência às pessoas doentes.',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 16.0),
        ),
      ),
    ),
    WidgetSpan(
      child: Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Text('A confecção de máscaras caseiras tem se tornando um fenômeno mundial e qualquer cidadão pode fazer a sua em casa. Agora, o Ministério da Saúde do Brasil vai lançar uma campanha digital pela mobilização da população para fabricar as próprias máscaras de pano.',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 16.0),
        ),
      ),
    )
  ];
  List<InlineSpan> textSpanList2 = [
    WidgetSpan(
      child: Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Text('A lavagem frequente das mãos é a principal recomendação para se prevenir.',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 16.0),
        ),
      ),
    ),
    WidgetSpan(
      child: Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Text('Para evitar a proliferação do vírus, o Ministério da Saúde recomenda medidas básicas de higiene, como lavar bem as mãos (dedos, unhas, punho, palma e dorso) com água e sabão, e, de preferência, utilizar toalhas de papel para secá-las.'
        'Além do sabão, outro produto indicado para higienizar as mãos é o álcool gel, que também serve para limpar objetos como telefones, teclados, cadeiras, maçanetas, etc. Para a limpeza doméstica recomenda-se a utilização dos produtos usuais, dando preferência para o uso da água sanitária (em uma solução de uma parte de água sanitária para 9 partes de água) para desinfetar superfícies.',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 16.0),
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(24, 55, 168, 1.0),
              Color.fromRGBO(45, 105, 192, 1.0)
            ],
          )),
        ),
        leading: Container(),
        titleSpacing: -40.0,
        title: Text('Dicas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              NavigatorApp.pop(context);
            },
          )
        ],
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(10.0)),
      child: SingleChildScrollView(
        child: RichText(
          strutStyle: StrutStyle(
            fontFamily: 'Google',
            fontSize: 18.0,
            height: 0.8,
          ),
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: indexText == 0
                  ? List.generate(textSpanList1.length, (index) {
                      return textSpanList1[index];
                    })
                  : List.generate(
                      textSpanList2.length, (index) => textSpanList2[index])),
        ),
      ),
    );
  }
}
