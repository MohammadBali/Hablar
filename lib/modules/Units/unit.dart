import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:juniorproj/layout/cubit/cubit.dart';
import 'package:juniorproj/layout/cubit/states.dart';
import 'package:juniorproj/models/MainModel/content_model.dart';
import 'package:juniorproj/modules/Exam/exam.dart';
import 'package:juniorproj/modules/Lessons/UnitLessons.dart';
import 'package:juniorproj/modules/Units/unitOverview.dart';
import 'package:juniorproj/modules/Videos/UnitsVideos.dart';
import 'package:juniorproj/shared/components/components.dart';
import 'package:juniorproj/shared/styles/colors.dart';
import '../Lessons/Curve Painter/CurvePainter.dart';

class Unit extends StatefulWidget {

  final int unitId;

  const Unit(this.unitId, {Key? key}) : super(key: key);

  @override
  State<Unit> createState() => _UnitState();
}

class _UnitState extends State<Unit> {


  @override
  void initState()
  {
    super.initState();
  }

  @override
  void dispose()
  {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state)
      {},
      builder: (context,state)
      {
        //var cubit=AppCubit.get(context);
        ContentModel? model=AppCubit.contentModel; //Get the content of this unit, UnitOverview, Lessons, Questions and videos
        return WillPopScope(
          child: Scaffold(
            appBar: AppBar(
              actions:
              [
                IconButton(
                  icon:const Icon(Icons.question_mark_rounded),
                  onPressed: ()
                  async {
                    await showDialog(
                        context: context,
                        builder: (context)
                        {

                          return defaultAlertDialog(
                              context: context,
                              title: 'Content of each Unit',
                              content: const SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children:
                                  [
                                    Text('-Each Unit contains Lessons, Videos, a Quiz to test your abilities, a Paragraph to summarize what you have learnt.\n',),

                                    Text('-Each Lesson will contain mandatory information to pass the unit\n',),

                                    Text('- The video will improve your listening as well as your vocabularies.\n',),

                                    Text('- Quiz will contain a variety of questions, bypass them to get to the next unit.',),
                                  ],
                                ),
                              ),
                          );
                        }
                    );
                  },
                ),

                IconButton(onPressed: (){AppCubit.get(context).changeTheme();}, icon: const Icon(Icons.sunny)),
              ],
            ),

            body: ConditionalBuilder(
              condition: AppCubit.contentModel!=null,
              fallback: (context)=>const Center(child: CircularProgressIndicator(),),
              builder: (context)
                {
                  return SingleChildScrollView(
                    child: CustomPaint(
                      painter: CurvePainter(context),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                          [
                            Center(
                              child: Text(
                                'Unit Content',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  color: pistachioColor,
                                ),
                              ),
                            ),

                            const SizedBox(height: 40,),

                            Padding(
                              padding: const EdgeInsetsDirectional.only(start: 7.0, end: 35.0),
                              child: Column(
                                children: [

                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: defaultButtonItem(
                                        function: ()
                                        {
                                          navigateTo(context,UnitOverview(model!.unitOverview!));
                                        },
                                        mainText: 'Overview',
                                        backgroundColor: HexColor('623b5a'),
                                        iconColor: HexColor('623b5a'),
                                        icon: Icons.view_agenda_outlined),
                                  ),

                                  const SizedBox(height: 10,),

                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: defaultButtonItem(
                                      function: ()
                                      {
                                        navigateTo(context, UnitLessons(widget.unitId, model!.lessons!));
                                      },
                                      mainText: 'Lessons',
                                      iconColor: HexColor('2a7f62'),
                                      backgroundColor: HexColor('2a7f62'),
                                      icon: Icons.play_lesson_outlined,),
                                  ),

                                  const SizedBox(height: 10,),

                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: defaultButtonItem(
                                        function: ()
                                        {
                                          navigateTo(context, UnitVideos(model!.videos!));
                                        },
                                        mainText: 'Videos',
                                        icon: Icons.ondemand_video_outlined
                                    ),
                                  ),

                                  const SizedBox(height: 10,),

                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: defaultButtonItem(
                                      function: ()
                                      {
                                        navigateTo(context,  Exam(model: model!, unitId: widget.unitId,));
                                      },
                                      mainText: 'Exam',
                                      backgroundColor: Colors.grey,
                                      iconColor: Colors.grey,
                                      icon: Icons.question_mark_outlined,),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),

          onWillPop: ()async
          {
            model=null;
            AppCubit.contentModel=null;
            return true;
          },
        );
      },
    );
  }

