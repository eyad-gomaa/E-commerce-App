
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/card_model.dart';
import '../../../data/repo/payment_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.repo)
      : super(PaymentInitial());
  final PaymentRepo repo;
  String? ownerName;
  String? cardNumber;
  String? exp;
  String? cvv;

  setCardData({required String ownerName,required String cardNumber,required String exp,required String cvv }){
    this.ownerName = ownerName;
    this.cardNumber = cardNumber;
    this.exp = exp;
    this.cvv = cvv;
    emit(AddPaymentSuccess());
  }

  addCard(CardModel card){
    try {
      emit(AddCardLoading());
      repo.addCard(card);
    } on Exception catch (e) {
      emit(AddCardFailure());
    }

  }
}
