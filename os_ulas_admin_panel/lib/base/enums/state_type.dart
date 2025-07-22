/// This enum is used to specify the state of Cubit or Bloc in a type-safe way.
/// [empty] No action taken, waiting for data, or reset state.
/// [loading] Data or a transaction is being loaded, and the user is given a message to wait.
/// [success] The operation completed successfully, the data is ready and usable.
/// [error] An error occurred during the operation, an error message is displayed to the user.

enum StateType {
  empty,
  loading,
  success,
  error,
}
