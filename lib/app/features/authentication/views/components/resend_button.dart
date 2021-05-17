part of authentication_view;

class _ResendButton extends StatelessWidget {
  const _ResendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Didn't receive the code ? "),
        TextButton(
          onPressed: () {},
          child: Text("resend (30)"),
        )
      ],
    );
  }
}
