part of z_ui_plus;

class ZCheckBox extends StatelessWidget {
  final Function onChanged;
  final bool initialSelected;
  final Image asset;
  final bool? disabled;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? boxRadius;

  ZCheckBox(
      {Key? key,
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

  final StreamController<bool> _streamController = StreamController<bool>.broadcast();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double widthSize = size.width;
    double heightSize = size.height;
    return StreamBuilder<bool>(
        initialData: initialSelected,
        stream: _streamController.stream.asBroadcastStream(),
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              bool isDisabled = disabled ?? false;
              if (!isDisabled) {
                _streamController.sink.add(!snapshot.data!);
                onChanged(!snapshot.data!);
              }
            },
            child: AnimatedContainer(
              width: width ?? widthSize * 0.1,
              height: height ?? widthSize * 0.1,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color:
                    backgroundColor ?? StyleKeys.paleBlueColor.withOpacity(0.2),
                border: Border.all(
                    color: borderColor ?? StyleKeys.paleBlueColor,
                    width: 1,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    boxRadius ?? 10,
                  ),
                ),
              ),
              duration: const Duration(milliseconds: 1),
              // Provide an optional curve to make the animation feel smoother.
              curve: Curves.linear,
              child: snapshot.data! ? asset : null,
            ),
          );
        });
  }
}
