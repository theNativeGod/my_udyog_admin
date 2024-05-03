import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_udyog_admin/models/category.dart';
import 'package:my_udyog_admin/view_models/grades_provider.dart';
import 'package:my_udyog_admin/views/dashboard/utils/checkbox_widget.dart';
import 'package:my_udyog_admin/views/dashboard/utils/edit_button.dart';
import 'package:my_udyog_admin/views/dashboard/utils/switch_widget.dart';
import 'package:provider/provider.dart';

import '../../../models/grade.dart';
import '../../../view_models/categories_provider.dart';
import '../../../view_models/table_provider.dart';
import '../../dashboard/utils/export.dart';

class GradesTable extends StatefulWidget {
  const GradesTable({super.key});

  @override
  State<GradesTable> createState() => _GradesTableState();
}

class _GradesTableState extends State<GradesTable> {
  bool isLoading = true;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    fetchAndSetData();
  }

  fetchAndSetData() {
    Provider.of<GradesProvider>(context, listen: false).fetchAndSetData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var grdProvider = Provider.of<GradesProvider>(context);
    List<Grade> _grades = grdProvider.grades;
    isLoading = grdProvider.isLoading;
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
                              grdProvider.selectAll();
                            } else {
                              grdProvider.deselectAll();
                            }
                          },
                          value: isSelected,
                        )),
                        ...gradeHeaderTexts.map((cat) {
                          return DataColumn(label: Text(cat));
                        }).toList(),
                      ],
                      rows: [
                        ..._grades.map(
                          (grd) {
                            return DataRow(
                              cells: [
                                DataCell(CheckBoxWidget(
                                  onTap: (value) {
                                    grdProvider.selectGrade(grd.id);
                                  },
                                  value: grd.isSelected,
                                )),
                                DataCell(Text(grd.id)),
                                DataCell(Text(grd.name)),
                                DataCell(Row(
                                  children: [
                                    ...grd.commodities.map((com) {
                                      return Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xffE6ECFA),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        child: Text(
                                          com,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      );
                                    })
                                  ],
                                )),
                                DataCell(Text(DateFormat('dd/MM/yyyy')
                                    .format(grd.createdDate))),
                                DataCell(Text(DateFormat('dd/MM/yyyy')
                                    .format(grd.createdDate))),
                                DataCell(SwitchWidget(
                                  isOn: grd.status,
                                )),
                                DataCell(EditButton()),
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
