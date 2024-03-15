import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/category.dart';
import 'package:my_udyog_admin/models/commodity.dart';
import 'package:my_udyog_admin/view_models/categories_provider.dart';
import 'package:my_udyog_admin/view_models/commodities_provider.dart';
import 'package:my_udyog_admin/views/dashboard/utils/checkbox_widget.dart';
import 'package:my_udyog_admin/views/dashboard/utils/edit_button.dart';
import 'package:my_udyog_admin/views/dashboard/utils/switch_widget.dart';
import 'package:provider/provider.dart';

import '../../../view_models/table_provider.dart';
import '../../dashboard/utils/export.dart';

class CommoditiesTable extends StatefulWidget {
  const CommoditiesTable({super.key});

  @override
  State<CommoditiesTable> createState() => _CommoditiesTableState();
}

class _CommoditiesTableState extends State<CommoditiesTable> {
  bool isLoading = true;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    fetchAndSetData();
  }

  fetchAndSetData() {
    Provider.of<CommoditiesProvider>(context, listen: false).fetchAndSetData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var comProvider = Provider.of<CommoditiesProvider>(context);
    List<Commodity> _commodities = comProvider.commodities;
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
                        comProvider.selectAll();
                      } else {
                        comProvider.deselectAll();
                      }
                    },
                    value: isSelected,
                  )),
                  ...comHeaderTexts.map((cat) {
                    return DataColumn(label: Text(cat));
                  }).toList(),
                ],
                rows: [
                  ..._commodities.map(
                    (com) {
                      return DataRow(
                        cells: [
                          DataCell(
                            CheckBoxWidget(
                              onTap: (value) {
                                comProvider.selectCommodity(com.id);
                              },
                              value: com.isSelected,
                            ),
                          ),
                          DataCell(Text(com.id)),
                          DataCell(Text(com.name)),
                          DataCell(Text(com.category)),
                          DataCell(Text(com.createdDate)),
                          DataCell(Text(com.modifiedDate)),
                          DataCell(SwitchWidget(
                            isOn: com.status,
                          )),
                          const DataCell(EditButton()),
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
