part of authentication_view;

class _PinAutoField extends StatelessWidget {
  const _PinAutoField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Theme(
        data: ThemeData(
          inputDecorationTheme:
              InputDecorationTheme(fillColor: Theme.of(context).canvasColor),
        ),
        child: PinFieldAutoFill(
          codeLength: 6,
          decoration: BoxLooseDecoration(
            bgColorBuilder: FixedColorBuilder(Colors.grey[300]!),
            strokeColorBuilder: FixedColorBuilder(Colors.grey[300]!),
            gapSpace: 10,
          ),
        ),
      ),
    );
  }
}
