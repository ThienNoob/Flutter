import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardWidget extends StatelessWidget {
  var item;
  final Function removeTask;
  var index;

  CardWidget({
    required this.item,
    required this.removeTask,
    Key? key,
    required  this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (index % 2 == 0) ? const Color(0xD2DAD4D4) : const Color(0X2525B9D2),
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                //

                fontSize: 20.0,
              ),
            ),
            SizedBox(width: 10.0),
            InkWell(
              onTap: () async {
                if (await confirm(
                  context,
                  title: const Text('Delete Task'),
                  content: const Text('Are you sure to delete this task?'),
                )) {
                  return removeTask(item.id);
                }
                return print('pressedCancel');
              },
              child: Icon(
                Icons.delete_forever_sharp,
                color: Colors.black,
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
