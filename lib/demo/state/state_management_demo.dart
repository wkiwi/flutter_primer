import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

// class StateMangementDemo extends StatefulWidget {
//   @override
//   _StateMangementDemoState createState() => _StateMangementDemoState();
// }

// class _StateMangementDemoState extends State<StateMangementDemo> {
//   int _count = 0;

//   void _increaseCount(){
//     setState(() {
//       _count ++;
//     });
//     print(_count);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CounterProvider(
//       count: _count,
//       increaseCount: _increaseCount,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('StateMangementDemo'),
//           elevation: 0.0,
//         ),
//         body: CounterWrapper(),//CounterWrapper(_count,_increaseCount),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: _increaseCount,
//         ),
//       ),
//     );
//   }
// }

// class CounterWrapper extends StatelessWidget {
//   // final int count;
//   // final VoidCallback increaseCount;

//   // CounterWrapper(this.count,this.increaseCount);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Counter()//Counter(count, increaseCount),
//     );
//   }
// }

// class Counter extends StatelessWidget {
//   // final int count =;
//   // final VoidCallback increaseCount;

//   //Counter(this.count,this.increaseCount);
//   @override
//   Widget build(BuildContext context) {
//     final int count = CounterProvider.of(context).count;
//     final VoidCallback increaseCount =CounterProvider.of(context).increaseCount;
//     return ActionChip(
//         label: Text('$count'),
//         onPressed: increaseCount,
//       );
//   }
// }

// class CounterProvider extends InheritedWidget{
//   final int count;
//   final VoidCallback increaseCount;
//   final Widget child;

//   CounterProvider({
//     this.count,
//     this.increaseCount,
//     this.child
//   }) :super(child:child);

//   static CounterProvider of(BuildContext context) =>
//   context.inheritFromWidgetOfExactType(CounterProvider);

//   @override
//   bool updateShouldNotify(InheritedWidget oldWidget){
//     return true;
//   }
// }

class StateMangementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateMangementDemo'),
          elevation: 0.0,
        ),
        body: CounterWrapper(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange:  false,
          builder: (context, _, model) =>FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.increaseCount,
          ),
        ),
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter()
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) =>ActionChip(
        label: Text('${model.count}'),
        onPressed: model.increaseCount,
      ),
    );
  }
}

class CounterProvider extends InheritedWidget{
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({
    this.count,
    this.increaseCount,
    this.child
  }) :super(child:child);

  static CounterProvider of(BuildContext context) =>
  context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget){
    return true;
  }
}
class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void increaseCount() {
    _count += 1;
    notifyListeners();
  }
}