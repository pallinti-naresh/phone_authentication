part of home_view;

class _Profile extends StatelessWidget {
  const _Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("name"),
        subtitle: Text("082118477700"),
      ),
    );
  }
}
