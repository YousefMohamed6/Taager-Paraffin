part of 'maps_cubit.dart';

@freezed
class MapsState<T> with _$MapsState<T> {
  const factory MapsState.initial() = Initial;
  const factory MapsState.loading() = Loading;
  const factory MapsState.success(T data) = Success;
  const factory MapsState.failure(String message) = Failure;
  const factory MapsState.error(String message) = Error;
}
