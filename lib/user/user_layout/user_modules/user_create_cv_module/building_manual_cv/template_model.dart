import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';

class People {
  String? name;
  String? telephoneNumber;
  String? email;
  String? experience;
  String? skills;
  String? education;

  People(
      {required this.name,
      required this.telephoneNumber,
      required this.email,
      required this.experience,
      required this.skills,
      this.education});

  Widget myText(var text) {
    return Expanded(
      child: Text(
        text,
        style: const TextStyle(fontSize: 20.0),
        maxLines: 2,
        overflow: TextOverflow.clip,
        softWrap: true,
      ),
    );
  }

  getTemplate() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            border: Border.all(width: 2.0, color: Colors.blue)),


        child: SizedBox(
          width: 500,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              textDirection: TextDirection.ltr,
              defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
              children: [
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Name :',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Text(
                        name!,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Telephone Number:',
                      style: TextStyle(color: Colors.black,  fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      telephoneNumber!,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ]),
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Email :',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      email!,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ]),
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Experience :',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      experience!,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ]),
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'skills :',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      skills!,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ]),
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Education :',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          education!,
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ));
  }

  Widget templateRow({required String label, required String labelValue}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Text('$label : ',
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          myText(
            labelValue,
          ),
        ],
      ),
    );
  }
}
