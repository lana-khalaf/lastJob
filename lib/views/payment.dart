
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_jobs_app/blocs/bloc/payment_bloc.dart';

class PaymentPage extends StatelessWidget {
  static String id = 'PaymentPage';
  PaymentPage({super.key});
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _purposeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(),
      child: Builder(builder: (context) {
        return Container(
          decoration: BoxDecoration(
             image: DecorationImage(
                  image: Theme.of(context).brightness == Brightness.light
                   ? AssetImage('assets/images/Mask Group (3).png')
                    : AssetImage('assets/images/Home (3).jpg'),
                  fit: BoxFit.cover,
                ),
          ),
          child: Scaffold(
    
            body: 
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Column(
                children: [
             Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Row(
                  children: [
                    InkWell(
                      child:Theme.of(context).brightness == Brightness.light
                   ? Image.asset('assets/images/back.png')
                    : Image.asset('assets/images/Vector (25).png'), onTap: (){  Navigator.pop(context);},),
                        Spacer(),
                    Text(   
                       "Create Payment".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 21,// غيرت 
                      color: Theme.of(context).colorScheme.primary,
                              fontFamily:"Poppins",
                              
                    ),),
                        Spacer(),
                    // SizedBox(
                    //   width: 115,
                    // ),

                  ],
                ),
                
              ),
                
                   
   
                  SizedBox(height: 40,),
                  _buildTextField(
                    controller: _usernameController,
                    label: 'Beneficiary Username'.tr(),
                    // iconPath: 'assets/icons/beneficiary_username_icon.svg',
                  ),
                  SizedBox(height: 25),
                  _buildTextField(
                    controller: _amountController,
                    label: 'Amount'.tr(),
                    // iconPath: 'assets/icons/amount_icon.svg',
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 25),
                  _buildTextField(
                    controller: _purposeController,
                    label: 'Purpose'.tr(),
                    // iconPath: 'assets/icons/purpose_icon.svg',
                  ),
                  SizedBox(height: 25),
                  BlocConsumer<PaymentBloc, PaymentState>(
                    listener: (context, state) {
                      if (state is PaymentSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Payment successful!')),
                        );
                      } else if (state is PaymentFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Payment failed: ${state.error}')),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is PaymentLoading) {
                        return CircularProgressIndicator();
                      }
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<PaymentBloc>().add(
                                  CreatePayment(
                                    username: _usernameController.text,
                                    amount: double.parse(_amountController.text),
                                    purpose: _purposeController.text,
                                  ),
                                );
                          },
                          style: ElevatedButton.styleFrom(
                            
                            backgroundColor: Theme.of(context).colorScheme.primary,// اللون الخلفي للزر
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Complete'.tr(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onSecondary,
                            )),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    // required String iconPath,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
    border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