  // Widget unitOverViewBuilder(BuildContext context, List<String> model)
  // {
  //
  //   return GestureDetector(
  //     onTap: ()
  //     {
  //         navigateTo(context,UnitOverview(model));
  //     },
  //     child: Padding(
  //       padding: const EdgeInsetsDirectional.only(top:8.0),
  //       child: Container(
  //         padding: const EdgeInsetsDirectional.only(end: 1 ,start: 1),
  //         height: 60,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(5),
  //           color: Colors.grey
  //         ),
  //         child: Column(
  //           children:const
  //           [
  //             Expanded(
  //               child: Text(
  //                   'UNIT OVERVIEW',
  //                 textAlign: TextAlign.center,
  //                 style:  TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget videoBuilder(BuildContext context, Videos model, int index)
  // {
  //
  //   return GestureDetector(
  //     onTap: ()
  //     {
  //         navigateTo(
  //             context,
  //             ShowCaseWidget(
  //                 builder: Builder(
  //                   builder: (context)=>VideoGetter(model),
  //                 )
  //             ),
  //         );
  //
  //     },
  //     child: Padding(
  //       padding: const EdgeInsetsDirectional.only(top:8.0),
  //       child: Container(
  //         padding: const EdgeInsetsDirectional.only(end: 1 ,start: 1),
  //         height: 60,
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(5),
  //             color: Colors.grey
  //         ),
  //         child: Column(
  //           children: [
  //             Expanded(
  //               child: Text(
  //                 'VIDEO $index: ',
  //                 textAlign: TextAlign.center,
  //                 style: const TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ),
  //
  //             Expanded(
  //               child:  Text(
  //                 model.videoTitle!.toUpperCase(),
  //                 style: const TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.w300,
  //                   color: Colors.white,
  //                 ),
  //                 overflow: TextOverflow.ellipsis,
  //                 maxLines: 1,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget lessonBuilder(BuildContext context, Lessons model, int index)
  // {
  //   return GestureDetector(
  //     onTap: ()
  //     {
  //       navigateTo(context,Lesson(model));
  //     },
  //     child: Padding(
  //       padding: const EdgeInsetsDirectional.only(top:8.0),
  //       child: Container(
  //         padding: const EdgeInsetsDirectional.only(end: 1 ,start: 1),
  //         height: 60,
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(5),
  //             color: Colors.grey
  //         ),
  //         child: Column(
  //           children: [
  //              Expanded(
  //               child: Text(
  //                 'LESSON $index:',
  //                 textAlign: TextAlign.center,
  //                 style: const TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ),
  //
  //             Expanded(
  //               child:  Text(
  //                 model.lessonTitle.toUpperCase(),
  //                 //textAlign: TextAlign.start,
  //                 style:const TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.w300,
  //                   color: Colors.white,
  //                 ),
  //                 overflow: TextOverflow.ellipsis,
  //                 maxLines: 1,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget quizBuilder(BuildContext context, List<Questions> model)
  // {
  //   return GestureDetector(
  //     onTap: ()
  //     {
  //         // navigateTo(context,QuizPage(model));
  //       if(model.isNotEmpty)
  //         {
  //           navigateAndSaveRouteSettings(context, QuizPage(model), 'quiz');
  //         }
  //       else if (model.isEmpty)
  //         {
  //           defaultToast(msg: 'Quiz is in development');
  //         }
  //     },
  //     child: Padding(
  //       padding: const EdgeInsetsDirectional.only(top:8.0),
  //       child: Container(
  //         padding: const EdgeInsetsDirectional.only(end: 1 ,start: 1),
  //         height: 60,
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(5),
  //             color: Colors.grey
  //         ),
  //         child: Column(
  //           children:const
  //           [
  //             Expanded(
  //               child: Text(
  //                 'QUIZ',
  //                 textAlign: TextAlign.center,
  //                 style:TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ),
  //
  //             Expanded(
  //               child:  Text(
  //                 'TEST YOURSELF IN THIS UNIT',
  //                 //textAlign: TextAlign.start,
  //                 style:TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.w300,
  //                   color: Colors.white,
  //                 ),
  //                 overflow: TextOverflow.ellipsis,
  //                 maxLines: 1,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget defaultButtonItem({
    required void Function()? function,
    required String mainText,
    required IconData icon,
    Color backgroundColor= Colors.redAccent,
    Color iconColor= Colors.redAccent
  }) =>
      InkWell(
        borderRadius: BorderRadius.circular(20),
        highlightColor: Colors.grey.withOpacity(0.5),
        onTap: function,
        child: Container(
          width: 130,
          height: 130,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 28,
                ),
              ),

              Text(
                mainText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
}
