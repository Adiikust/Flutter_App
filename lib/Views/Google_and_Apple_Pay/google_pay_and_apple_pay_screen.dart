import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class PaySampleApp extends StatefulWidget {
  const PaySampleApp({Key? key}) : super(key: key);

  @override
  _PaySampleAppState createState() => _PaySampleAppState();
}

class _PaySampleAppState extends State<PaySampleApp> {
  late final Future<PaymentConfiguration> _googlePayConfigFuture;
  late final Future<PaymentConfiguration> _applePayConfigFuture;

  @override
  void initState() {
    super.initState();
    _googlePayConfigFuture =
        PaymentConfiguration.fromAsset('default_google_pay_config.json');
    _applePayConfigFuture =
        PaymentConfiguration.fromAsset('default_apple_pay_config.json');
  }

  static const _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];
  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Successfully Google Pay!'),
      ),
    );
  }

  void onApplePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Successfully Apple Pay!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('T-shirt Shop'),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: const Image(
              image: AssetImage("assets/images/shirt.jpg"),
              height: 350,
            ),
          ),
          const Text(
            'Amanda\'s Polo Shirt',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff333333),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '\$50.20',
            style: TextStyle(
              color: Color(0xff777777),
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff333333),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'A versatile full-zip that you can wear all day long and even...',
            style: TextStyle(
              color: Color(0xff777777),
              fontSize: 15,
            ),
          ),
          // Example pay button configured using an asset
          FutureBuilder<PaymentConfiguration>(
              future: _googlePayConfigFuture,
              builder: (context, snapshot) => snapshot.hasData
                  ? GooglePayButton(
                      paymentConfiguration: snapshot.data!,
                      paymentItems: _paymentItems,
                      type: GooglePayButtonType.buy,
                      margin: const EdgeInsets.only(top: 15.0),
                      onPaymentResult: onGooglePayResult,
                      loadingIndicator: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : const SizedBox.shrink()),
          // Example pay button configured using a string
          FutureBuilder(
              future: _applePayConfigFuture,
              builder: (context, snapshot) => snapshot.hasData
                  ? ApplePayButton(
                      paymentConfiguration: snapshot.data!,
                      paymentItems: _paymentItems,
                      style: ApplePayButtonStyle.black,
                      type: ApplePayButtonType.buy,
                      margin: const EdgeInsets.only(top: 15.0),
                      onPaymentResult: onApplePayResult,
                      loadingIndicator: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(
                      height: 15,
                      color: Colors.black,
                    ))
        ],
      ),
    );
  }
}
