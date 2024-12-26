import 'package:contacts_app/theme/theme.dart';
import 'package:flutter/material.dart';
import '../../models/contact.dart';

class ListItemWidget extends StatelessWidget {
  final Contact contact;
  final Function() function;
  const ListItemWidget(
      {required this.contact, required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color:MyTheme.whiteClr,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: size.height * .3,
                  child: Image.file(
                    contact.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(left: 8, bottom: 8, right: 8),
                    decoration: BoxDecoration(
                      color: MyTheme.whiteClr,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      contact.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: MyTheme.primaryColor, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 17, left: 8, right: 10, bottom: 7),
            child: Column(
              children: [
                Row(
                  children: [
                    ImageIcon(const AssetImage('assets/images/email.png'),
                        size: 20, color: MyTheme.primaryColor),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: size.width * .3,
                      child: Text(
                        contact.email,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ImageIcon(const AssetImage('assets/images/phone.png'),
                        size: 20, color: MyTheme.primaryColor),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: size.width * .3,
                      child: Text(
                        '+02${contact.phone}',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: function,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyTheme.redClr,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Icon(
                        Icons.delete,
                        color: MyTheme.whiteClr,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Delete',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: MyTheme.whiteClr),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
