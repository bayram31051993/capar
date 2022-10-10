// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, unnecessary_null_comparison, prefer_if_null_operators

import 'dart:convert';
import 'dart:io';

import 'package:capar/app/data/api/ConfirmSms/confirm_sms.dart';
import 'package:capar/app/data/api/GetInitData/get_init_data.dart';
import 'package:capar/app/data/api/GetSmsCode/get_sms_code.dart';
import 'package:capar/app/data/api/LoginAccessToken/login_access_token.dart';
import 'package:capar/app/data/api/UpdateUsrInfo/update_user_info_request.dart';
import 'package:capar/app/data/models/CabinetMOdel/cabinet_model.dart';
import 'package:capar/app/data/models/CabinetMOdel/custom_cabinet.dart';
import 'package:capar/app/data/models/ConfirmSmsModel/confirm_sms_model.dart';
import 'package:capar/app/data/models/GetSmsCodeModel/get_sms_code_model.dart';
import 'package:capar/app/data/models/InitModel/init_model.dart';
import 'package:capar/app/data/models/LoginAccessTokenModel/login_access_token_model.dart';
import 'package:capar/app/data/models/UpdateUsrInfoModel/update_usr_info_model.dart';
import 'package:capar/app/data/services/storage_provider.dart';
import 'package:capar/app/modules/controllers/home_controller.dart';
import 'package:capar/core/apperience/ui_elements.dart';
import 'package:capar/core/utils/save_user_info.dart';
import 'package:capar/core/values/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/enums.dart';
import '../../../generated/locales.g.dart';
import 'package:http/http.dart' as http;

class InitializerController extends GetxController {
  final storProvider = PrvStorage();
  final isAuth = false.obs;
  final authRequestSending = false.obs;
  final codeRequestSending = false.obs;
  final hidePassword = true.obs;
  final isDark = false.obs;
  final isLoading = false.obs;

  Future<LoginAccessTokenModel>? future_login_access_token_model;
  Future<GetUserSmsCodeModel>? future_get_sms_code_model;
  Future<ConfirmSmsModel>? future_confirm_sms_model;

  LoginAccessTokenModel? login_model;
  GetUserSmsCodeModel? getSmsCodeModel;
  ConfirmSmsModel? confirmSmsModel;
  CabinetModel? cabinetModel;
  LoginAccessTokenPost loginAccessTokenPost = LoginAccessTokenPost();
  GetUserSmsCode getUserSmsCodePost = GetUserSmsCode();
  ConfirmSms confirmSmsPost = ConfirmSms();

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confPass = TextEditingController();
  TextEditingController codeController = TextEditingController();
  final GlobalKey<FormFieldState> _formCode = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();

  UpdateUsrInfoRequest updateUsrInfoRequest = UpdateUsrInfoRequest();
  UpdateUsrInfoModel? updateUsrInfoModel;

  final cabinet = Get.put(HomeController());
  final _getInit = Get.put(InitProvider());
  final initializer = InitModel().obs;
  final loginInitializer = LoginAccessTokenModel().obs;
  final cabinetInitalize = CabinetModel().obs;
  SharedPreferences? sharedPreferences;
  final show_code_field = false.obs;
  final hide_get_code_btn = true.obs;
  var token = "".obs;
  int? sms_id;
  final isAuthCabinet = false.obs;
  enmPaymentType? types;
  SaveUsersInfo saveUsersInfo = SaveUsersInfo();
  Map<String, String> headers = {};
  final coockieSessionId = ''.obs;
  final coockieSessionIds = ''.obs;
  http.Response? response;
  @override
  void onInit() async {
    // checkToken();
    super.onInit();
    // loadInitials();
    // cabinet.getCabinetValue();
    home_loadInitials();
  }

  onError({title, subtitle}) {
    codeRequestSending(false);
    authRequestSending(false);
    DialogHandler.dialogMSG(
      enmDialogType.error,
      title: title,
      subtitle: subtitle,
      onOkAction: () => Get.back(),
    );
  }

  bool get checkToken {
    isAuth.value = token.value.toString() != '';
    return isAuth.value;
  }

  getCodeRequest(context) {
    future_get_sms_code_model = getUserSmsCodePost.loginAccessToke(
      phoneNumber.text
          .toString()
          .replaceAll("+(993) ", "")
          .replaceAll(RegExp("-"), ""),
    );
    show_code_field(true);
    hide_get_code_btn(false);
  }

  sendSmsCode() {
    future_confirm_sms_model = confirmSmsPost.confirmSms(
      codeController.text,
      pass.text,
    );
    Get.back();
  }

  pasVisibilty() {
    if (hidePassword.isTrue) {
      hidePassword(false);
    } else if (hidePassword.isFalse) {
      hidePassword(true);
    }
    print(hidePassword);
  }

