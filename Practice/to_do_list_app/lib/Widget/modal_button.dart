import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Item/data_item.dart';

class ModalButton extends StatelessWidget {
  final Function addTask;
  ModalButton({
    super.key,
    required this.addTask,
  });
  String textValue = '';


  void handleAddTask(BuildContext context) {
    if(textValue.isEmpty) {
      return;
    }
    addTask(textValue);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  textValue = value;

                },
                decoration: const InputDecoration(

                  labelText: 'Input task',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Màu sắc của đường viền
                  ),
                  ),

                ),

              const SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                      handleAddTask(context);

                    },
                  child: const Text(
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                      ),
                      'Add task'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
