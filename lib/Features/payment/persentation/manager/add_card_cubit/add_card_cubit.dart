

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/card_model.dart';
import '../../../data/repo/payment_repo.dart';

part 'add_card_state.dart';

class AddCardCubit extends Cubit<AddCardState> {
  AddCardCubit(this.repo) : super(AddCardInitial());
  final PaymentRepo repo;
  addCard(CardModel card){
    try {
      emit(AddCardLoading());
      repo.addCard(card);
    } on Exception catch (e) {
      emit(AddCardFailure());
    }

  }
}
