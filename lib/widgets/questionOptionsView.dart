import 'package:flutter/material.dart';
import 'package:quizapp/models/question_details.dart';

class QuestionOptionsView extends StatelessWidget {
  final QuestionDetails questionDetails;
  final int groupValue;
  final Function(int? value) onChanged;
  const QuestionOptionsView({
    super.key,
    required this.questionDetails,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              questionDetails.question!,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: List.generate(
                questionDetails.options!.length,
                (index) {
                  return RadioListTile<int>(
                    contentPadding: EdgeInsets.zero,
                    value: index,
                    groupValue: groupValue,
                    onChanged: (value) {
                      onChanged(value);
                    },
                    title: Text(questionDetails.options![index].option!),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
