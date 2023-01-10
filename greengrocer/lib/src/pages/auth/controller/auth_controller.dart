import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/constants/storage_keys.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_repository.dart';
import 'package:greengrocer/src/pages/auth/repository/navigation_service.dart';
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/pages/pages_route/app_pages.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final authRepository = AuthRepository();
  final UtilsServices utils = UtilsServices();
  UserModel user = UserModel();

  @override
  void onInit() {
    super.onInit();

    validateToken();
  }

  void saveTokenAndProceedToBase() async {
    //salva o token
    utils.saveLocalData(key: StorageKeys.token, data: user.token!);

    //entra na aplicação
    Get.offAllNamed(PagesRoutes.baseRoute);
  }

  Future<void> validateToken() async {
    String? token = await utils.getLocalData(key: StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
    } else {
      AuthResult result = await authRepository.validateToken(token);

      result.when(success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      }, error: (message) {
        signOut();
      });
    }
  }

  Future<void> signOut() async {
    //zerar o user
    user = UserModel();

    //remover o token local
    await utils.removeLocalData(key: StorageKeys.token);

    //ir para o login
    Get.offAllNamed(PagesRoutes.signInRoute);
  }

  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;

    AuthResult result =
        await authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(success: (user) {
      this.user = user;

      saveTokenAndProceedToBase();
    }, error: (message) {
      utils.showToast(
          message: message,
          isError: true,
          context: NavigationService.navigatorKey.currentContext);
    });
  }

  Future<void> signUp() async{
    isLoading.value = true;

    AuthResult result = await authRepository.signUp(user);

    result.when(success: (user){
      this.user = user;
      saveTokenAndProceedToBase();
    }, error: (message){
      utils.showToast(
          message: message,
          isError: true,
          context: NavigationService.navigatorKey.currentContext);
    });

    isLoading.value = false;
  }
}
