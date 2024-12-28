import 'package:ecoomerce_shop/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //Used to add events in to Bloc
    late final HomeBloc _homeBlocSink;
  

@override
  void dispose() {
   
  super.dispose();

    //Close the Stream Sink when the widget is disposed
    _homeBlocSink.close();
  }

  @override
  Widget build(BuildContext context) {
        _homeBlocSink = BlocProvider.of<HomeBloc>(context);

    return Container(
      child: BlocBuilder<HomeBloc,HomeState>(builder: (context,state){
        return Column(
          children: <Widget>[
            Text('Current State : ${(state as LatestCounterValue).counter}'),
            TextButton(
             
              
                    child: const Text("Increase Counter"),
                    onPressed: (){

                      //Send Decrease Counter EVent to the Bloc
                      _homeBlocSink.add(IncreaseCounterEvent());
                    },
                    
                  ),

                  TextButton(
             
              
                    child: const Text("Increase Counter"),
                    onPressed: (){

                      //Send Decrease Counter EVent to the Bloc
                      _homeBlocSink.add(DecreaseCounterEvent());
                    },
                    
                  ),
          ],
        );
      })

    );
    
    
    }
}
