import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holaflutter/unidad_3/practica_bloc/bloc/bank_account_bloc.dart';
import 'package:holaflutter/unidad_3/practica_bloc/models/transaction.dart';

class TransaccionScreen extends StatelessWidget {
  const TransaccionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controllermonto = TextEditingController();
    var controllerTipoTransaccion = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo movimiento"),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Banco Mapache",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo requerido';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller: controllermonto,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Monto",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo requerido';
                    }
                    final auxString = value
                        .toLowerCase()
                        .replaceAll(RegExp("depósito"), "deposito");
                    if (auxString != "retiro" && auxString != "deposito") {
                      return "Campo debe ser retiro o depósito";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  controller: controllerTipoTransaccion,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Tipo de transacción",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final auxString = controllerTipoTransaccion.text
                        .toLowerCase()
                        .replaceAll(RegExp("depósito"), "deposito");
                    if (auxString == "deposito") {
                      context.read<BankAccountBloc>().add(DepositEvent(
                          transaction: Transaction(
                              transactionType: (controllerTipoTransaccion
                                  .value.text
                                  .toLowerCase()
                                  .replaceAll(RegExp("depósito"), "deposito")),
                              amount: double.tryParse(
                                  controllermonto.value.text))));
                      Navigator.pop(context);
                    } else {
                      context.read<BankAccountBloc>().add(WithdrawEvent(
                          transaction: Transaction(
                              transactionType: controllerTipoTransaccion
                                  .value.text
                                  .toLowerCase(),
                              amount: -double.tryParse(
                                  controllermonto.value.text)!)));
                      Navigator.pop(context);
                    }
                  } else {
                    return;
                  }
                },
                child: const Text("Realizar Transacción"),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
