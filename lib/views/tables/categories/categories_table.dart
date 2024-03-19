import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_udyog_admin/models/category.dart';
import 'package:provider/provider.dart';

import '../../../view_models/categories_provider.dart';
import '../../../view_models/table_provider.dart';
import '../../dashboard/utils/export.dart';

class CategoriesTable extends StatefulWidget {
  const CategoriesTable({super.key});

  @override
  State<CategoriesTable> createState() => _CategoriesTableState();
}

class _CategoriesTableState extends State<CategoriesTable> {
  bool isLoading = true;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    fetchAndSetData();
  }

  fetchAndSetData() {
    Provider.of<CategoriesProvider>(context, listen: false)
        .fetchAndSetCategories();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var catProvider = Provider.of<CategoriesProvider>(context);
    List<Category> _categories = catProvider.categories;
    isLoading = catProvider.isLoading;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
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
                      headingRowColor:
                          MaterialStateProperty.resolveWith<Color?>(
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
                              catProvider.selectAll();
                            } else {
                              catProvider.deselectAll();
                            }
                          },
                          value: isSelected,
                        )),
                        ...catheaderTexts.map((cat) {
                          return DataColumn(label: Text(cat));
                        }).toList(),
                      ],
                      rows: [
                        ..._categories.map(
                          (cat) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  CheckBoxWidget(
                                    onTap: (value) {
                                      catProvider
                                          .selectCategory(cat.categoryId);
                                    },
                                    value: cat.isSelected,
                                  ),
                                ),
                                DataCell(Text(cat.categoryId)),
                                DataCell(Text(cat.categoryName)),
                                DataCell(Text(DateFormat('dd/MM/yyyy')
                                    .format(cat.createdDate))),
                                DataCell(Text(DateFormat('dd/MM/yyyy')
                                    .format(cat.modifiedDate))),
                                DataCell(
                                  SwitchWidget(
                                    isOn: true,
                                  ),
                                ),
                                DataCell(
                                  EditButton(),
                                ),
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
