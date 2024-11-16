import 'package:faydabazar/Home.dart';
import 'package:faydabazar/VerndorBigRegistration.dart';
import 'package:faydabazar/aboutus.dart';
import 'package:faydabazar/amountpagewithfetchplan.dart';
import 'package:faydabazar/category.dart';
import 'package:faydabazar/changemypassword.dart';
import 'package:faydabazar/changetransaction.dart';
import 'package:faydabazar/datacardoperators/datacardoperators.dart';
import 'package:faydabazar/datacardoperators/ideainsertion.dart';
import 'package:faydabazar/datacardoperators/ideapayment.dart';
import 'package:faydabazar/datacardoperators/tatadocomoinsertion.dart';
import 'package:faydabazar/datacardoperators/tatadocomopayment.dart';
import 'package:faydabazar/datacardoperators/vodafonedatacardinsertion.dart';
import 'package:faydabazar/datacardoperators/vodafonedatacardpayment.dart';
import 'package:faydabazar/digitalapmc.dart';
import 'package:faydabazar/directincome.dart';
import 'package:faydabazar/discount.dart';
import 'package:faydabazar/dthoperators/dthoperators.dart';
import 'package:faydabazar/dthoperators/dthinsertionpage.dart';
import 'package:faydabazar/editprofile.dart';
import 'package:faydabazar/electricitybilloperators/adanielectricitymumbaiinsertion.dart';
import 'package:faydabazar/electricitybilloperators/adanielectricitymumbaipayment.dart';
import 'package:faydabazar/electricitybilloperators/apdclraporassaminsertion.dart';
import 'package:faydabazar/electricitybilloperators/apdclraporassampayment.dart';
import 'package:faydabazar/electricitybilloperators/cspdclchattisgarhpayment.dart';
import 'package:faydabazar/electricitybilloperators/cspdclchhattisgarhinsertion.dart';
import 'package:faydabazar/electricitybilloperators/elcetricitybilloperator.dart';
import 'package:faydabazar/electricitybilloperators/madhyakshetramadhyapradeshinsertion.dart';
import 'package:faydabazar/electricitybilloperators/madhyakshetramadhyapradeshpayment.dart';
import 'package:faydabazar/electricitybilloperators/msedclmaharashtrainsertion.dart';
import 'package:faydabazar/electricitybilloperators/msedclmaharashtrapayment.dart';
import 'package:faydabazar/electricitybilloperators/nbdclnorthbiharelctricitypayment.dart';
import 'package:faydabazar/electricitybilloperators/nbpdclnorthbiharelectricityinsertion.dart';
import 'package:faydabazar/electricitybilloperators/tradlajmerinsertion.dart';
import 'package:faydabazar/electricitybilloperators/tradlajmerpayment.dart';
import 'package:faydabazar/electricitybilloperators/uppcruraluttarpradeshinsertion.dart';
import 'package:faydabazar/electricitybilloperators/uppcruraluttarpradeshpayment.dart';
import 'package:faydabazar/electricitybilloperators/wescoodishainsertion.dart';
import 'package:faydabazar/electricitybilloperators/wescoodishapayment.dart';
import 'package:faydabazar/emailverify.dart';
import 'package:faydabazar/entermobilenumberpage.dart';
import 'package:faydabazar/ewallettoswallet.dart';
import 'package:faydabazar/exploreestates.dart';


import 'package:faydabazar/favourite.dart';
import 'package:faydabazar/fbbackendcode/deleteaccount.dart';
import 'package:faydabazar/fbbackendcode/memberwelcomeletter.dart';
import 'package:faydabazar/fbbackendcode/paymentintegration.dart';
import 'package:faydabazar/fbbackendcode/verifycustomerdocument.dart';
import 'package:faydabazar/fetchplanpage.dart';
import 'package:faydabazar/flourfactory.dart';
import 'package:faydabazar/gasbilloperators.dart';
import 'package:faydabazar/hotels.dart';
import 'package:faydabazar/insuranceoperator/iciciinsuranceinsertion.dart';
import 'package:faydabazar/insuranceoperator/iciciinsurancepaymentpage.dart';

