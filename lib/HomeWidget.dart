import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/MyDrawer.dart';
import 'package:flutter_first_demo/utils/Toast.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeState();
  }
}

class _HomeState extends State<HomeWidget> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('主页'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // 登录用户名
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20.0),
                child: Text(
                  "uName",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "请输入登录名称",
                  ),
                  controller: _userNameController,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),

          // 登录密码
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20.0),
                child: Text(
                  "pwd",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Expanded(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "请输入登录密码",
                  ),
                  controller: _userPwdController,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),

          // 按钮
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: FlatButton(
                  onPressed: _login,
                  highlightColor: Colors.red,
                  child: Text("登录"),
                ),
                margin: EdgeInsets.all(10),
              )
            ],
          ),
        ],
      ),
      drawer: new MyDrawer(),
    );
  }

  _login() {
     String loginName = _userNameController.text;
     String pwd = _userPwdController.text;

    print(">>>>" + loginName);
    print(">>>>" + pwd);

    if(loginName == ""){
      Toast.toast(context, "请输入用户名");
      return;
    }

    if(pwd == ""){
      Toast.toast(context, "请输入密码");
      return;
    }

    if (loginName != "ljt") {
      Toast.toast(context, "用户名不正确");
    } else if (pwd != "123") {
      Toast.toast(context, "密码不正确");
    } else {
      Toast.toast(context, "恭喜你");
    }
  }
}
