import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juniorproj/layout/cubit/cubit.dart';
import 'package:juniorproj/layout/cubit/states.dart';
import 'package:juniorproj/shared/components/components.dart';
import 'package:juniorproj/shared/styles/colors.dart';

class UnitOverview extends StatelessWidget {
  const UnitOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(

      listener: (context,state)
      {},

      builder: (context,state)
      {
        return Scaffold(
          appBar: AppBar(
            actions:
            [
              IconButton(
                  onPressed: (){AppCubit.get(context).ChangeTheme();}, icon: const Icon(Icons.sunny)),
            ],
          ),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                //height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: itemBuilder(),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget itemBuilder()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
         Center(
          child:  Text(
            'Unit 1:',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: defaultDarkColor,
            ),
    ),
        ),

        const SizedBox(height: 20,),

        myDivider(),

        const SizedBox(height: 20,),

         Text(
          'What you will Learn:',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: defaultColor,
          ),
        ),

        const SizedBox(height: 10,),

        const Text(
          'In this unit, we will introduce some new words along with videos.\nWe will try to explain some ordinary concepts too. \nAt the end, you will take a quiz to proceed to the next unit.',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w100,
          ),
        ),

        const SizedBox(height: 20,),

         Center(
          child: Text(
            'Good Luck...',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: defaultDarkColor
            ),
          ),
        ),

      ],
    );
  }
}
