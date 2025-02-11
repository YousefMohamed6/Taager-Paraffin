part of 'on_board_cubit.dart';

@freezed
class OnBoardState<T> with _$OnBoardState<T> {
  const factory OnBoardState.initial() = Initial;
  const factory OnBoardState.loading() = Loading;
  const factory OnBoardState.success(T data) = Success;
  const factory OnBoardState.failure(String message) = Failure;
}
