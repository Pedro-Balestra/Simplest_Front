import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simples_front_end/utils/appColors.dart';

import '../menu_drawer/drawer.dart';

class CategoryPurchasesScreen extends StatefulWidget {
  final String category;
  final List<Map<String, dynamic>> purchases;

  const CategoryPurchasesScreen(
      {super.key, required this.category, required this.purchases});

  @override
  State<CategoryPurchasesScreen> createState() =>
      _CategoryPurchasesScreenState();
}

class _CategoryPurchasesScreenState extends State<CategoryPurchasesScreen> {
  double categoryTotal = 0.0;

  @override
  Widget build(BuildContext context) {
    for (var purchase in widget.purchases) {
      categoryTotal += purchase["Valor"];
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: menuDrawer(context),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            color: AppColors.primaryColor,
            child: Center(
              child: Text(
                "R\$ ${categoryTotal.toStringAsFixed(2)}",
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          (categoryTotal <= 0)
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Expanded(
                  child: Container(
                    color: AppColors.primaryColor,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 450,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const ScrollPhysics(),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      buildProductColumn(widget.purchases),
                                      buildValueColumn(widget.purchases),
                                      buildPercentageColumn(
                                          widget.purchases, categoryTotal),
                                    ],
                                  ),
                                ),
                                // Lista dinâmica dos produtos, valores e porcentagens
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget buildProductColumn(List<Map<String, dynamic>> purchases) {
    return Column(
      children: [
        Text(
          "Produto",
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: AppColors.buttonText,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        for (var purchase in purchases)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  purchase["Produto"],
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppColors.buttonText,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget buildValueColumn(List<Map<String, dynamic>> purchases) {
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
        for (var purchase in purchases)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  purchase["Valor"].toStringAsFixed(2),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppColors.buttonText,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget buildPercentageColumn(
      List<Map<String, dynamic>> purchases, double categoryTotal) {
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
        for (var purchase in purchases)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ((purchase["Valor"] / categoryTotal) * 100)
                      .toStringAsFixed(2),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppColors.buttonText,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
