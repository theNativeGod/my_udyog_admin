import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/category.dart';
import 'package:my_udyog_admin/models/enquiry.dart';
import 'package:my_udyog_admin/view_models/enquiries_provider.dart';
import 'package:my_udyog_admin/views/dashboard/utils/checkbox_widget.dart';
import 'package:provider/provider.dart';

import '../../../view_models/table_provider.dart';
import '../../dashboard/utils/export.dart';

class EnquiriesTable extends StatefulWidget {
  const EnquiriesTable({super.key});

  @override
  State<EnquiriesTable> createState() => _EnquiriesTableState();
}

class _EnquiriesTableState extends State<EnquiriesTable> {
  bool isLoading = true;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    fetchAndSetData();
  }

  fetchAndSetData() {
    Provider.of<EnquiriesProvider>(context, listen: false).fetchAndSetData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var enquiriesProvider = Provider.of<EnquiriesProvider>(context);
    List<Enquiry> _enquiries = enquiriesProvider.enquiries;
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
                        enquiriesProvider.selectAll();
                      } else {
                        enquiriesProvider.deselectAll();
                      }
                    },
                    value: isSelected,
                  )),
                  ...enquiriesHeaderTexts.map((cat) {
                    return DataColumn(label: Text(cat));
                  }).toList(),
                ],
                rows: [
                  ..._enquiries.map(
                    (enq) {
                      return DataRow(
                        cells: [
                          DataCell(CheckBoxWidget(
                            onTap: (value) {
                              enquiriesProvider.selectEnquiry(enq.id);
                            },
                            value: enq.isSelected,
                          )),
                          DataCell(Text(enq.id)),
                          DataCell(Text(enq.enquiryFrom)),
                          DataCell(Text(enq.enquiryTo)),
                          DataCell(Text(enq.date)),
                          DataCell(Text(enq.commodity)),
                          DataCell(Text(enq.packing)),
                          DataCell(Text(enq.state)),
                          DataCell(Text(enq.city)),
                          DataCell(Text(
                            enq.enquiryStatus,
                            style: TextStyle(
                              color: enq.enquiryStatus == 'Addressed'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          )),
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
