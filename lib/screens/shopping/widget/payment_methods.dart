import 'package:flutter/material.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  Methods _paymentMethod = Methods.netbanking;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<Methods>(value: Methods.netbanking, groupValue: _paymentMethod, onChanged: (Methods? value){
          setState(() {
            _paymentMethod = value!;
          });
        },
          title: const Text("Net Banking"),
        ),
        RadioListTile<Methods>(value: Methods.cards, groupValue: _paymentMethod, onChanged: (Methods? value){
          setState(() {
            _paymentMethod = value!;
          });
        },
          title: const Text("Credit/Debit Card"),
        )
      ],
    );
  }
}

enum Methods{netbanking,cards}