  Future<bool> registrationFunction() async {
    authRequestSending(true);
    final result = await loginAccessTokenPost.login_access_token(
        phoneNumber.text
            .toString()
            .replaceAll("+(993) ", "")
            .replaceAll(RegExp("-"), ""),
        pass.text);
    if (result == null) {
      onError();
      return false;
    } else if (result.detail!.msg == "Incorrect user name or password") {
      authRequestSending(false);
      DialogHandler.dialogMSG(enmDialogType.error,
          title: LocaleKeys.error.tr,
          subtitle: LocaleKeys.chUser.tr,
          onOkAction: () => Get.back());
      return false;
    } else {
      authRequestSending(false);
      saveUsersInfo.save(result.detail!.loc![0].csrftoken); // sharedPref save
      PrvStorage()
          .saveValue(enmStorageKeys.token, result.detail!.loc![0].csrftoken);
      token.value = PrvStorage().getStringValue(enmStorageKeys.token);
      Future.delayed(const Duration(seconds: 3)).then((_) {
        loadInitials();
      });

      return true;
    }
  }

  FutureBuilder<GetUserSmsCodeModel>? buildCodeField() {
    return FutureBuilder<GetUserSmsCodeModel>(
      future: future_get_sms_code_model,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          saveUsersInfo.saveSmsId(snapshot.data!.detail.loc[0].smsId);
          // sms_id = snapshot.data!.detail.loc[0].smsId;
          debugPrint("Sms after req: $sms_id");
          return Row(
            children: [
              Expanded(
                child: UIElements.customTextField(
                  key: _formCode,
                  type: enmTextFielType.kod,
                  textController: codeController,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Obx(
                () {
                  if (codeRequestSending.value) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    );
                  }
                  return IconButton(
                    onPressed: () async {
                      getCodeRequest(context);
                      codeController.clear();
                    },
                    icon: Icon(
                      Icons.restart_alt_rounded,
                      size: 35,
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                },
              ),
            ],
          );
        } else if (snapshot.hasError) {
          debugPrint('error ${snapshot.error}');
          onError();
        }
        return const CircularProgressIndicator();
      },
    ); //
  }

