part of 'bank_account_bloc.dart';

sealed class BankAccountEvent {
  const BankAccountEvent();
}

class DepositEvent extends BankAccountEvent {
  final double amount;
  final Transaction transaction;

  DepositEvent({required this.amount, required this.transaction});
}
