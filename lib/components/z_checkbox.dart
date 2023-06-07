import 'dart:async';

import 'package:flutter/material.dart';
import 'package:z_ui_plus/style/style_keys.dart';

class ZCheckBox extends StatefulWidget {
  final Function onChanged;
  final bool initialSelected;
  final Image asset;
  final bool? disabled;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? boxRadius;

  const ZCheckBox({Key? key,
    required this.onChanged,
    required this.initialSelected,
    required this.asset,
    this.disabled,
    this.height,
    this.width,
    this.backgroundColor,
    this.borderColor,
    this.boxRadius})
      : super(key: key);

  @override
  State<ZCheckBox> createState() => _ZCheckBoxState();
}

class _ZCheckBoxState extends State<ZCheckBox> {
  final StreamController<bool> _streamController = StreamController<bool>.broadcast();

  @override
  void dispose() {
    _streamController.close();
    _streamController.sink.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double widthSize = size.width;
    return StreamBuilder<bool>(
        initialData: widget.initialSelected,
        stream: _streamController.stream.asBroadcastStream(),
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              bool isDisabled = widget.disabled ?? false;
              if (!isDisabled) {
                _streamController.sink.add(!snapshot.data!);
                widget.onChanged(!snapshot.data!);
              }
            },
            child: AnimatedContainer(
              width: widget.width ?? widthSize * 0.1,
              height: widget.height ?? widthSize * 0.1,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color:
                widget.backgroundColor ?? StyleKeys.paleBlueColor.withOpacity(0.2),
                border: Border.all(
                    color: widget.borderColor ?? StyleKeys.paleBlueColor,
                    width: 1,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    widget.boxRadius ?? 10,
                  ),
                ),
              ),
              duration: const Duration(milliseconds: 1),
              // Provide an optional curve to make the animation feel smoother.
              curve: Curves.linear,
              child: snapshot.data! ? widget.asset : null,
            ),
          );
        });
  }


}
