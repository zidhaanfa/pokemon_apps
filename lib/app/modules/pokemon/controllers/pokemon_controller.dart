import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/function/helper.dart';
import '../../../data/api.dart';
import '../pokemon_model.dart';

class PokemonController extends GetxController {
  //TODO: Implement PokemonController

  SharedPreferences? prefs;
  final count = 0.obs;
  List<dynamic> pokemonData = [];
  final nextLink = ''.obs;
  final prevLink = ''.obs;
  final loadingIs = true.obs;
  final error = ''.obs;
  final limit = 20.obs;
  final offset = 0.obs;
  final name = ''.obs;
  final idLink = ''.obs;
  final id = ''.obs;
  final showAbilities = false.obs;
  final showForms = false.obs;
  final showGameIndices = false.obs;
  final showHeldItems = false.obs;
  final showMoves = false.obs;
  final showPastType = false.obs;
  final showSpecies = false.obs;
  final showSprites = false.obs;
  final showStats = false.obs;
  final showTypes = false.obs;
  PokemonDetailModels? pokemonDetailModels;
  @override
  void onInit() {
    super.onInit();
    name.value = Get.arguments['name'];
    idLink.value = Get.arguments['idLink'];
    id.value = Get.arguments['id'];
    print('idLinkkkkkk = $id');
    processGetPokemon();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void changeBoleanshowAbilities() {
    showAbilities.value = !showAbilities.value;
  }

  void changeBoleanshowForms() {
    showForms.value = !showForms.value;
  }

  void changeBoleanshowGameIndices() {
    showGameIndices.value = !showGameIndices.value;
  }

  processGetPokemon() async {
    loadingIs(true);
    int prosesLoading = 0;
    int prosesLoadingRec = 0;

    Response? response;
    EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
    FormData formData = FormData.fromMap({});
    var prefs = await SharedPreferences.getInstance();
    var cookie = prefs.getString('session');
    print("cookie = $cookie");
    try {
      response = await Dio().get(
        Api.pokemon + id.value,
        onReceiveProgress: (int count, int total) {
          var prosesLoadingRec = (count / total * 100).round();
          print("prosesLoading = $prosesLoadingRec");
        },
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            // HttpHeaders.cookieHeader: "session_id=$cookie",
          },
          receiveTimeout: const Duration(minutes: 1),
          sendTimeout: const Duration(minutes: 1),
          persistentConnection: true,
          receiveDataWhenStatusError: true,
          validateStatus: (status) {
            return status! < 500;
          },
          // method: "GET",
          listFormat: ListFormat.multiCompatible,
          followRedirects: true,
          responseType: ResponseType.json,
        ),
      );
      print(response);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        betterShowMessage(
          title: "Terjadi kesalahan",
          content: Text("${e.message}"),
          context: Get.context!,
          onDefaultOK: () {
            Get.back();
          },
        );
      }
    } finally {
      if (response?.statusCode == 200) {
        var responseMap = response?.data;
        if (kDebugMode) {
          print("responseMap = $responseMap");
        }
        // EasyLoading.showSuccess('Berhasil Mendapatkan Data!');
        prefs = await SharedPreferences.getInstance();
        PokemonDetailModels.fromJson(responseMap);
        pokemonDetailModels = PokemonDetailModels.fromJson(responseMap);
        //print KelasModels
        if (kDebugMode) {}
        Timer(
            const Duration(
              seconds: 1,
            ), () {
          loadingIs(false);
          EasyLoading.dismiss();
        });
      } else {
        error.value = response!.statusMessage.toString();
        // Get.back();
        EasyLoading.showError(response!.statusMessage.toString());
        if (kDebugMode) {
          print('status code: ${response.statusCode}');
          print('response: ${response.data}');
        }
      }
    }
  }
}
