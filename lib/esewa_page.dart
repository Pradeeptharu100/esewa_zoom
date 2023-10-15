import 'package:flutter/material.dart';

class EsewaPage extends StatelessWidget {
  const EsewaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {}, child: const Text('Pay')),
        ],
      )),
    );
  }

  pay() {
    // try {
    //   EsewaFlutterSdk.initPayment(
    //     esewaConfig: EsewaConfig(
    //       environment: Environment.test,
    //       clientId: CLIENT_ID,
    //       secretId: SECRET_KEY,
    //     ),
    //     esewaPayment: EsewaPayment(
    //       productId: "1d71jd81",
    //       productName: "Product One",
    //       productPrice: "20",
    //     ),
    //     onPaymentSuccess: (EsewaPaymentSuccessResult data) {
    //       debugPrint(":::SUCCESS::: => $data");
    //     },
    //     onPaymentFailure: (data) {
    //       debugPrint(":::FAILURE::: => $data");
    //     },
    //     onPaymentCancellation: (data) {
    //       debugPrint(":::CANCELLATION::: => $data");
    //     },
    //   );
    // } on Exception catch (e) {
    //   debugPrint("EXCEPTION : ${e.toString()}");
    // }

    // void verifyTransactionStatus(EsewaPaymentSuccessResult result) async {}
  }
}
