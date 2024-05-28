import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../staterenderer/state_renderer_impl.dart';



abstract class BaseViewModel implements BaseViewModelInputs, BaseViewModelOutputs{
  StreamController<FlowState> streamController=BehaviorSubject<FlowState>();

  @override
  void dispose() {
    streamController.close();
  }

  @override
  // TODO: implement input
  Sink get input => streamController.sink;

  @override
  // TODO: implement output
  Stream<FlowState> get output => streamController.stream.map((flowState) => flowState);

}

abstract class BaseViewModelInputs{

  Sink get input;

  void start();

  void dispose();
}


abstract class BaseViewModelOutputs{

  Stream<FlowState> get output;

}

