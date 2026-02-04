import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vasture/presentation/utils/state/loading_state.dart';

import 'loading_widget.dart';

/// NOTE use it to prevent mistaken tap while the app is connecting with server
class LoadingOverlay extends HookConsumerWidget {
  const LoadingOverlay({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loadingStateNotifierProvider);

    return Stack(
      children: [
        child,
        if (state)
          Visibility(
            visible: state,
            child: ColoredBox(
              color: Colors.black.withValues(alpha: 0.5),
              child: const SizedBox.expand(
                child: LoadingWidget(),
              ),
            ),
          ),
      ],
    );
  }
}
