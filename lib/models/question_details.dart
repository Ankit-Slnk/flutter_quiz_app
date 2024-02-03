import 'package:quizapp/models/option_details.dart';

class QuestionDetails {
  int? id;
  String? question;
  List<OptionDetails>? options;

  QuestionDetails({
    this.id,
    this.question,
    this.options,
  });

  QuestionDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    question = json['question'] ?? "";
    if (json['options'] != null) {
      options = <OptionDetails>[];
      json['options'].forEach((v) {
        options!.add(OptionDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
