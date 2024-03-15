import 'package:flutter/material.dart';
import 'package:my_udyog_admin/models/blog.dart';
import 'package:my_udyog_admin/view_models/blogs_provider.dart';
import 'package:my_udyog_admin/view_models/invoices_provider.dart';
import 'package:my_udyog_admin/view_models/table_provider.dart';
import 'package:my_udyog_admin/views/dashboard/utils/checkbox_widget.dart';
import 'package:my_udyog_admin/views/dashboard/utils/export.dart';
import 'package:provider/provider.dart';

import '../../../models/export.dart';

class BlogsTable extends StatefulWidget {
  const BlogsTable({super.key});

  @override
  State<BlogsTable> createState() => _BlogsTableState();
}

class _BlogsTableState extends State<BlogsTable> {
  bool isLoading = true;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    fetchAndSetData();
  }

  fetchAndSetData() {
    Provider.of<BlogsProvider>(context, listen: false).fetchAndSetData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var blogsProvider = Provider.of<BlogsProvider>(context);
    List<Blog> _blogs = blogsProvider.blogs;
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
                        blogsProvider.selectAll();
                      } else {
                        blogsProvider.deselectAll();
                      }
                    },
                    value: isSelected,
                  )),
                  ...blogHeaderTexts.map((cat) {
                    return DataColumn(label: Text(cat));
                  }).toList(),
                  // DataColumn(
                  //   label: Text('Actions'),
                  // ),
                ],
                rows: [
                  ..._blogs.map(
                    (blg) {
                      return DataRow(
                        cells: [
                          DataCell(CheckBoxWidget(
                            onTap: (value) {
                              blogsProvider.selectBlog(blg.article);
                            },
                            value: blg.isSelected,
                          )),
                          DataCell(ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xffE6ECFA),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            title: Text(
                              blg.article,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          )),
                          DataCell(Text(blg.category)),
                          DataCell(Text(blg.pageViews)),
                          DataCell(Text(blg.status,
                              style: TextStyle(
                                color: blg.status == 'Published'
                                    ? Colors.green
                                    : blg.status == 'Unpublished'
                                        ? Colors.red
                                        : Colors.purple,
                              ))),
                          DataCell(ActionsButton()),
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
