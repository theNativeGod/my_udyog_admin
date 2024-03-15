import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/ad.dart';
import 'package:my_udyog_admin/view_models/ads_provider.dart';
import 'package:my_udyog_admin/view_models/table_provider.dart';
import 'package:provider/provider.dart';
import '../../dashboard/utils/export.dart';

class AdsTable extends StatefulWidget {
  const AdsTable({super.key});

  @override
  State<AdsTable> createState() => _AdsTableState();
}

class _AdsTableState extends State<AdsTable> {
  bool isLoading = true;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    fetchAndSetData();
  }

  fetchAndSetData() {
    Provider.of<AdsProvider>(context, listen: false).fetchAndSetData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var adsProvider = Provider.of<AdsProvider>(context);
    List<Ad> _ads = adsProvider.ads;
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
                        adsProvider.selectAll();
                      } else {
                        adsProvider.deselectAll();
                      }
                    },
                    value: isSelected,
                  )),
                  ...adsHeaderTexts.map((cat) {
                    return DataColumn(label: Text(cat));
                  }).toList(),
                ],
                rows: [
                  ..._ads.map(
                    (ad) {
                      return DataRow(
                        cells: [
                          DataCell(CheckBoxWidget(
                            onTap: (value) {
                              adsProvider.selectAd(ad.adTitle);
                            },
                            value: ad.isSelected,
                          )),
                          DataCell(ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                color: const Color(0xffE6ECFA),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            title: Text(
                              ad.adTitle,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          )),
                          DataCell(Text(ad.category)),
                          DataCell(Text(ad.startDate)),
                          DataCell(Text(ad.endDate)),
                          DataCell(Text(ad.status,
                              style: TextStyle(
                                color: ad.status == 'Active'
                                    ? Colors.green
                                    : ad.status == 'Inactive'
                                        ? Colors.red
                                        : ad.status == 'Draft'
                                            ? Colors.purple
                                            : Colors.amber,
                              ))),
                          const DataCell(ActionsButton()),
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
