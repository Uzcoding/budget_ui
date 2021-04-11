import 'package:budget_ui/data/data.dart';
import 'package:budget_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expences;

  const BarChart(this.expences);

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expences.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Text(
            'Wekkly Spending',
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 30.0,
                onPressed: () {},
              ),
              Text(
                'Nov 10, 2019 - Nov 16, 2019',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                iconSize: 30.0,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(
              expences.length,
              (index) => Bar(
                label: days[index],
                amountSpent: expences[index],
                mostExpensive: mostExpensive,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
