import 'package:flutter/material.dart';

class Ex41Popupmenubutton extends StatelessWidget {
  const Ex41Popupmenubutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PopupMenuButton"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                  value: "edit",
                  onTap: () {
                    debugPrint("editOnTap");
                  },
                  child: const Text("Edit")),
              PopupMenuItem(
                  value: "delete",
                  onTap: () {
                    debugPrint("deleteOnTap");
                  },
                  child: const Text("Delete")),
            ],
            position: PopupMenuPosition.under,
            onOpened: () {
              debugPrint("open");
            },
            onCanceled: () {
              debugPrint("cancel");
            },
            onSelected: (value) {
              debugPrint("selected: $value");
              if (value == 'edit') {
                // go to edit page
              } else {
                // go to delete page
              }
            },
          )
        ],
      ),
    );
  }
}
