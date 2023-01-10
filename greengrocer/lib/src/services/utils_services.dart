import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:greengrocer/src/pages/auth/config/custom_colors.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class UtilsServices {

  final storage = const FlutterSecureStorage();

  //salva dado localmente
  Future<void> saveLocalData({required String key, required String data}) async{

    await storage.write(key: key, value: data);
  }

  Future<String?> getLocalData({required String key}) async {
    return await storage.read(key: key);
  }

  Future<void> removeLocalData({required String key}) async {
    await storage.delete(key: key);
  }

  //String R$
  String priceToCurrency(double price){
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_br');

    return numberFormat.format(price);
  }

  String formatDateTime(DateTime dateTime){
    initializeDateFormatting();

    DateFormat dateFormat = DateFormat.yMd('pt_br').add_Hm();

    return dateFormat.format(dateTime);
  }

  void showToast({required String message, bool isError = false, required context}){
    MotionToast(
      icon: isError ? Icons.info : Icons.check_rounded,
      // title:  Text('Sucesso'),
      primaryColor: isError ? Colors.red : CustomColors.customSwatchColor,
      description:  Text(message),
      layoutOrientation:  ToastOrientation.ltr,
      height: 60,
      animationType:  AnimationType.fromBottom,width:  300,
      animationDuration: const Duration(milliseconds: 100),
      toastDuration: const Duration(milliseconds: 2000),
    ).show(context);
  }


}