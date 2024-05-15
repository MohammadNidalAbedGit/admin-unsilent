import 'dart:async';

import '../../common/base/base_viewmodel.dart';
import '../../common/staterenderer/state_renderer.dart';
import '../../common/staterenderer/state_renderer_impl.dart';

class UsersViewModel extends BaseViewModel
    implements UsersViewModelInput, UsersViewModelOutput {


  @override
  void start() {
    input.add(LoadingState(type: StateRendererType.fullLoadingScreenState));
    Future.delayed(const Duration(seconds: 3), () {
      input.add(ContentState());
    });
  }




}

abstract class UsersViewModelInput{



}

abstract class UsersViewModelOutput{


}