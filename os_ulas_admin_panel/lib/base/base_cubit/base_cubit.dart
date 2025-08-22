import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:os_ulas_admin_panel/base/base_cubit/base_state.dart';

/// A generic Cubit class.
/// It uses BaseState<T> type as state.
/// Type T indicates the data type in the success state.
class BaseCubit<T> extends Cubit<BaseState<T>> {
  /// Sets the initial state to empty.
  BaseCubit() : super(const EmptyState());

  /// Emits the loading status.
  void emitLoading() => emit(const LoadingState());

  /// Emits success state with optional data
  void emitSuccess([T? data]) => emit(SuccessState<T>(data));

  /// It emits an error status and an error message.
  void emitError(String message) => emit(ErrorState<T>(message));
}