import 'package:faydabazar/insuranceoperator/insuranceoperator.dart';
import 'package:faydabazar/insuranceoperator/licofindiainsertion.dart';
import 'package:faydabazar/insuranceoperator/licofindiapayment.dart';
import 'package:faydabazar/insuranceoperator/tataaiainsurancepayment.dart';
import 'package:faydabazar/insuranceoperator/tataaialifeinsurance.dart';
import 'package:faydabazar/insuranceoperator/tataaiggeneralinsuranceinsertion.dart';
import 'package:faydabazar/insuranceoperator/tataaiginsurancepayment.dart';
import 'package:faydabazar/kycdocuments.dart';
import 'package:faydabazar/landlineoperators/Mtnldelhiinsertion.dart';
import 'package:faydabazar/landlineoperators/airtelinsertion.dart';
import 'package:faydabazar/landlineoperators/airtelpayment.dart';
import 'package:faydabazar/landlineoperators/bsnlcorporateinsertion.dart';
import 'package:faydabazar/landlineoperators/bsnlcorporatepayment.dart';
import 'package:faydabazar/landlineoperators/bsnlindividualinsertion.dart';
import 'package:faydabazar/landlineoperators/bsnlpayment.dart';
import 'package:faydabazar/landlineoperators/landlineoperators.dart';
import 'package:faydabazar/landlineoperators/mtnlmumbai.dart';
import 'package:faydabazar/landlineoperators/mtnlmumbaipayment.dart';
import 'package:faydabazar/landlineoperators/relianceinsertion.dart';
import 'package:faydabazar/landlineoperators/reliancepayment.dart';
import 'package:faydabazar/landlineoperators/tatadocomocdmainsertion.dart';
import 'package:faydabazar/landlineoperators/tatadocomocdmapayment.dart';
import 'package:faydabazar/listewalletTransaction.dart';
import 'package:faydabazar/loanemi1.dart';
import 'package:faydabazar/memberdownline.dart';
import 'package:faydabazar/membermaster.dart';
import 'package:faydabazar/landlineoperators/mtnldelhipayment.dart';
import 'package:faydabazar/mywallet.dart';
import 'package:faydabazar/pagereviewnew.dart';
import 'package:faydabazar/payment2.dart';
import 'package:faydabazar/paymentemi.dart';
import 'package:faydabazar/paymentscreen.dart';
import 'package:faydabazar/personalinformation.dart';
import 'package:faydabazar/postpaidrechargeoperators/postpaidoperators.dart';

import 'package:faydabazar/rechargelatesthistory.dart';
import 'package:faydabazar/referralincome.dart';
import 'package:faydabazar/municipalsearchoperator.dart';
import 'package:faydabazar/screens/caseFreeScreens/create_orders_screen.dart';

import 'package:faydabazar/secondpage.dart';
import 'package:faydabazar/sellyouranimal.dart';
import 'package:faydabazar/sellyourcrops.dart';
import 'package:faydabazar/sellyourland.dart';
import 'package:faydabazar/sellyourvehicle.dart';
import 'package:faydabazar/sendfundrequest.dart';
import 'package:faydabazar/splashscreen.dart';
import 'package:faydabazar/successfully.dart';
import 'package:faydabazar/generateticket.dart';
import 'package:faydabazar/swallettoswallet.dart';
import 'package:faydabazar/telecomsearchoperator.dart';
import 'package:faydabazar/themeprovider.dart';
import 'package:faydabazar/usersignup.dart';

import 'package:faydabazar/vendorregistration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:faydabazar/BillPayment.dart';
import 'package:provider/provider.dart';

import 'electricitybilloperators/apsdclandhrapradeshinsertion.dart';
import 'newpagereview.dart';


@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (kDebugMode) {
    print(message.notification!.title.toString());
  }
  if (kDebugMode) {
    print(message.notification!.body.toString());
  }
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp();
  FirebaseAppCheck.instance.setDebugModeEnabled(true);

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),

      child: const MyApp(),

    ),
  );
}

extension on FirebaseAppCheck {
  void setDebugModeEnabled(bool bool) {}
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faydabazar',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Signup()
    );
  }
}

