import 'package:an_najah_project/core/view_models/profileVM.dart';
import 'package:an_najah_project/helpers/storage_helper.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/botton_screen.dart';
import '../widget/imge_profile.dart';
import '../widget/text_form_screen.dart';
import 'package:bottom_picker/bottom_picker.dart';
// import 'package:intl/intl.dart';

class EdtProfileScreen extends StatelessWidget {
  EdtProfileScreen({super.key});

  GlobalKey<FormState> _frmKey = GlobalKey();

//--------helper space-------
  StorageHelper storageHelper = StorageHelper.instance;

  //------end helper space
  ProfileVM profileVM = ProfileVM();

  // DateFormat formatter = DateFormat.yMMMM('ar');
  final TextEditingController nameArabicController = TextEditingController();
  final TextEditingController nameEnglishController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController academicQualtifController =
      TextEditingController();
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  String? birthday;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromARGB(255, 159, 154, 208),
        child: SingleChildScrollView(
          child: Form(
            key: _frmKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                imgeProfile(),
                Text(
                  'الصورة الشخصية',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                TextFormScreen(
                  backcolor: Colors.white,
                  lable: 'الاسم بالعربي',
                  controller: nameArabicController,
                  keyboardType: TextInputType.name,
                  validateInput: (value) {
                    // if (value!.isEmpty) {
                    //   return 'يرجى ملئ هذا الحقل';
                    // } else if (value.split(' ').length <= 3)
                    //   return 'ادخل اسمك رباعياً';
                    return null;
                  },
                ),
                TextFormScreen(
                    backcolor: Colors.white,
                    lable: 'الاسم بالانجليزي',
                    controller: nameEnglishController,
                    keyboardType: TextInputType.name,
                    validateInput: (value) {
                      // if (value!.isEmpty) {
                      //   return 'يرجى ملئ هذا الحقل';
                      // } else if (!RegExp(r"^[a-zA-Z]+").hasMatch(value!)) {
                      //   return 'ادخل اسمك باللغة الانجليزية';
                      // }
                      return null;
                    }),
                TextFormScreen(
                    backcolor: Colors.white,
                    lable: 'الدولة',
                    controller: countryController,
                    keyboardType: TextInputType.text,
                    validateInput: (value) {
                      // if (value!.isEmpty) {
                      //   return 'يرجى ملئ هذا الحقل';
                      // }
                      return null;
                    }),
                TextFormScreen(
                    backcolor: Colors.white,
                    lable: 'رقم الهاتف',
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validateInput: (value) {
                      // if (value!.isEmpty) {
                      //   return 'يرجى ملئ هذا الحقل';
                      // }
                      return null;
                    }),
                TextFormScreen(
                    backcolor: Colors.white,
                    lable: 'العنوان',
                    controller: addressController,
                    keyboardType: TextInputType.text,
                    validateInput: (value) {
                      // if (value!.isEmpty) {
                      //   return 'يرجى ملئ هذا الحقل';
                      // }
                      return null;
                    }),
                TextFormScreen(
                    backcolor: Colors.white,
                    lable: 'المؤهل العلمي',
                    controller: degreeController,
                    keyboardType: TextInputType.text,
                    validateInput: (value) {
                      // if (value!.isEmpty) {
                      //   return 'يرجى ملئ هذا الحقل';
                      // }
                      return null;
                    }),
/*             Container(
               width: double.infinity,

               margin: const EdgeInsets.symmetric(horizontal: 10),
               child: Text('lable' , style: TextStyle(fontFamily: "shahdFont" , fontSize: 16)))*/
                InkWell(
                  onTap: () async {
                    _openDatePickerWithButtonStyle(context);
                  },
                  child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                'تاريخ الميلاد',
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.start,
                                textDirection: TextDirection.rtl,
                              )),
                          Container(
                              width: double.infinity,
                              height: 55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    size: 40,
                                    color: Color.fromARGB(255, 76, 72, 108),
                                  ),
                                  Container(
                                      child: birthday == null
                                          ? Text('')
                                          : Text('$birthday',
                                              style: TextStyle(
                                                  fontFamily: "shahdFont",
                                                  fontSize: 16))),
                                ],
                              )),
                        ],
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                BottonScreen(
                  text: "حفظ",
                  methd: () async{
                    if (_frmKey.currentState!.validate() == true) {
                     await profileVM.updateUserProfileAPI(
                        token: storageHelper.readKey('token'),
                        address: addressController.text,
                        arabicName: nameArabicController.text,
                        englishName: nameEnglishController.text,
                        phoneNumber: phoneController.text,
                        profilePicture: null,
                         academicQualtif:  academicQualtifController.text

                      );
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void _openDatePickerWithButtonStyle(BuildContext context) {
    BottomPicker.date(
      pickerTitle: Text(
        'اختر تاريخ ميلادك',
        style: TextStyle(
          fontFamily: "shorog",
          fontWeight: FontWeight.normal,
          fontSize: 23,
          color: Colors.blue,
        ),
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
      dateOrder: DatePickerDateOrder.dmy,
      pickerTextStyle: TextStyle(
        fontFamily: "cairo.ttf",
        color: Color.fromARGB(255, 129, 128, 182),
        fontWeight: FontWeight.bold,
        fontSize: 19,
      ),
      onChange: (index) {
        print(index);
      },
      onSubmit: (index) {
        print(index);
        birthday = index.toString();
        birthdayController.text = birthday!;
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
      buttonStyle: BoxDecoration(
        color: Color.fromARGB(255, 129, 128, 182),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color.fromARGB(63, 187, 173, 255)!,
        ),
      ),
      buttonWidth: 150,
      buttonContent: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Center(
          child: Text(
            'Select date',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ).show(context);
  }
}
