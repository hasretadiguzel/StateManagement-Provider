import 'package:flutter/material.dart';
import 'package:flutter_riverpod_dersleri/all_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StateNotifierKullanimi extends StatelessWidget {
  const StateNotifierKullanimi({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint('Material app build tetiklendi');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('my home page build tetiklendi');
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            var title = ref.watch(title2Provider);
            return Text(title);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyText(),
            MyCounterText(),
            CiftMiWidget(),
          ],
        ),
      ),
      floatingActionButton: MyFloatingActionButton(),
    );
  }
}

class CiftMiWidget extends ConsumerWidget {
  const CiftMiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("çift mi widget tekilendi");
    var ciftMi = ref.watch(ciftMiProvider);
    return Text(ciftMi ? 'ÇİFT' : 'TEK');
  }
}

class MyCounterText extends ConsumerWidget {
  const MyCounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('My counnter text build tetiklendi');
    var sayac = ref.watch(sayacNotifierProvider);
    return Text(
      sayac.sayacDegeri.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MyFloatingActionButton extends ConsumerWidget {
  MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('floating action build tetiklendi');
    return FloatingActionButton(
      onPressed: () {
        //ref.read(sayacNotifierProvider) bize SayacModeli verir
        //arttirma ve azaltma metodları SayacManager sınıfında
        //olduğundan bu sınıfa erişmek için .notifier kullanılır
        ref.read(sayacNotifierProvider.notifier).arttir();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class MyText extends ConsumerWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('My text build tetiklendi');
    //var text = ref.watch(textProvider);
    return Text(ref.watch(textProvider));
  }
}
