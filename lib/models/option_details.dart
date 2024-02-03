class OptionDetails {
  int? id;
  int? questionId;
  String? option;
  int? isAnswer;

  OptionDetails({
    this.id,
    this.questionId,
    this.option,
    this.isAnswer,
  });

  OptionDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    questionId = json['questionId'] ?? 0;
    option = json['option'] ?? "";
    isAnswer = json['isAnswer'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['questionId'] = questionId;
    data['option'] = option;
    data['isAnswer'] = isAnswer ?? 0;
    return data;
  }
}
