import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numb_master/core/config/localization/locale_bundle.dart';
import 'package:numb_master/core/config/localization/localization.dart';
import 'package:numb_master/core/config/navigation/router.gr.dart';
import 'package:numb_master/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:numb_master/features/authentication/presentation/widgets/page_header.dart';
import 'package:numb_master/core/util/extensions/string_extensions.dart';
import 'package:numb_master/features/courses/domain/entities/course.dart';
import 'package:numb_master/features/courses/presentation/widgets/course_card_widget.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LocaleBundle localeBundle = Localization.of(context)!.bundle!;
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.type == AuthenticationStateType.logged_out) {
          AutoRouter.of(context).popUntilRoot();
          AutoRouter.of(context).push(WelcomePageRoute());
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPageHeaderWithTabBar(context, localeBundle),
              Flexible(
                child: TabBarView(
                  children: [
                    Center(child: Text('My courses page')),
                    Center(child: Text('My courses page')),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(onPressed: () => BlocProvider.of<AuthenticationBloc>(context).add(LogOutEvent()), child: Text('logout')),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 20,
                              runSpacing: 20,
                              children: List.generate(
                                  7,
                                  (index) => CourseCardWidget(
                                        course: Course(
                                          languageCode: 'FR',
                                          languageName: 'French',
                                          welcomeText: 'Ca va bien?'
                                        ),
                                      )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageHeaderWithTabBar(BuildContext context, LocaleBundle localeBundle){
    final User currentUser = BlocProvider.of<AuthenticationBloc>(context).state.loggerUser!;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: localeBundle.welcomeUser(currentUser.email!.removeEmailDomain()),
            subtitle: localeBundle.dashboardSubtitle,
          ),
          SizedBox(height: 10.0),
          TabBar(
            tabs: [Tab(text: 'Dashboard'), Tab(text: 'My lessons'), Tab(text: 'All courses')],
          )
        ],
      ),
    );
  }
}


