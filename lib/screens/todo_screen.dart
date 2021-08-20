import 'package:flutter/material.dart';
import 'package:todo_test4/helper/db_helper.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
    DBHelper().database.then(
          (value) => {
            print('SQlite database created '),
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'TODO APP',
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.amber,
        ),
        backgroundColor: Colors.amber[100],
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // INSERT NOTES
              FlatButton(
                color: Colors.red,
                onPressed: () {
                  DBHelper().insert({'name': 'alaa'}).then(
                    (value) => {
                      print('SQlite INSERT NOTES $value'),
                    },
                  );
                },
                child: Text(
                  'CREATE NOTES',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // DELETE NOTES
              FlatButton(
                color: Colors.teal,
                onPressed: () {
                  DBHelper().delete(2).then(
                        (value) => {
                          print('SQlite DELETE NOTES $value'),
                        },
                      );
                },
                child: Text(
                  'DELETE NOTES',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // UPDATE NOTES
              FlatButton(
                color: Colors.purple,
                onPressed: () {
                  DBHelper().update('update alaa', 3).then(
                        (value) => {
                          print('SQlite UPDATE NOTES $value'),
                        },
                      );
                },
                child: Text(
                  'UPDATE NOTES',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // READ NOTES
              FlatButton(
                color: Colors.pink[200],
                onPressed: () {
                  DBHelper().getData().then(
                        (value) => {
                          print('SQlite READ NOTES $value'),
                        },
                      );
                },
                child: Text(
                  'READ NOTES',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // GET SINGLE ROW
              FlatButton(
                color: Colors.blue,
                onPressed: () {
                  DBHelper().getSingleRow(3).then(
                        (value) => {
                          print('SQlite GET SINGLE ROW $value'),
                        },
                      );
                },
                child: Text(
                  'GET SINGLE ROW',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // GET Data OrderBy
              FlatButton(
                color: Colors.brown,
                onPressed: () {
                  DBHelper().getDataOrderBy().then(
                        (value) => {
                          print('SQlite OrderBy $value'),
                        },
                      );
                },
                child: Text(
                  'GET Data OrderBy',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // GET Limitation
              FlatButton(
                color: Colors.cyan,
                onPressed: () {
                  DBHelper().getDataLimitation().then(
                        (value) => {
                          print('SQlite Limitation $value'),
                        },
                      );
                },
                child: Text(
                  'GET Limitation',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ],
          ),
        ));
  }
}
