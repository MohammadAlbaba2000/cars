import 'package:cars/layout/cars/cubit/cubit.dart';
import 'package:cars/layout/cars/cubit/states.dart';
import 'package:cars/modules/login/login_screen.dart';
import 'package:cars/modules/seller_module/Profile/My_Profile/My_Profile.dart';
import 'package:cars/modules/seller_module/Profile/My_Profile/payment/Payment_Screen.dart';
import 'package:cars/modules/seller_module/Profile/My_Profile/Settings_Screen.dart';
import 'package:cars/modules/seller_module/Profile/My_Profile/Support_Screen.dart';
import 'package:cars/modules/seller_module/Profile/My_Profile/Terms_Condition.dart';
import 'package:cars/shared/bloc_observer.dart';
import 'package:cars/shared/components/components.dart';
import 'package:cars/shared/network/local/cache_helper.dart';
import 'package:cars/shared/styles/colors.dart';
import 'package:cars/shared/styles/icon_broken.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSellerScreen extends StatefulWidget {
  @override
  _ProfileSellerScreenState createState() => _ProfileSellerScreenState();
}

class _ProfileSellerScreenState extends State<ProfileSellerScreen> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){},
        builder: (context, state){
          var userModel = AppCubit.get(context).userModel;
          var profileImage = AppCubit.get(context).profileImage;

          return Scaffold(
            backgroundColor: bgColor,
            appBar: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(14.0),
                ),
              ),
              toolbarHeight: 212,
              backgroundColor: defaultColor,
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                CircleAvatar(
                radius: 28.0,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: CircleAvatar(
                  radius: 27.0,
                  backgroundImage: profileImage == null ?
                  NetworkImage('${userModel.image}',)
                      : FileImage(profileImage),
                ),
              ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                            child: Text(
                                '${userModel.name}',
                              style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Colors.white,
                              ),),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                            child: Text(
                              '${userModel.bio}',
                            style: Theme.of(context).textTheme.caption.copyWith(
                              color: Colors.white,
                            ),),
                          ),
                        ],
                      ),
                    ],

                  ),
                  SizedBox(height: 25.0,),
                  Container(
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Seller Mode' , style: Theme.of(context).textTheme.subtitle1,),
                          Spacer(),
                          Switch(value: switchValue, onChanged: (value){
                            setState(() {
                              switchValue = value;
                            });
                          }),
                        ],

                      ),
                    ),
                  ),
                ],

              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Column(
                      children: [
                        InkWell(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(IconBroken.Profile, color: Colors.grey,),
                              SizedBox(width: 10.0,),
                              Text(
                                'My Profile',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(width: 10.0,),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          onTap: (){
                            navigateTo(context, MyProfileSeller(),);
                          },
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        myDivider(),
                        InkWell(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.payment,color: Colors.grey,),
                              SizedBox(width: 10.0,),
                              Text(
                                'Payment',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(width: 10.0,),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          onTap: (){
                            navigateTo(context, PaymentSeller());
                          },
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        myDivider(),
                        InkWell(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.support_agent_outlined, color: Colors.grey,),
                              SizedBox(width: 10.0,),
                              Text(
                                'Support',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(width: 10.0,),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          onTap: (){
                            navigateTo(context, SupportSellerScreen(),);
                          },
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        myDivider(),
                        InkWell(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(IconBroken.Document,color: Colors.grey,),
                              SizedBox(width: 10.0,),
                              Text(
                                'Terms & Condition',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(width: 10.0,),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,color: Colors.grey,
                              ),
                            ],
                          ),
                          onTap: (){
                            navigateTo(context, TermsConditionSeller(),);
                          },
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        myDivider(),
                        InkWell(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(IconBroken.Setting, color: Colors.grey,),
                              SizedBox(width: 10.0,),
                              Text(
                                'Settings',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(width: 10.0,),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,color: Colors.grey,
                              ),
                            ],
                          ),
                          onTap: (){
                            navigateTo(context, SettingsSeller(),);
                          },
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        myDivider(),
                        InkWell(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(IconBroken.Logout, color: Colors.grey,),
                              SizedBox(width: 10.0,),
                              Text(
                                'Logout',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(width: 10.0,),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios, color: Colors.grey,
                              ),
                            ],
                          ),
                          onTap: ()async{
                            CacheHelper.removeData(key: 'uId');
                            await FirebaseAuth.instance.signOut();
                            navigateAndFinish(context, LoginScreen());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        );
  }
}

