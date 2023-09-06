import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simples_front_end/utils/appColors.dart';

import '../../../model/dados.dart';

class Extrato extends StatefulWidget {
  const Extrato({Key? key}) : super(key: key);

  @override
  State<Extrato> createState() => _ExtratoState();
}

class _ExtratoState extends State<Extrato> {
  double total = 0.0;

  void calculaTotal() {
    for (var dado in dados) {
      double valor = dado["Valor"];
      total += valor;
    }
  }

  Map<String, double> categoryTotals = {};

  void calculaTotaisPorCategoria() {
    for (var dado in dados) {
      String categoria = dado["Categoria"];
      double valor = dado["Valor"];

      if (categoryTotals.containsKey(categoria)) {
        categoryTotals[categoria] = categoryTotals[categoria]! + valor;
      } else {
        categoryTotals[categoria] = valor;
      }
    }
  }

  double calculaPercentual(double valor, double total) {
    if (total == 0) {
      return 0.0; // Evita divisão por zero
    }
    return (valor / total) * 100;
  }

  @override
  void initState() {
    super.initState();
    calculaTotal();
    calculaTotaisPorCategoria();
  }

  @override
  Widget build(BuildContext context) {
    return (total <= 0)
        ? SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Expanded(
            child: Container(
              color: AppColors.primaryColor, // Cor de fundo da tela
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                      color: Colors.white, // Cor do container branco
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5), // Cor da sombra
                          spreadRadius: 5, // Raio de espalhamento
                          blurRadius: 10, // Raio de desfoque
                          offset: const Offset(0, 3), // Deslocamento da sombra
                        ),
                      ],
                    ),
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height,
                    ),
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                buildCategoryColumn(),
                                buildValueColumn(),
                                buildPercentageColumn(),
                              ],
                            ),
                          ),
                          // Lista dinâmica das categorias, valores e porcentagens
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Widget buildCategoryColumn() {
    return Column(
      children: [
        Text(
          "Categoria",
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: AppColors.buttonText,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        for (var categoria in categoryTotals.keys)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              categoria,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.buttonText,
              ),
            ),
          ),
      ],
    );
  }

  Widget buildValueColumn() {
    return Column(
      children: [
        Text(
          "R\$",
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: AppColors.buttonText,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        for (var categoria in categoryTotals.keys)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              categoryTotals[categoria]!.toStringAsFixed(2),
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.buttonText,
              ),
            ),
          ),
      ],
    );
  }

  Widget buildPercentageColumn() {
    return Column(
      children: [
        Text(
          "%",
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: AppColors.buttonText,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        for (var categoria in categoryTotals.keys)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              calculaPercentual(categoryTotals[categoria]!, total)
                  .toStringAsFixed(2),
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.buttonText,
              ),
            ),
          ),
      ],
    );
  }
}
