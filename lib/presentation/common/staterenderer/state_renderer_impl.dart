import 'package:admin_panel_unsilent/presentation/common/staterenderer/state_renderer.dart';
import 'package:flutter/material.dart';

import '../../../app/constants.dart';

abstract class FlowState {
  StateRendererType getStateType();

  String getMessage();
}

class LoadingState extends FlowState {
  StateRendererType type;
  String? message;

  LoadingState({required this.type ,String this.message="loading"});

  @override
  String getMessage() => message ?? "loading";

  @override
  StateRendererType getStateType() => type;
}

class ErrorState extends FlowState {
  String message;
  StateRendererType type;

  ErrorState(this.message, this.type);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateType() => type;
}

class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateType() => StateRendererType.fullEmptyScreenState;
}

class ContentState extends FlowState {
  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateType() => StateRendererType.contentState;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(
      BuildContext context, Function action, Widget contentScreenWidget) {
    switch (runtimeType) {
      case LoadingState:

        if (getStateType() == StateRendererType.popupLoadingDialogState) {
          _showPopup(context, action, getStateType(), getMessage());
          return contentScreenWidget;
        } else {
          return StateRenderer(
            action: action,
            stateRendererType: StateRendererType.fullLoadingScreenState,
            message: getMessage(),
          );
        }
      case ErrorState:
        dismissDialog(context);
        if (getStateType() == StateRendererType.popupErrorDialogState) {
          _showPopup(context, action, getStateType(), getMessage());
          return contentScreenWidget;
        } else {
          return StateRenderer(
            action: action,
            stateRendererType: StateRendererType.fullErrorScreenState,
            message: getMessage(),
          );
        }
      case EmptyState:
        return StateRenderer(
          action: action,
          stateRendererType: StateRendererType.fullEmptyScreenState,
        );
      case ContentState:
        dismissDialog(context);
        return contentScreenWidget;
      default:
        dismissDialog(context);
        return contentScreenWidget;
    }
  }

  dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;


  _showPopup(BuildContext context, Function action, StateRendererType type,
      String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return StateRenderer(
              action: action, stateRendererType: type, message: message);
        }));
  }
}
