import 'package:flutter/material.dart';

enum StateRendererType {
  // full screen state:
  fullLoadingScreenState,
  fullErrorScreenState,
  fullEmptyScreenState,

  // popup state:
  popupErrorDialogState,
  popupLoadingDialogState,

  // content state:
  contentState
}

class StateRenderer extends StatelessWidget {
  String message;
  String title;
  Function action;
  StateRendererType stateRendererType;

  StateRenderer(
      {Key? key,
      this.message = "loading",
      this.title = "",
      required this.action,
      required this.stateRendererType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getStateWidget();
  }

  Widget _getStateWidget() {
    switch (stateRendererType) {
      case StateRendererType.fullLoadingScreenState:
        return _getFullScreenWidget([const Center(child: CircularProgressIndicator())]);
      case StateRendererType.fullErrorScreenState:
        return _getFullScreenWidget([]);
      case StateRendererType.fullEmptyScreenState:
        return _getFullScreenWidget([]);
      case StateRendererType.popupErrorDialogState:
        return _getPopupDialog([]);
      case StateRendererType.popupLoadingDialogState:
        return _getPopupDialog([]);
      case StateRendererType.contentState:
        return Container();
      default:
        return Container();
    }
  }

  Widget _getFullScreenWidget(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  Widget _getPopupDialog(List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white70,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(color: Colors.black26)]),
        child: _getPopupContentScreenState(children),
      ),
    );
  }

  Widget _getPopupContentScreenState(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
