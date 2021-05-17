part of registration_view;

class _PhoneNumberField extends StatelessWidget {
  const _PhoneNumberField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.phone,
            color: Colors.grey,
          ),
          hintText: "phone number"),
    );
  }
}
