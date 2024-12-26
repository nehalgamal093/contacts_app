import 'dart:io';
import 'package:contacts_app/home_screen/widgets/toast.dart';
import 'package:contacts_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../../data/contacts_list.dart';
import '../../models/contact.dart';
import 'input_text.dart';
import 'main_input_text.dart';

Future bottomSheet(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController phoneController,
    Function() fn) {

  XFile? imageFile;
  File? image;
  final ImagePicker picker = ImagePicker();

  void pickImage(setState) async {
    imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        image = File(imageFile!.path);
      });
    }
  }

  bool isFieldsNotEmpty() {
    return (image != null &&
        nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty);
  }

  void addContact() {
    contacts.add(Contact(
        image: image!,
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text));
  }

  void clearForm() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    imageFile = null;
  }

  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) {
        return SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.65,
            color: MyTheme.primaryColor,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: StatefulBuilder(builder: (context, setState) {
                    return Row(
                      children: [
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 487 / 487,
                            child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    image: imageFile != null
                                        ? DecorationImage(
                                            image: FileImage(image!),
                                            fit: BoxFit.cover)
                                        : null,
                                    borderRadius: BorderRadius.circular(28),
                                    border: Border.all(
                                        color: MyTheme.secondaryColor)),
                                child: InkWell(
                                  onTap: () {
                                    pickImage(setState);
                                  },
                                  child: imageFile == null
                                      ? Lottie.asset(
                                          'assets/images/animation/image_picker.json')
                                      : null,
                                )),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InputText(
                                hintText: 'User Name',
                                controller: nameController,
                              ),
                               Divider(
                                color: MyTheme.secondaryColor,
                                endIndent: 3,
                                indent: 3,
                              ),
                              InputText(
                                hintText: 'example@email.com',
                                controller: emailController,
                              ),
                               Divider(
                                color:MyTheme.secondaryColor,
                                endIndent: 3,
                                indent: 3,
                              ),
                              InputText(
                                hintText: '+200000000000',
                                controller: phoneController,
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
                ),
                Expanded(
                  child: Column(
                    children: [
                      MainInputText(
                        type: TextInputType.name,
                        controller: nameController,
                        hintText: 'Enter User Name',
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      MainInputText(
                        type: TextInputType.emailAddress,
                        controller: emailController,
                        hintText: 'Enter User Email',
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      MainInputText(
                        type: TextInputType.phone,
                        controller: phoneController,
                        hintText: 'Enter User Phone',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (!isFieldsNotEmpty()) {
                            toast();
                          } else {
                            addContact();
                            clearForm();
                            fn();

                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          backgroundColor:MyTheme.secondaryColor,
                        ),
                        child:  Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Enter User',
                            style: Theme.of(context).textTheme.displayMedium),
                          ),
                        ),

                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}
