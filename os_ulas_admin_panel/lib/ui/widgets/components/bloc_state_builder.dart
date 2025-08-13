import '../../../base/base_cubit/base_state.dart';
import '../../../base/enums/state_type.dart';
import '../../../export.dart';

class BlocStateBuilder<T> extends StatelessWidget {
  const BlocStateBuilder({
    super.key,
    required this.cubit,
    required this.successBuilder,
    this.onRetry,
    this.loadingWidget,
    this.emptyWidget,
    this.errorWidget,
  });

  final BlocBase<BaseState<T>> cubit;
  final Widget Function(T data) successBuilder;
  final VoidCallback? onRetry;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, BaseState<T> state) {
        switch (state.type) {
          case StateType.loading:
            return loadingWidget ??
                const Center(child: CircularProgressIndicator());

          case StateType.success:
            return successBuilder(state.data as T);

          case StateType.error:
            return errorWidget ??
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 48,
                        color: ColorName.redRibbon,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Hata: ${state.message}',
                        style: TextStyle(color: ColorName.redRibbon),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: onRetry,
                        child: const Text('Tekrar Dene'),
                      ),
                    ],
                  ),
                );

          case StateType.empty:
            return emptyWidget ?? const Center(child: Text('Veri bulunamadı'));
        }
      },
    );
  }
}
