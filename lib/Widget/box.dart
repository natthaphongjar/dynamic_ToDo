import 'package:flutter/material.dart';
import 'package:untitled/Boxdetail.dart';
class Box extends StatelessWidget {
  final Box_detail bl;
  final toggle;
  final delete;
  const Box({Key? key,required this.bl , required this.toggle , required this.delete}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            children: [
              Checkbox(
                  value: bl.status,
                  onChanged: (bool? value) {
                    toggle(bl);
                }),
              Expanded(

                child: Text(
                  '${bl.Text}',
                  style: TextStyle(
                      decoration: bl.status ? TextDecoration.lineThrough : TextDecoration.none),
                ),
              ),
              InkWell(
                  onTap: () {
                    delete(bl.id);
                },
                  child: Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ))
            ],
          ),
        ),
      );

  }
}
