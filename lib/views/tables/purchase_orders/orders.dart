import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/order.dart';
import 'package:my_udyog_admin/view_models/orders_provider.dart';
import 'package:my_udyog_admin/views/dashboard/utils/checkbox_widget.dart';
import 'package:provider/provider.dart';

import '../../../models/export.dart';
import '../../../view_models/table_provider.dart';
import '../../dashboard/utils/export.dart';

class PurchaseOrdersTable extends StatefulWidget {
  const PurchaseOrdersTable({super.key});

  @override
  State<PurchaseOrdersTable> createState() => _PurchaseOrdersTableState();
}

class _PurchaseOrdersTableState extends State<PurchaseOrdersTable> {
  bool isLoading = true;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    fetchAndSetData();
  }

  fetchAndSetData() {
    Provider.of<OrdersProvider>(context, listen: false).fetchAndSetData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var ordProvider = Provider.of<OrdersProvider>(context);
    List<Order> _orders = ordProvider.orders;
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
                        ordProvider.selectAll();
                      } else {
                        ordProvider.deselectAll();
                      }
                    },
                    value: isSelected,
                  )),
                  ...purchaseHeaderTexts.map((cat) {
                    return DataColumn(label: Text(cat));
                  }).toList(),
                ],
                rows: [
                  ..._orders.map(
                    (ord) {
                      return DataRow(
                        cells: [
                          DataCell(CheckBoxWidget(
                            onTap: (value) {
                              ordProvider.selectOrder(ord.id);
                            },
                            value: ord.isSelected,
                          )),
                          DataCell(Text(ord.id)),
                          DataCell(Text(ord.poId)),
                          DataCell(Text(ord.poFrom)),
                          DataCell(Text(ord.poTo)),
                          DataCell(Text(ord.date)),
                          DataCell(Text(ord.state)),
                          DataCell(Text(ord.city)),
                          DataCell(Text(ord.poStatus,
                              style: TextStyle(
                                color: ord.poStatus == 'Accepted'
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
