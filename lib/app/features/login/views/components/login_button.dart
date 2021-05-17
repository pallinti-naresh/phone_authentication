part of login_view;

class _LoginButton extends GetView<LoginController> {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => controller.goToAuthenticationScreen(),
        child: Text("Login"));
  }
}
