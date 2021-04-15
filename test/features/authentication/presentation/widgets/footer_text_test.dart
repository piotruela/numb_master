import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:numb_master/features/authentication/presentation/widgets/footer_text.dart';

import '../../../../core/test_widget.dart';
import '../../../../core/utils.dart';

void main() {
  final String questionText = 'Are you winning son?';
  final String clickableText = 'Yep.';

  RichText richTextWidgetFinder(WidgetTester tester){
    return tester.firstWidget(find.byType(RichText)) as RichText;
  }

  testWidgets('should have all the necessary texts', (WidgetTester tester) async {
    //arrange
    await tester.pumpWidget(
      TestWidget(
        child: Scaffold(
          body: FooterText(questionText: questionText, clickableText: clickableText, onTextClicked: () => {}),
        ),
      ),
    );

    //act
    await tester.pumpAndSettle();

    //assert
    expect(richTextWidgetFinder(tester).text.toPlainText(), questionText+clickableText);
  });

  testWidgets('should call passed function', (WidgetTester tester) async {
    //arrange
    final completer = Completer();

    await tester.pumpWidget(
      TestWidget(
        child: Scaffold(
          body: Center(
            child:
                FooterText(questionText: questionText, clickableText: clickableText, onTextClicked: completer.complete),
          ),
        ),
      ),
    );

    //act
    TestUtils.tapTextSpan(richTextWidgetFinder(tester), clickableText);
    await tester.pumpAndSettle();

    //assert
    expect(completer.isCompleted, true);
  });


}
