import 'package:flutter_riverpod_dersleri/sayac_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'model/sayac_model.dart';

final titleProvider =
    Provider<String>((ref) => 'Riverpod Basics'); //buradaki veri değişmiyor
final title2Provider =
    Provider<String>((ref) => 'Riverpod StateNotifier Basics');

final textProvider = Provider<String>((ref) {
  return 'Butona Basılma Sayısı';
});

final sayacStateProvider = StateProvider<int>((ref) {
  // kullanıcı bastıkça değişiyor
  return 0;
});
//1. parametre yani SayacManager iş kodlarının, metotların olduğu dosyadır
//Buna erişmek için ref.watch(sayacNotifierpProvider.notifier) demek  gerekir

//2. parametre yani SayacModel ise bu providerin state'idir.
//Buna erişmek için ref.watch(sayacNotifierpProvider) demek gerekir.
//SayacModel sınıfındaki sayaç değeri için
//var sayacDegeri = ref.watch(sayacNotifierpProvider).sayacDegeri
final sayacNotifierProvider =
    StateNotifierProvider<SayacManager, SayacModel>((ref) {
  return SayacManager();
});

final ciftMiProvider = Provider<bool>((ref) {
  var sayacModel = ref.watch(sayacNotifierProvider);

  /*if (sayacModel.sayacDegeri % 2 == 0) {
    return true;
  } else {
    return false;
  }*/
  return sayacModel.sayacDegeri % 5 == 0;
});
