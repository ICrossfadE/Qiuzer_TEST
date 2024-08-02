import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

part 'question_index_state.dart';

class QuestionCubit extends HydratedCubit<QuestionCubitState> {
  QuestionCubit() : super(const QuestionCubitState());

  void updateState({int? index, int? trueScore, int? falseScore}) {
    emit(state.copyWith(
      index: index ?? state.index,
      trueScore: trueScore ?? state.trueScore,
      falseScore: falseScore ?? state.falseScore,
    ));
  }

  void incrementTrueScore() {
    updateState(trueScore: state.trueScore + 1);
  }

  void incrementFalseScore() {
    updateState(falseScore: state.falseScore + 1);
  }

  @override
  QuestionCubitState? fromJson(Map<String, dynamic> json) {
    return QuestionCubitState(
      index: json['index'] as int? ?? 0,
      trueScore: json['trueScore'] as int? ?? 0,
      falseScore: json['falseScore'] as int? ?? 0,
    );
  }

  @override
  Map<String, dynamic>? toJson(QuestionCubitState state) {
    return {
      'index': state.index,
      'trueScore': state.trueScore,
      'falseScore': state.falseScore,
    };
  }
}
