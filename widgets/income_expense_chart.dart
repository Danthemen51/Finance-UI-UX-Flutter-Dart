import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class IncomeExpenseChart extends StatelessWidget {
  final double income;
  final double expense;

  const IncomeExpenseChart({
    super.key,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    final total = (income + expense);
    final primary = Theme.of(context).colorScheme.primary;
    final expenseColor = Colors.redAccent;

    final showData = income > 0 || expense > 0;
    final incomeValue = showData ? income : 1.0;
    final expenseValue = showData ? expense : 1.0;

    final incomePercent = total == 0 ? 50 : ((income / total) * 100).round();
    final expensePercent = total == 0 ? 50 : ((expense / total) * 100).round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Income vs Expense', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            PopupMenuButton<String>(
              onSelected: (v) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Save to: $v (UI only)')));
              },
              itemBuilder: (c) => const [
                PopupMenuItem(value: 'Gallery', child: Text('Save to Gallery')),
                PopupMenuItem(value: 'Files', child: Text('Save to Files')),
                PopupMenuItem(value: 'Share', child: Text('Share')),
              ],
              child: Row(
                children: [
                  Icon(Icons.save, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 6),
                  Text('Save to', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            SizedBox(
              width: 140,
              height: 140,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 28,
                  sections: [
                    PieChartSectionData(
                      value: incomeValue,
                      color: primary,
                      title: '${incomePercent}%',

                      titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                      radius: 48,
                    ),
                    PieChartSectionData(
                      value: expenseValue,
                      color: expenseColor,
                      title: '${expensePercent}%',

                      titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                      radius: 48,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _LegendItem(color: primary, label: 'Income', value: income),
                  const SizedBox(height: 8),
                  _LegendItem(color: expenseColor, label: 'Expense', value: expense),
                  const SizedBox(height: 8),
                  const Divider(),
                  Text('Net: ${_formatCurrency(income - expense)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatCurrency(double v) {
    final sign = v < 0 ? '-' : '';
    final abs = v.abs().toInt();
    final s = abs.toString();
    final reg = RegExp(r'\B(?=(\d{3})+(?!\d))');
    final formatted = s.replaceAllMapped(reg, (m) => '.');
    return '${sign}Rp$formatted'; // <-- diperbaiki dari '$signRp$formatted'
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final double value;
  const _LegendItem({required this.color, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(3))),
        const SizedBox(width: 8),
        Expanded(child: Text(label)),
        Text(_formatValue(value), style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  String _formatValue(double v) {
    final abs = v.abs().toInt();
    final s = abs.toString();
    final reg = RegExp(r'\B(?=(\d{3})+(?!\d))');
    final formatted = s.replaceAllMapped(reg, (m) => '.');
    return (v < 0 ? '-Rp' : 'Rp') + formatted;
  }
}