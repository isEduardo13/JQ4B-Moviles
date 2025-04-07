import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holaflutter/unidad_3/practica_bloc/bloc/bank_account_bloc.dart';
import 'package:holaflutter/unidad_3/practica_bloc/models/transaction.dart';

class PrincipalSceen extends StatelessWidget {
  const PrincipalSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuenta'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            "/Unidad_3/practica_bloc/transaccion",
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
          child: Column(
        children: [
          const Text(
            "Saldo",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          context.select((BankAccountBloc account) => Text(
              account.state.balance.toString(),
              style: account.state.balance < 0
                  ? const TextStyle(fontSize: 30, color: Colors.red)
                  : const TextStyle(fontSize: 30))),
          Expanded(
            child: ListView.builder(
                itemCount:
                    context.read<BankAccountBloc>().state.transactions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Movimiento"),
                    subtitle: Text(context
                        .read<BankAccountBloc>()
                        .state
                        .transactions[index]
                        .transactionType!
                        .toLowerCase()
                        .replaceAll(RegExp("deposito"), "depósito")),
                    trailing: Text(
                        "\$ ${context.read<BankAccountBloc>().state.transactions[index].amount}"),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
