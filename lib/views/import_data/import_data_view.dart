import 'package:bank_dashboard/responsive.dart';
import 'package:bank_dashboard/ui/shared/colors.dart';
import 'package:bank_dashboard/ui/shared/edge_insect.dart';
import 'package:bank_dashboard/ui/shared/spacing.dart';
import 'package:bank_dashboard/ui/widgets/main_header.dart';
import 'package:bank_dashboard/ui/widgets/side_menu.dart';
import 'package:bank_dashboard/views/main/main_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class ImportDataView extends StatefulWidget {
  const ImportDataView({Key? key}) : super(key: key);

  @override
  State<ImportDataView> createState() => _ImportDataViewState();
}

class _ImportDataViewState extends State<ImportDataView> {
  List<bool> buttonStates = [false];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          key: model.scaffoldKey,
          drawer: const SideMenu(),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                const Expanded(
                  child: SideMenu(),
                ),
              horizontalSpaceRegular,
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          verticalSpaceSmall,
                          const MainHeader(),
                          verticalSpaceRegular,
                          Flexible(
                            child: Container(
                              padding: kEdgeInsetsHorizontalSmall,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListView.builder(
                                itemCount: buttonStates.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 200,
                                    width: 300,
                                    color: buttonStates[index] ? Colors.green : Colors.grey,
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: buttonStates[index] ? const Text('Hi, I\'m green') : Container(),
                                        ),
                                        IconButton(
                                          icon: Icon(buttonStates[index] ? Icons.check : Icons.add),
                                          onPressed: () {
                                            setState(() {
                                              buttonStates[index] = true;
                                              if (index == buttonStates.length - 1) {
                                                buttonStates.add(false);
                                              }
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ]
                      )
                    )
                  ],
                )
              ),
              horizontalSpaceSmall,
            ],
          ),
        );
      },
      viewModelBuilder: () => MainViewModel(),
    );
  }
}