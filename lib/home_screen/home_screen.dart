import 'package:contacts_app/data/contacts_list.dart';
import 'package:contacts_app/home_screen/list_empty_screen.dart';
import 'package:contacts_app/home_screen/widgets/bottom_sheet.dart';
import 'package:contacts_app/home_screen/widgets/list_item_widget.dart';
import 'package:contacts_app/theme/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: double.infinity,
          color: MyTheme.primaryColor,
          padding: const EdgeInsets.all(16),
          child: contacts.isEmpty
              ? const EmptyListScreen()
              : Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        'assets/images/route_1.png',
                        width: size.width*.25,
                      ),
                    ),
                    const SizedBox(height: 27),
                    Expanded(
                      child: GridView.builder(
                          itemCount: contacts.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 4 / 7,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, i) {
                            return ListItemWidget(
                              contact: contacts[i],
                              function: () {
                                contacts.removeAt(i);
                                setState(() {});
                              },
                            );
                          }),
                    ),
                  ],
                ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            contacts.isNotEmpty
                ? FloatingActionButton(
                    backgroundColor: MyTheme.redClr,
                    onPressed: () {
                      contacts.removeLast();
                      setState(() {});
                    },
                    child:
                        Icon(Icons.delete, color: MyTheme.whiteClr, size: 20),
                  )
                : const SizedBox(),
            const SizedBox(height: 8),
            contacts.length != 6
                ? FloatingActionButton(
                    backgroundColor: MyTheme.secondaryColor,
                    onPressed: () {
                      bottomSheet(context, nameController, emailController,
                          phoneController, () {
                        setState(() {});
                      });
                    },
                    child: ImageIcon(
                      const AssetImage('assets/images/plus.png'),
                      color: MyTheme.primaryColor,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
