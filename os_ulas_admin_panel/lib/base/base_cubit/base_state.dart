import '../enums/state_type.dart';

/// BaseState is an abstract class that represents Cubit's states.
/// Type T is the type of data in success status.
/// Each state type is expressed by a StateType enum value.
/// [type] : Type of status (empty, loading, success, error, etc.)
/// [data] : Data regarding the situation (if applicable).
/// [message] : Status message (if any).
/// [type] is required, [data] and [message] are optional.
abstract class BaseState<T> {
  final StateType type;
  final T? data;
  final String? message;

  const BaseState({
    required this.type,
    this.data,
    this.message,
  });
}

/// It represents situations where no action has been taken,
/// no data has been loaded,or no results have been obtained in the relevant
/// part of the application.
class EmptyState<T> extends BaseState<T> {
  const EmptyState() : super(type: StateType.empty);
}

/// The app is performing a background operation (e.g., API call, database query, etc.).
/// In this case, the user is shown a loading indicator (such as a spinner or progress bar).
/// The data is not yet ready, and there are no errors. This status is used to
/// indicate that the operation is in progress.
class LoadingState<T> extends BaseState<T> {
  const LoadingState() : super(type: StateType.loading);
}

/// This status is used when you want to display a successful result to the user.
/// In this case, the successfully received data is stored in [data].
/// The [T] type here indicates the data type.
class SuccessState<T> extends BaseState<T> {
  const SuccessState([T? data]) : super(type: StateType.success, data: data);
}

/// An error occurred during the relevant operation. In this case,
/// the error message is stored in [message]. It is used to indicate to the user
/// what the error is or to perform different actions based on the error.
class ErrorState<T> extends BaseState<T> {
  const ErrorState(String message)
    : super(type: StateType.error, message: message);
}
