import 'package:flutter/material.dart';
import 'package:sippylife_assesment/core/extensions/sizing.dart';
import 'package:sippylife_assesment/core/theme/colors.dart';

typedef CloseFnc<K> = K? Function(K? value);
typedef KWidgetBuilder<K> = Widget Function(CloseFnc<K> close);

enum SheetType { bottom, modal, }

class Sheet<K> {
  BuildContext context;
  Sheet(this.context);

  showSheet(
    Widget Function(BuildContext context) builder, {
    bool wrap = true,
    bool showHandle = true,
    double? padding,
    EdgeInsetsGeometry? bodyPadding,
    bool dismissible = true,
    bool useRootNavigator = false,
    SheetStyle style = SheetStyle.plain,
    Color bgColor = AppColors.white,
    BorderRadius? borderRadius,
    String? title,
  }) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: dismissible,
      useRootNavigator: useRootNavigator,
      context: context,
      builder:
          (context) => Wrap(
            children: [
              wrap
                  ? Padding(
                    padding: bodyPadding ?? const EdgeInsets.all(0),
                    child: () {
                      if (style == SheetStyle.red) {
                        return RedSheet(
                          showHandle: showHandle,
                          child: builder(context),
                        );
                      } else if (style == SheetStyle.blue) {
                        return BlueSheet(
                          transparent: false,
                          showHandle: showHandle,
                          child: builder(context),
                        );
                      } else if (style == SheetStyle.red) {
                        return RedSheet(
                          transparent: false,
                          showHandle: showHandle,
                          child: builder(context),
                        );
                      }
                    }(),
                  )
                  : builder(context),
            ],
          ),
      enableDrag: true,
    );
  }
}

enum SheetStyle { plain, blue, red }

class BlueSheet extends StatelessWidget {
  final Widget child;
  final bool transparent;
  final bool showHandle;

  const BlueSheet({
    super.key,
    required this.child,
    this.transparent = true,
    this.showHandle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xCC0E1930),
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (showHandle)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  15.ht,
                ],
              ),
            ),
          child,
        ],
      ),
    );
  }
}

class RedSheet extends StatelessWidget {
  final Widget child;
  final bool transparent;
  final bool showHandle;

  const RedSheet({
    super.key,
    required this.child,
    this.transparent = true,
    this.showHandle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      decoration: BoxDecoration(
        color: Color(0xffAF0000),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [child],
      ),
    );
  }
}
