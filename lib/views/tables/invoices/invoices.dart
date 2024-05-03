import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/invoice.dart';
import 'package:my_udyog_admin/view_models/invoices_provider.dart';
import 'package:my_udyog_admin/view_models/table_provider.dart';
import 'package:my_udyog_admin/views/dashboard/utils/checkbox_widget.dart';
import 'package:provider/provider.dart';

import '../../../models/export.dart';
import '../../dashboard/utils/export.dart';

class InvoicesTable extends StatefulWidget {
  const InvoicesTable({super.key});

  @override
  State<InvoicesTable> createState() => _InvoicesTableState();
}

class _InvoicesTableState extends State<InvoicesTable> {
  bool isLoading = true;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    fetchAndSetData();
  }

  fetchAndSetData() {
    Provider.of<InvoicesProvider>(context, listen: false).fetchAndSetData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var invProvider = Provider.of<InvoicesProvider>(context);
    List<Invoice> _invoices = invProvider.invoices;
    return Column(
      children: [
        Row(
          children: [
            const SearchBox(),
            const Spacer(),
            ExportButton(),
            const SizedBox(
              width: 8,
            ),
            BlueButton(text: 'Add Category'),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: DataTable(
                headingTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                dataTextStyle: Theme.of(context).textTheme.bodySmall,
                headingRowColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.08);
                  }
                  return const Color(0xffE6ECFA);
                }),
                columns: [
                  DataColumn(
                      label: CheckBoxWidget(
                    onTap: (value) {
                      isSelected = value;
                      if (value) {
                        invProvider.selectAll();
                      } else {
                        invProvider.deselectAll();
                      }
                    },
                    value: isSelected,
                  )),
                  ...invoiceHeaderTexts.map((cat) {
                    return DataColumn(label: Text(cat));
                  }).toList(),
                ],
                rows: [
                  ..._invoices.map(
                    (inv) {
                      return DataRow(
                        cells: [
                          DataCell(CheckBoxWidget(
                            onTap: (value) {
                              invProvider.selectInvoice(inv.invoiceId);
                            },
                            value: inv.isSelected,
                          )),
                          DataCell(Text(inv.orderId)),
                          DataCell(Text(inv.invoiceId)),
                          DataCell(Text(inv.from)),
                          DataCell(Text(inv.to)),
                          DataCell(Text(inv.date)),
                          DataCell(Text(inv.state)),
                          DataCell(Text(inv.city)),
                          DataCell(Text(inv.status,
                              style: TextStyle(
                                color: inv.status == 'Generated'
                                    ? Colors.green
                                    : Colors.red,
                              ))),
                        ],
                      );
                    },
                  ).toList(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