  FutureBuilder<ConfirmSmsModel>? buildFutureconfSms() {
    return FutureBuilder<ConfirmSmsModel>(
      future: future_confirm_sms_model,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          debugPrint("Sms id after confirm sen phone: $sms_id");
          return Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (hide_get_code_btn.value) {
                      getCodeRequest(context);
                    } else {
                      sendSmsCode();
                    }
                  }
                },
                child: hide_get_code_btn.value
                    ? Text(LocaleKeys.getCode.tr)
                    : Text(LocaleKeys.signUp.tr),
              ),
            ],
          );
        }
        if (snapshot.hasError) {
          return onError();
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Widget? balanceCommunication(enmPaymetnComunication type) {
    Widget? rez;
    String? val;
    if (initializer.value.detail != null) {
      if (type == enmPaymetnComunication.tmCell) {
        val = initializer.value.detail!.loc![0].mb == null
            ? null
            : initializer.value.detail!.loc![0].mb!.toStringAsFixed(2);
      } else if (type == enmPaymetnComunication.agtsInternet) {
        val = initializer.value.detail!.loc![0].ib == null
            ? null
            : initializer.value.detail!.loc![0].ib!.toStringAsFixed(2);
      } else if (type == enmPaymetnComunication.tmTelekom) {
        val = initializer.value.detail!.loc![0].tb == null
            ? null
            : initializer.value.detail!.loc![0].tb!.toStringAsFixed(2);
      }
    }
  }

  Widget? balanceMedia(enmPaymentMedia type) {
    Widget? rez;
    String? val;
    if (initializer.value.detail != null) {
      if (type == enmPaymentMedia.agtsIpTv) {
        val = initializer.value.detail!.loc![0].ipb == null
            ? null
            : initializer.value.detail!.loc![0].ipb!.toStringAsFixed(2);
      } else if (type == enmPaymentMedia.cabelTV) {
        val = initializer.value.detail!.loc![0].cb == null
            ? null
            : initializer.value.detail!.loc![0].cb;
      }
    }
  }

  Widget? balance(enmPaymentType type) {
    Widget? rez;
    String? val;
    if (initializer.value.detail != null) {
      // if (type == enmPaymentType.tmCell) {
      //   val = initializer.value.detail!.loc![0].mb == null
      //       ? null
      //       : initializer.value.detail!.loc![0].mb!.toStringAsFixed(2);
      // } else if (type == enmPaymentType.agtsInternet) {
      //   val = initializer.value.detail!.loc![0].ib == null
      //       ? null
      //       : initializer.value.detail!.loc![0].ib!.toStringAsFixed(2);
      // } else if (type == enmPaymentType.agtsIpTv) {
      //   val = initializer.value.detail!.loc![0].ipb == null
      //       ? null
      //       : initializer.value.detail!.loc![0].ipb!.toStringAsFixed(2);
      // } else if (type == enmPaymentType.cabelTV) {
      //   val = initializer.value.detail!.loc![0].cb == null
      //       ? null
      //       : initializer.value.detail!.loc![0].cb;
      // } else if (type == enmPaymentType.agtsTelefon) {
      //   val = initializer.value.detail!.loc![0].pb == null
      //       ? null
      //       : initializer.value.detail!.loc![0].pb!.toStringAsFixed(2);
      // } else if (type == enmPaymentType.tmTelekom) {
      //   val = initializer.value.detail!.loc![0].tb == null
      //       ? null
      //       : initializer.value.detail!.loc![0].tb!.toStringAsFixed(2);
      // }
      if (val != null) {
        rez = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${LocaleKeys.balance.tr} ",
              style: Theme.of(Get.context!)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.black87, fontSize: 18.sp),
            ),
            Text(
              '$val ',
              style: Theme.of(Get.context!).textTheme.bodyText1!.copyWith(
                  color: Colors.black87,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              LocaleKeys.manat.tr,
              style: Theme.of(Get.context!)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.black87, fontSize: 18.sp),
            ),
          ],
        );
      }
    } else {
      val = null;
    }

    return rez;
  }

  bool badgeCommunication(enmPaymetnComunication type) {
    var rez = false;
    if (initializer.value.detail != null) {
      if (type == enmPaymetnComunication.tmCell &&
          initializer.value.detail!.loc![0].mb != null) {
        rez = true;
      }
      if (type == enmPaymetnComunication.tmTelekom &&
          initializer.value.detail!.loc![0].tb != null) {
        rez = true;
      }
      if (type == enmPaymetnComunication.agtsTelefon &&
          initializer.value.detail!.loc![0].pb != null) {
        rez = true;
      }
      if (type == enmPaymetnComunication.agtsInternet &&
          initializer.value.detail!.loc![0].ib != null) {
        rez = true;
      }
    }
    return rez;
  }

  bool badgeMedia(enmPaymentMedia type) {
    var rez = false;
    if (initializer.value.detail != null) {
      if (type == enmPaymentMedia.agtsIpTv &&
          initializer.value.detail!.loc![0].ipb != null) {
        rez = true;
      }
      if (type == enmPaymentMedia.agtsIpTv &&
          initializer.value.detail!.loc![0].cb != null) {
        rez = true;
      }
    }
    return rez;
  }

  bool badgeCommunal(enmPaymentCommunal type) {
    var rez = false;
    if (initializer.value.detail != null) {
      if (type == enmPaymentCommunal.utils &&
          initializer.value.detail!.loc![0].ut != null) {
        rez = true;
      }
    }
    return rez;
  }

  bool isGoodMedia(enmPaymentMedia type) {
    // initializer.value = await _getInit.getInit();
    var rez = true;
    if (initializer.value.detail != null) {
      if (displayMedia(type).startsWith("-")) {
        rez = false;
      }
    }
    return rez;
  }

  bool isGoodCommunication(enmPaymetnComunication type) {
    // initializer.value = await _getInit.getInit();
    var rez = true;
    if (initializer.value.detail != null) {
      if (displayCommunication(type).startsWith("-")) {
        rez = false;
      }
    }
    return rez;
  }

  bool isGoodCommunal(enmPaymentCommunal type) {
    var rez = true;
    if (initializer.value.detail != null) {
      if (displayCommunal(type).startsWith("-")) {
        rez = false;
      }
    }
    return rez;
  }

  String displayCommunication(enmPaymetnComunication type) {
    var rez = '';
    if (initializer.value.detail != null) {
      if (type == enmPaymetnComunication.tmCell) {
        rez = initializer.value.detail!.loc![0].tb.toString();
      }
      if (type == enmPaymetnComunication.tmTelekom) {
        rez = initializer.value.detail!.loc![0].tb.toString();
      }
      if (type == enmPaymetnComunication.agtsTelefon) {
        rez = initializer.value.detail!.loc![0].pb.toString();
      }
      if (type == enmPaymetnComunication.agtsInternet) {
        rez = initializer.value.detail!.loc![0].ib.toString();
      }
    }

    return rez;
  }

  String displayMedia(enmPaymentMedia type) {
    var rez = '';
    if (initializer.value.detail != null) {
      if (type == enmPaymentMedia.agtsIpTv) {
        rez = initializer.value.detail!.loc![0].ipb.toString();
      }
      if (type == enmPaymentMedia.cabelTV) {
        rez = initializer.value.detail!.loc![0].cb.toString();
      }
    }
    return rez;
  }

  String displayCommunal(enmPaymentCommunal type) {
    var rez = '';
    if (initializer.value.detail != null) {
      if (type == enmPaymentCommunal.utils) {
        rez = initializer.value.detail!.loc![0].ut.toString();
      }
    }
    return rez;
  }

  bool condition(enmPaymentType type) {
    var rez = false;
    if (initializer.value.detail != null) {
      if (type == enmPaymentType.pygg &&
          initializer.value.detail!.loc![0].fp != 0) {
        rez = true;
      }
    }

    return rez;
  }

  String display(enmPaymentType type) {
    var rez = "0";
    if (initializer.value.detail != null) {
      if (type == enmPaymentType.pygg) {
        rez = initializer.value.detail!.loc![0].fp.toString();
      }
    }

    return rez;
  }

  bool isGood(enmPaymentType type) {
    var rez = true;
    if (initializer.value.detail != null) {
      if (type == enmPaymentType.pygg &&
          initializer.value.detail!.loc![0].fp != 0) {
        rez = false;
      } else {
        if (display(type).startsWith("-")) {
          rez = false;
        }
      }
    }
    return rez;
  }

  checkVersionAlert() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ver = '';
    if (initializer.value.detail!.loc![0].ver == '0.0.0') {
      ver = '2.1.9';
    } else {
      ver = initializer.value.detail!.loc![0].ver.toString();
    }
    int? lastDay;
    int today;
    bool isAndroid = false;
    if (Platform.isAndroid) {
      isAndroid = true;
    } else if (Platform.isIOS) {
      isAndroid = false;
    }

    lastDay = prefs.getInt('lastDay');
    today = DateTime.now().day;
    if (lastDay == null || lastDay != today) {
      VersionDialogHAndler.dialogMSG(
        enmDialogType.none,
        title: "${LocaleKeys.attention_desc.tr} $ver",
        body: isAndroid
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          // width: widthCustom,
                          height: 50.h,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Get.back();
                              prefs.setInt('lastDay', today);
                            },
                            child: Text(
                              LocaleKeys.late.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 50.h,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(
                              Radius.circular(18.0),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              launch(
                                  "https://play.google.com/store/apps/details?id=tm.gov.turkmenpost.caparpay&hl=en&gl=US");
                            },
                            child: Text(
                              LocaleKeys.donwload.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        launch('https://post.gov.tm/download/chapar.apk');
                      },
                      child: Text(
                        LocaleKeys.downloadUrl.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      // width: widthCustom,
                      height: 50.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                          prefs.setInt('lastDay', today);
                        },
                        child: Text(
                          LocaleKeys.late.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      // width: widthCustom,
                      height: 50.h,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          launch(
                              "https://apps.apple.com/ru/app/capar/id1564491971");
                        },
                        child: Text(
                          LocaleKeys.donwload.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      );
      prefs.setInt('lastDay', today);
    }
  }

  closeInit() {
    initializer.value = InitModel();
  }

  loadInitials() async {
    String version = '';
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      version = packageInfo.version;
    });
    isLoading(true);
    initializer.value = await _getInit.getInit();

    debugPrint("Detail: ${initializer.value.detail}");

    debugPrint("ver: ${initializer.value.detail!.loc![0].ver}");
    if (initializer.value.detail!.loc![0].ver == "0.0.0") {
      initializer.value.detail!.loc![0].ver = version;
    } else if (initializer.value.detail!.loc![0].ver != version) {
      checkVersionAlert();
    }
    // checkMessage();
    cabinet.getCabinetValue();
    isLoading(false);
  }

  Future<bool> updateUserInfoFunction(String? name, String? lastN, String? add,
      String? carN, String? gid, String? wid, String? eid, String? cid) async {
    cabinet.userUpdate(true);
    final result = await updateUsrInfoRequest.updateInfo(
        name!, lastN!, add!, carN!, gid!, wid!, eid!, cid!);
    if (result != null) {
      debugPrint(result.toJson().toString());
      cabinet.userUpdate(false);
      Future.delayed(const Duration(seconds: 3)).then((_) {
        home_loadInitials();
      });
      return true;
    } else {
      cabinet.userUpdate(false);
      Get.find<InitializerController>().onError();
      return false;
    }
  }

  home_loadInitials() async {
    isLoading(true);
    cabinet.cabinetModel = await cabinet.getCabinetPost.getCabinet();
    debugPrint("Detail Cabinet: ${cabinet.cabinetInitialize.value.detail}");
    debugPrint(
        "Login Access Token: ${cabinet.customCabinet.value.accessToken}");
    // checkMessage();
    cabinet.getCabinetValue();
    isLoading(false);
  }

  @override
  void onClose() {}
}
