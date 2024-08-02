part of 'question_index_cubit.dart';

final class QuestionCubitState extends Equatable {
  final int index;
  final int trueScore;
  final int falseScore;

  const QuestionCubitState({
    this.index = 0,
    this.trueScore = 0,
    this.falseScore = 0,
  });

  QuestionCubitState copyWith({
    int? index,
    int? trueScore,
    int? falseScore,
  }) {
    return QuestionCubitState(
      index: index ?? this.index,
      trueScore: trueScore ?? this.trueScore,
      falseScore: falseScore ?? this.falseScore,
    );
  }

  @override
  List<Object?> get props => [index, trueScore, falseScore];
}
