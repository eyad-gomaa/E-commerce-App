import 'package:e_commerce1/Features/register/presentation/view/widget/custom_bottom_button.dart';
import 'package:e_commerce1/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/resources/asset_manager.dart';
import '../../../../../core/resources/style.dart';
import '../../../../../core/widgets/custom_toast.dart';

class AddCardScreenBody extends StatefulWidget {
  const AddCardScreenBody({Key? key}) : super(key: key);

  @override
  State<AddCardScreenBody> createState() => _AddCardScreenBodyState();
}

class _AddCardScreenBodyState extends State<AddCardScreenBody> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? cardNumber;
  String? exp;
  String? cvv;
  @override
  Widget build(BuildContext context) {
    List <String> paymentMethodImage= [AssetManager.paybalImage,AssetManager.bankImage,AssetManager.masterCardImage];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children:[
              SizedBox(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                child: ListView.builder(
                  itemCount: paymentMethodImage.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Container(
                      width: (MediaQuery.sizeOf(context).width - 60) / 3,
                      height: 50,
                      decoration: BoxDecoration(
                        color: ColorManager.darkWhite,
                        image: DecorationImage(image: AssetImage(paymentMethodImage[index])),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Card Owner",
                          style: StyleManager.headLine3,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            name = value;

                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Required field';
                            }
                            return null;
                          },
                          cursorColor: ColorManager.primary,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorManager.darkWhite,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Card Number",
                          style: StyleManager.headLine3,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onChanged: (value){
                            cardNumber = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Required field';
                            }else if(value.length < 16){
                              return 'Min length : 16';
                            }
                            return null;
                          },
                          maxLength: 16,
                          keyboardType: TextInputType.number,
                          cursorColor: ColorManager.primary,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorManager.darkWhite,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2 - 25,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "EXP",
                                style: StyleManager.headLine3,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                onChanged: (value) {
                                  exp = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Required field';
                                  }
                                  else if(value.length < 5){
                                    return 'Min length : 5';
                                  }
                                  return null;
                                },
                                maxLength: 5,
                                cursorColor: ColorManager.primary,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorManager.darkWhite,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2 - 25,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CVV",
                                style: StyleManager.headLine3,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                onChanged: (value) {
                                  cvv = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Required field';
                                  }else if(value.length < 3){
                                    return 'Min length : 3';
                                  }
                                  return null;
                                },
                                maxLength: 3,
                                keyboardType: TextInputType.number,
                                cursorColor: ColorManager.primary,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorManager.darkWhite,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Save card info",
                          style: StyleManager.headLine3,
                        ),
                        Switch(
                          value: true,
                          onChanged: (value) {},
                          activeTrackColor: ColorManager.primary,
                          activeColor: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ]
          ),
        ),
        CustomBottomButton(onPressed: (){
          if (_formKey.currentState!.validate()) {
            showToast(message: "Added Successfully",color: Colors.green);
            GoRouter.of(context).pop();
          }
        }, text: "text")
      ],
    );

  }
}
