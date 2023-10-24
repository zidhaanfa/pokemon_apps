import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ZFSelectedDate extends StatefulWidget {
  ZFSelectedDate({
    Key? key,
    required this.onTap,
    required this.selectedDate,
    required this.hasilDate,
    required this.tanggalController,
  }) : super(key: key);
  Function() onTap;
  String selectedDate;
  TextEditingController hasilDate;
  TextEditingController tanggalController;

  @override
  State<ZFSelectedDate> createState() => _ZFSelectedDateState();
}

class _ZFSelectedDateState extends State<ZFSelectedDate> {
  late Function() onTap;
  late String selectedDate;
  late TextEditingController hasilDate;
  late TextEditingController tanggalController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onTap = widget.onTap;
    selectedDate = widget.selectedDate;
    hasilDate = widget.hasilDate;
    tanggalController = widget.tanggalController;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        cursorColor: Colors.transparent,
        cursorHeight: 0,
        cursorWidth: 0,
        onTap: () {
          widget.onTap();
          setState(() {
            final yourText = widget.selectedDate;
            widget.hasilDate.value = widget.hasilDate.value.copyWith(
              text: widget.hasilDate.text + yourText,
              selection: TextSelection.collapsed(
                offset: widget.hasilDate.value.selection.baseOffset +
                    yourText.length,
              ),
            );
            // prefs!.setString("tanggalController",
            //     '${controller.selectedDate.day}/${controller.selectedDate.month}/${controller.selectedDate.year}');
          });
        },
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        controller: widget.tanggalController..text = widget.selectedDate,
        keyboardType: TextInputType.datetime,
        textInputAction: TextInputAction.none,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          ),
          fillColor: Colors.grey.shade100,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          hintText: widget.selectedDate,
          // labelText: widget.selectedDate,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          ),
          prefixIcon: IconButton(
            onPressed: () {
              widget.onTap();
              setState(() {
                final yourText = widget.selectedDate;
                widget.hasilDate.value = widget.hasilDate.value.copyWith(
                  text: widget.hasilDate.text + yourText,
                  selection: TextSelection.collapsed(
                    offset: widget.hasilDate.value.selection.baseOffset +
                        yourText.length,
                  ),
                );
                // prefs!.setString("tanggalController",
                //     '${controller.selectedDate.day}/${controller.selectedDate.month}/${controller.selectedDate.year}');
              });
            },
            icon: const Icon(
              CupertinoIcons.calendar_badge_plus,
              color: Color.fromARGB(255, 175, 0, 0),
            ),
          ),
        ),
      ),
    );
  }
}
