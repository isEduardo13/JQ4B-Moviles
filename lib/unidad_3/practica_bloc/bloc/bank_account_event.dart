part of 'bank_account_bloc.dart';

sealed class BankAccountEvent {
  const BankAccountEvent();
}

class DepositEvent extends BankAccountEvent {
  final Transaction transaction;

  DepositEvent({required this.transaction});
}
