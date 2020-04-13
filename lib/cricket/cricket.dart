import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobxdemo/cricket/cricket_store.dart';
import 'package:mobxdemo/cricket/cricketrepository.dart';
import 'package:mobxdemo/models/cricket.dart';
import 'package:provider/provider.dart';

class HomeCricket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => CricketStore(FakeCrickerRepository()),
      child: Cricket(),
    );
  }
}

class Cricket extends StatefulWidget {
  @override
  _CricketState createState() => _CricketState();
}

class _CricketState extends State<Cricket> {
  CricketStore _cricketStore;
  List<ReactionDisposer> _disposers;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("did change");
    _cricketStore ??= Provider.of<CricketStore>(context);
    _disposers ??= [
      reaction(
        (_) => _cricketStore.errorMessage,
        (String message) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
        },
      )
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("MobX"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Observer(
          builder: (_) {
            switch (_cricketStore.status) {
              case StoreStatus.initial:
                return initialState();
              case StoreStatus.loading:
                return loadingState();
              case StoreStatus.loaded:
                return loadedState(_cricketStore.cricketer);
            }
            return loadingState();
          },
        ),
      ),
    );
  }

  Widget initialState() {
    return Center(
      child: EnterCrickerName(),
    );
  }

  Widget loadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget loadedState(Cricketer _cricketerdata) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _cricketerdata?.average?.toString() ?? "hello",
          style: TextStyle(fontSize: 50, color: Colors.black),
        ),
        EnterCrickerName()
      ],
    );
  }
}

class EnterCrickerName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: TextField(
        textInputAction: TextInputAction.search,
        onSubmitted: (String name) => onsubmitname(context, name),
        decoration: InputDecoration(
          hintText: "Enter Cricketer Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void onsubmitname(BuildContext context, String name) {
    CricketStore _cricketerStore = Provider.of<CricketStore>(context);
    _cricketerStore.getCricketerScore(name);
    print("on submit call $name");
  }
}
