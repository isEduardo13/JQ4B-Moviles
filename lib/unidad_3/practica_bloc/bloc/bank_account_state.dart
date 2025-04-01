part of 'bank_account_bloc.dart';

class BankAccountState extends Equatable {
  final double balance;
  final List<Transaction> transactions;
  const BankAccountState({
    this.balance = 0.0,
    this.transactions = const [],
  });

  BankAccountState copyWith({
    double? balance,
    List<Transaction>? transactions,
  }) =>
      BankAccountState(
        transactions: transactions ?? this.transactions,
        balance: balance ?? this.balance,
      );

  @override
  List<Object> get props => [balance, transactions];
}
