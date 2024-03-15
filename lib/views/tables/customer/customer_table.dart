import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/category.dart';
import 'package:my_udyog_admin/models/customer.dart';
import 'package:my_udyog_admin/view_models/customer_provider.dart';
import 'package:my_udyog_admin/views/dashboard/utils/checkbox_widget.dart';
import 'package:provider/provider.dart';

import '../../../view_models/grades_provider.dart';
import '../../../view_models/table_provider.dart';
import '../../dashboard/utils/export.dart';

class CustomerTable extends StatefulWidget {
  const CustomerTable({super.key});

  @override
  State<CustomerTable> createState() => _CustomerTableState();
}

class _CustomerTableState extends State<CustomerTable> {
  bool isLoading = true;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    fetchAndSetData();
  }

  fetchAndSetData() {
    Provider.of<CustomerProvider>(context, listen: false).fetchAndSetData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var customerProvider = Provider.of<CustomerProvider>(context);
    List<Customer> _customers = customerProvider.customers;
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
            AddCategory(text: 'Add Category'),
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
            // physics: const ClampingScrollPhysics(),
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
                        customerProvider.selectAll();
                      } else {
                        customerProvider.deselectAll();
                      }
                    },
                    value: isSelected,
                  )),
                  ...customerHeaderTexts.map((cus) {
                    return DataColumn(label: Text(cus));
                  }).toList(),
                ],
                rows: [
                  ..._customers.map(
                    (cus) {
                      return DataRow(
                        cells: [
                          DataCell(CheckBoxWidget(
                            onTap: (value) {
                              customerProvider.selectCustomer(cus.id);
                            },
                            value: cus.isSelected,
                          )),
                          DataCell(Text(cus.id)),
                          DataCell(Text(cus.name)),
                          DataCell(Text(cus.plan)),
                          DataCell(Text(cus.joiningDate)),
                          DataCell(Text(cus.customerType)),
                          DataCell(Text(cus.companyName)),
                          DataCell(Text(cus.designation)),
                          DataCell(Text(cus.employees)),
                          DataCell(Text(cus.commodities)),
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
