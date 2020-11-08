import 'package:flutter/material.dart';

class CustomPgDataTable extends PaginatedDataTable{

CustomPgDataTable({Key key,Widget header, int rowsPerPage, List columns ,DataTableSource source} )
:super(key:key,header:header,columns:columns,source:source,rowsPerPage:rowsPerPage);

}