import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:holaflutter/unidad_3/practica_bloc/models/transaction.dart';

part 'bank_account_event.dart';
part 'bank_account_state.dart';

class BankAccountBloc extends Bloc<BankAccountEvent, BankAccountState> {
  BankAccountBloc() : super(BankAccountState()) {
    on<DepositEvent>((event, emit) {
      emit(state.copyWith(
        transactions: [...state.transactions, event.transaction],
      ));
    });
    on<WithdrawEvent>((event, emit) {
      emit(state.copyWith(
        transactions: [...state.transactions, event.transaction],
      ));
    });
  }
}
