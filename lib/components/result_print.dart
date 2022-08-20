import 'package:flutter/material.dart';
import 'package:sentiment_analysis/constants.dart';
import '../screens/input_page.dart';

class Result_print extends StatefulWidget {
  @override
  State<Result_print> createState() => _Result_printState();
}

class _Result_printState extends State<Result_print> {
  String checkSentiment(var value) {
    try {
      if (value > 0 && value < 0.5000) {
        return 'Positive';
      } else if (value >= 0.5) {
        return 'Very Positive';
      } else if (value < 0 && value < -0.5) {
        return 'Negative';
      } else if (value >= -0.5) {
        return 'Very Negative';
      } else {
        return 'Neutral';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Container(
            height: 320,
            width: 600,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: nextmainColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.white,
                  ),
                  child: DataTable(
                    headingRowHeight: 100,
                    dataRowHeight: 100,
                    dividerThickness: 1,
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Model',
                          style: tableHead,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Score',
                          style: tableHead,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Sentiment',
                          style: tableHead,
                        ),
                      ),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Text(
                              dataJSON['results'][0]['model'],
                              style: tableData,
                            ),
                          ),
                          DataCell(
                            Text(
                              dataJSON['results'][0]['rScore']
                                  .toStringAsFixed(4),
                              style: tableData,
                            ),
                          ),
                          DataCell(
                            Text(
                              checkSentiment(dataJSON['results'][0]['rScore']),
                              style: tableData,
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Text(
                              dataJSON['results'][1]['model'],
                              style: tableData,
                            ),
                          ),
                          DataCell(
                            Text(
                              dataJSON['results'][1]['rScore']
                                  .toStringAsFixed(4),
                              style: tableData,
                            ),
                          ),
                          DataCell(
                            Text(
                              checkSentiment(dataJSON['results'][1]['rScore']),
                              style: tableData,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Container(
            height: 140,
            width: 600,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: nextmainColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Evaluated Text',
                  style: evaluatedFont,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    inputText.toString(),
                    style: evaluatedResult,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
