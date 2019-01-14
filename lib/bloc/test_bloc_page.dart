
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/bloc/BlocProvider.dart';
import 'package:flutter_first_demo/bloc/incrementbloc.dart';


class BlocCounterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<IncrementBloc>(
      child: _Page(),
       bloc: IncrementBloc(),
    );
  }
}

class _Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final IncrementBloc bloc = BlocProvider.of<IncrementBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Stream version of the Counter App')),
      body: Center(
        child: StreamBuilder<int>(  // 监听Stream，每次值改变的时候，更新Text中的内容
            stream: bloc.outCounter,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              return Text('You hit me: ${snapshot.data} times');
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          // 每次点击按钮，更加_counter的值，同时通过Sink将它发送给Stream；
          // 每注入一个值，都会引起StreamBuilder的监听，StreamBuilder重建并刷新counter
          bloc.incrementCounter.add(null);
        },
      ),
    );
  }
}




