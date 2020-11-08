import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/component/custom_appbar/custom_appbar.dart';
import 'package:flutter_demo/component/custom_appdrawer/custom_popupmenubutton.dart';
import 'package:flutter_demo/component/custom_pgdatatable/custom_pgdatatable.dart';
import 'package:flutter_demo/config/constants/constants.dart';
import 'package:flutter_demo/config/global_theme/theme.dart';
import 'package:flutter_demo/pages/home/bloc/home_bloc.dart';
import 'package:flutter_demo/pages/home/model/user_model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DTS dts;

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(FetchUserData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    void selectedChoice(choice) {
      if (choice == Constants.Dark) {
        _themeChanger.setTheme(ThemeData.dark());
      } else if (choice == Constants.Light) {
        _themeChanger.setTheme(ThemeData.light());
      }
    }

    return MaterialApp(
        theme: _themeChanger.getTheme(),
        home: Scaffold(
          appBar: CustomAppBar(
            title: Text(
              "Flutter Demo",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              CustomPopupMenuButton(
                  icon: Icon(Icons.arrow_drop_down, size: 30),
                  onSelected: selectedChoice,
                  itemBuilder: (BuildContext context) {
                    return Constants.selection
                        .map((String choice) => PopupMenuItem<String>(
                            value: choice,
                            child: Text(
                              choice,
                              style: Theme.of(context).textTheme.headline6,
                            )))
                        .toList();
                  })
            ],
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is UserDataInProgress) {
                return Container(
                    child: Center(child: CircularProgressIndicator()));
              } else if (state is UserDataComplete) {
                dts = DTS(state.userdata);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: CustomPgDataTable(
                        header: Text('User Details',style: Theme.of(context).textTheme.headline5,),
                        columns: Constants.columnNames
                            .map(
                              (names) => DataColumn(
                                  label: Text(names,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5)),
                            )
                            .toList(),
                        rowsPerPage: 5,
                        source: dts ?? [],
                      ),
                    )
                  ],
                );
              } else if (state is UserDataError) {
                return Container(
                  child: Center(
                      child: Text(
                          "Oops..... something went wrong ${state.error}")),
                );
              }
              return Container();
            },
          ),
        ));
  }
}

class DTS extends DataTableSource {
  final List<UserModel> _userList;
 
  DTS(this._userList);

  @override
  DataRow getRow(int index) {
    final cellvalue = _userList[index];

    // TODO: implement getRow
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(
          '${cellvalue.name ?? ''}',
          style: TextStyle(
            fontSize: 15,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
          ),
        )),
        DataCell(Text(
          '${cellvalue.age ?? ''}',
          style: TextStyle(
            fontSize: 15,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
          ),
        )),
        DataCell(Text(
          '${cellvalue.city ?? ''}',
          style: TextStyle(
            fontSize: 15,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
          ),
        )),
      ],
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _userList.length ?? 0;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
