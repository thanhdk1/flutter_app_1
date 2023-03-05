import 'package:pvoil_station/common/core/sys/api_response.dart';
import 'package:pvoil_station/common/core/sys/base_controller.dart';
import 'package:pvoil_station/common/core/widget/dialog/app_dialog_comp.dart';
import 'package:pvoil_station/common/helper/app_common.dart';
import 'package:pvoil_station/common/local_auth/LocalAuth.dart';
import 'package:pvoil_station/common/local_storage/local_storage.dart';
import 'package:pvoil_station/common/page_manager/route_path.dart';
import 'package:pvoil_station/common/resource/keylanguage_resource/key_language.dart';
import 'package:pvoil_station/common/resource/keylanguage_resource/localization_service.dart';
import 'package:pvoil_station/data/model/account/account_model.dart';
import 'package:pvoil_station/data/model/login/login_model.dart';
import 'package:pvoil_station/data/repositories_impl/login/login_repository_impl.dart';
import 'package:pvoil_station/domain/use_case/login/post_login_phone_use_case.dart';
import 'package:pvoil_station/common/resource/enum_resource.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends BaseController implements LocalAuthListener {
  TextEditingController phoneEdtController =
      TextEditingController(text: kDebugMode ? '0123456789' : null);
  TextEditingController pwdController =
      TextEditingController(text: kDebugMode ? '123456' : null);

  Rx<bool> isAuth = false.obs;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<PopupMenuButtonState> popupMenu =
      GlobalKey<PopupMenuButtonState>();
  List<String> languageList = [];
  RxBool showLanguage = false.obs;
  RxString currentArena = CountryCode.VN_CODE.obs;

  @override
  Future<void> initialData() {
    languageList.addAll([
      KeyLanguage.language_vi.tr,
      KeyLanguage.language_en.tr,
    ]);
    // LocalStorage().delete(StorageKey.ACCOUNT);
    String languageCode = LocalStorage().get<String>(StorageKey.LANGUAGE);
    showLanguage.value = languageCode == LanguageCodeConstant.VI;
    // LocalStorage().clearAll();
    getAccountLocal();
    setStatus(Status.success);
    return super.initialData();
  }

  localAuth() {
    LocalAuth().checkLocalAuth(this, KeyLanguage.localAuthNotAvailable.tr);
  }

  @override
  authenticated(authenticated) {
    throw UnimplementedError();
  }

  String? validatePhone(int index) {
    switch (index) {
      case 0:
        String pattern = r'(^(?:[0])?[0-9]{9,12}$)';
        RegExp regExp = RegExp(pattern);
        if (phoneEdtController.text.isEmpty) {
          return KeyLanguage.cannot_blank.tr;
        } else if (!regExp.hasMatch(phoneEdtController.text)) {
          return KeyLanguage.notPhone.tr;
        }
        break;
      case 1:
        if (pwdController.text.isEmpty) {
          return KeyLanguage.cannot_blank.tr;
        } else if (pwdController.text.length < 6) {
          return KeyLanguage.lessSix.tr;
        }
    }
    return null;
  }

  Future<void> loginCall() async {
    setStatus(Status.waiting);
    await delay(1000);
    setStatus(Status.success);
    Get.offAllNamed(RoutePath.HOME);
    
    // LoginModelRequest loginModelRequest = LoginModelRequest(
    //     phoneNumber: phoneEdtController.text, password: pwdController.text);
    // ApiResponse<LoginModelResponse?> response = await PostLoginPhoneUseCase(
    //         repository: LoginRepositoryImpl(),
    //         loginModelRequest: loginModelRequest)
    //     .invoke();
    // if (response.data != null) {
    //   AccountLocal account = AccountLocal(
    //     phoneNumber: phoneEdtController.text,
    //     ownerId: response.data?.ownerId,
    //     password: pwdController.text,
    //     token: response.data?.token,
    //   );
    //   saveAccount(account);
    //   setStatus(Status.success);
    // } else {
    //   Get.dialog(
    //     AppDialogComp(
    //       content: KeyLanguage.password_not_mach.tr,
    //       onConfirm: () => {Get.back()},
    //       showCancel: false,
    //     ),
    //   );
    //   return;
    // }
  }

  void onChangeLanguage() {
    showLanguage.value = !showLanguage.value;
    LocalizationService.changeLocale(
        showLanguage.value ? LanguageCodeConstant.VI : LanguageCodeConstant.EN);
  }

  void onArenaPressed() {
    popupMenu.currentState?.showButtonMenu();
  }

  void onMenuSelected(value) {
    if (value == ArenaCode.VIETNAM) currentArena.value = CountryCode.VN_CODE;
    if (value == ArenaCode.UK) currentArena.value = CountryCode.UK_CODE;
    if (value == ArenaCode.US) currentArena.value = CountryCode.US_CODE;
  }

  void saveAccount(AccountLocal account) {
    LocalStorage().put(StorageKey.ACCOUNT, account);
  }

  void getAccountLocal() {
    AccountLocal account = AccountLocal();
    if (LocalStorage().isExist(StorageKey.ACCOUNT)) {
      dynamic accountString =
          LocalStorage().get<AccountLocal>(StorageKey.ACCOUNT);
      account = AccountLocal.fromJson(accountString);
    }
    phoneEdtController.text = account.phoneNumber ?? "";
    pwdController.text = account.password ?? "";
    // return account;
  }
}

class PhoneLocation {
  String? value;
  String? img;
  String? name;

  PhoneLocation({this.value, this.img, this.name});
}
