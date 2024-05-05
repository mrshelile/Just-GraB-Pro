import 'package:flutter/material.dart';
import 'package:justgrab_pro/application/auth/auth.dart';
import 'package:justgrab_pro/theme/colors.dart';

class ClientBlockList extends StatefulWidget {
  const ClientBlockList({super.key});

  @override
  State<ClientBlockList> createState() => _ClientBlockListState();
}

class _ClientBlockListState extends State<ClientBlockList> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).copyWith().size;
    return StreamBuilder(
        stream: Auth().firestore.collection("users").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError || !snapshot.hasData) {
            return const SizedBox();
          }
          List data = snapshot.data!.docs;
          List data1 = data.where((element) {
            return !element.data()['allowed'];
          }).toList();
          // print(data1);
          return ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
              scrollDirection: Axis.vertical,
              itemCount: data1.length,
              itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 216, 221, 219),
                            offset: Offset(
                              5,
                              5.0,
                            ),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: ListTile(
                      trailing: IconButton(
                          onPressed: () async {
                            await Auth().unblockClient(
                                email: data1[index].data()['email']);
                          },
                          icon: Icon(
                            Icons.add,
                            color: brown1,
                          )),
                      leading: Image.asset(
                        "assets/imag1.png",
                        height: size.height * 0.05,
                      ),
                      title: Text(data1[index].data()['full_name']),
                      subtitle: Text(
                        "(+266) ${data1[index].data()['phone_number']}",
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                  ));
        });
  }
}
