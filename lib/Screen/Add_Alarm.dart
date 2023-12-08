import 'package:alaram/Provider/Provier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({super.key});

  @override
  State<AddAlarm> createState() => _AddAlaramState();
}

class _AddAlaramState extends State<AddAlarm> {
  late TextEditingController controller;

  String? dateTime;
  bool repeat = false;

  DateTime ? notificationtime;

  String? name = "none";

  @override
  void initState() {
    controller = TextEditingController();
    context.read<alarmprovider>().GetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.check),
          )
        ],
        automaticallyImplyLeading: true,
        title: const Text(
          'Add Alarm',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: CupertinoDatePicker(
              showDayOfWeek: true,
              minimumDate: DateTime.now(),
              dateOrder: DatePickerDateOrder.dmy,
              onDateTimeChanged: (va) {
                dateTime = DateFormat().add_jms().format(va);

                notificationtime=va;

                print(dateTime);
              },
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: CupertinoTextField(
                  placeholder: "Add Label",
                  controller: controller,
                )),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(" Repeat daily"),
              ),
              CupertinoSwitch(
                value: repeat,
                onChanged: (bool value) {
                  repeat = value;

                  if (repeat == false) {
                    name = "none";
                  } else {
                    name = "Everyday";
                  }

                  setState(() {});
                },
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                context
                    .read<alarmprovider>()
                    .SetAlaram(controller.text, dateTime!, true, name!);
                context.read<alarmprovider>().SetData();


               context.read<alarmprovider>().SecduleNotification(notificationtime!);



                Navigator.pop(context);
              },
              child: Text("Set Alaram")),
        ],
      ),
    );
  }
}
