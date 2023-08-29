import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Graph extends StatefulWidget {
  const Graph({super.key});

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  double total = 5764.75;
  int index = 0;
  late String graphlabel = "";
  late double graphValor = 0;
  List<Map> valor = [];
  late double soma;

  List<Map<String, dynamic>> dados = [
    {
      "Data": "06/jul",
      "Empresa": "Germany Garage",
      "Valor": "R\$ 90,00",
      "Parcelas": "02/dez",
      "Categoria": "Manutenção",
      "Produto": "Câmera de Ré",
    },
    {
      "Data": "06/jul",
      "Empresa": "Park Zone",
      "Valor": "R\$ 24,00",
      "Parcelas": "0",
      "Categoria": "Estacionamento",
      "Produto": "Estacionamento Shop, Ibira",
    },
    {
      "Data": "06/jul",
      "Empresa": "Germany Garage",
      "Valor": "R\$ 250,00",
      "Parcelas": "11/dez",
      "Categoria": "Manutenção",
      "Produto": "Multimídia",
    },
    {
      "Data": "06/jul",
      "Empresa": "Shell",
      "Valor": "R\$ 161,74",
      "Parcelas": "0",
      "Categoria": "Gasolina",
      "Produto": "Posto Bola Pesada",
    },
    {
      "Data": "10/jul",
      "Empresa": "Sumup",
      "Valor": "R\$ 1.985,53",
      "Parcelas": "0",
      "Categoria": "Lazer",
      "Produto": "Winter Wonderland Bulgária",
    },
    {
      "Data": "13/jul",
      "Empresa": "Amazon",
      "Valor": "R\$ 52,00",
      "Parcelas": "0",
      "Categoria": "ComprasInternet",
      "Produto": "Vonixx Shiny",
    },
    {
      "Data": "14/jul",
      "Empresa": "Vans",
      "Valor": "R\$ 96,67",
      "Parcelas": "01/mar",
      "Categoria": "Lazer",
      "Produto": "Chapéu Anaheim Sidewall Natural",
    },
    {
      "Data": "16/jul",
      "Empresa": "Kodeco",
      "Valor": "R\$ 2.390,77",
      "Parcelas": "0",
      "Categoria": "Estudos",
      "Produto": "Curso Swift",
    },
    {
      "Data": "18/jul",
      "Empresa": "Drogaria São Paulo",
      "Valor": "R\$ 33,74",
      "Parcelas": "01/fev",
      "Categoria": "Saúde",
      "Produto": "Bye Bad",
    },
    {
      "Data": "18/jul",
      "Empresa": "San Paolo Gelateria",
      "Valor": "R\$ 23,50",
      "Parcelas": "0",
      "Categoria": "FastFood",
      "Produto": "Gelato",
    },
    {
      "Data": "22/jul",
      "Empresa": "Pizza King",
      "Valor": "R\$ 36,00",
      "Parcelas": "0",
      "Categoria": "FastFood",
      "Produto": "Rodízio",
    },
    {
      "Data": "22/jul",
      "Empresa": "Boteco e Petiscaria Th",
      "Valor": "R\$ 6,00",
      "Parcelas": "0",
      "Categoria": "FastFood",
      "Produto": "H2O",
    },
    {
      "Data": "23/jul",
      "Empresa": "Milklandia Chocolates",
      "Valor": "R\$ 45,90",
      "Parcelas": "0",
      "Categoria": "FastFood",
      "Produto": "Chocolates",
    },
    {
      "Data": "23/jul",
      "Empresa": "Boteco e Petiscaria Th",
      "Valor": "R\$ 16,00",
      "Parcelas": "0",
      "Categoria": "FastFood",
      "Produto": "Strawberry Lemonade",
    },
    {
      "Data": "27/jul",
      "Empresa": "Hangar das Artes",
      "Valor": "R\$ 15,00",
      "Parcelas": "0",
      "Categoria": "Casa",
      "Produto": "Imã decorativo",
    },
    {
      "Data": "27/jul",
      "Empresa": "Livraria Cultura",
      "Valor": "R\$ 69,90",
      "Parcelas": "0",
      "Categoria": "Estudo",
      "Produto": "Livro",
    },
    {
      "Data": "27/jul",
      "Empresa": "Duty-Free SSA Airport",
      "Valor": "R\$ 29,90",
      "Parcelas": "0",
      "Categoria": "FastFood",
      "Produto": "Chocolates",
    },
    {
      "Data": "28/jul",
      "Empresa": "Gasper Pneus e Rodas",
      "Valor": "R\$ 187,50",
      "Parcelas": "01/abr",
      "Categoria": "Manutenção",
      "Produto": "Instação Câmera de Ré + Coding",
    },
    {
      "Data": "29/jul",
      "Empresa": "Petrobras",
      "Valor": "R\$ 81,42",
      "Parcelas": "0",
      "Categoria": "Gasolina",
      "Produto": "Auto Posto Zezao",
    },
    {
      "Data": "29/jul",
      "Empresa": "Iwata Sushi",
      "Valor": "R\$ 169,18",
      "Parcelas": "0",
      "Categoria": "FastFood",
      "Produto": "Sushi",
    },
  ];

  void handleTouch(FlTouchEvent touchEvent, PieTouchResponse? touchResponse) {
    if (touchEvent is FlLongPressEnd) {
      setState(() {
        index = touchResponse!.touchedSection!.touchedSectionIndex;
        setGraphData(index);
      });
    }
  }

  loadData() {
    setGraphData(index);
    final tamanho = 8; // categoria

    return List.generate(
      tamanho,
      (i) {
        final isTouched = i == index;
        final isSaldo = i == tamanho - 1;
        final fontsize = isTouched ? 18.0 : 14.0;
        final radius = isTouched ? 60.0 : 50.0;
        final color = isTouched ? Colors.tealAccent : Colors.tealAccent[400];

        List<double> porcentagem = [9, 0, 4, 36, 1, 43, 1, 6];

        return PieChartSectionData(
          color: color,
          value: porcentagem[i],
          title: '$porcentagem%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontsize,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        );
      },
    );
  }

  setValores() {}
  setGraphData(int index) {
    Set<String> categoriasUnicas = Set<String>();
    Map<String, double> somaPorCategoria = {};

// Percorre a lista para obter categorias únicas
    for (var dado in dados) {
      categoriasUnicas.add(dado["Categoria"]);

      String nomeCategoria = dado["Categoria"];
      double valor = double.parse(
          dado["Valor"].replaceAll("R\$ ", "").replaceAll(",", ""));

      if (somaPorCategoria.containsKey(nomeCategoria)) {
        somaPorCategoria[nomeCategoria] =
            somaPorCategoria[nomeCategoria]! + valor;
      } else {
        somaPorCategoria[nomeCategoria] = valor;
      }
    }
    for (var categoria in somaPorCategoria.keys) {
      soma = somaPorCategoria[categoria] as double;
      print("Categoria: $categoria - Soma dos valores: R\$ $soma");
    }

    int quantidadeCategorias = categoriasUnicas.length;
    if (index < 0) return;
    if (index == quantidadeCategorias) {
      graphlabel = 'Saldo';
      graphValor = quantidadeCategorias as double;
    } else {
      graphlabel = dados[index]["Categoria"];
      graphValor != somaPorCategoria[index] as double;
    }
  }

  @override
  Widget build(BuildContext context) {
    return (total <= 0)
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 5,
                    centerSpaceRadius: 110,
                    sections: loadData(),
                    pieTouchData: PieTouchData(
                      touchCallback: (touchEvent, touchResponse) {
                        handleTouch(touchEvent, touchResponse);
                      },
                    ),
                  ),
                ),
              ),

              Column(
                children: [
                  Text(
                    graphlabel,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.teal,
                    ),
                  ),
                ],
              )

              // Expanded(
              //   child: Container(
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Container(
              //           height: MediaQuery.of(context).size.height / 4,
              //           child: Lottie.asset('assets/lottie/profile_hello.json'),
              //         )
              //       ],
              //     ),
              //   ),
              // )
            ],
          );
  }
}
