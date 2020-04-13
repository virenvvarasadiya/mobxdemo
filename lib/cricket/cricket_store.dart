import 'package:mobx/mobx.dart';
import 'package:mobxdemo/cricket/cricketrepository.dart';
import 'package:mobxdemo/models/cricket.dart';

part 'cricket_store.g.dart';

class CricketStore extends _CricketStore with _$CricketStore {
  CricketStore(CricketRepository cricketRepository) : super(cricketRepository);
}

enum StoreStatus { initial, loading, loaded }

abstract class _CricketStore with Store {
  final CricketRepository cricketRepository;
  _CricketStore(this.cricketRepository);

  @observable
  Cricketer cricketer;

  @observable
  String errorMessage;

  @observable
  ObservableFuture<Cricketer> _observableFuture;

  @computed
  StoreStatus get status {
    if (_observableFuture == null ||
        _observableFuture.status == FutureStatus.rejected) {
      return StoreStatus.initial;
    }
    return _observableFuture.status == FutureStatus.pending
        ? StoreStatus.loading
        : StoreStatus.loaded;
  }

  @action
  Future getCricketerScore(String _name) async {
    try {
      errorMessage = null;
      _observableFuture =
          ObservableFuture(cricketRepository.fakeCricketerData(_name));
      cricketer = await _observableFuture;
    } catch (e) {
      errorMessage = "Data is not available";
    }
  }
}
