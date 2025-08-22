import '../../export.dart';

/// Defines an extension for [Future] objects.
/// It allows you to manage success and error conditions centrally.
extension FutureApiHandler<T> on Future<T> {
  Future<void> handleApiCall({
    required BuildContext context,
    void Function(T)? onSuccess,
  }) async {
    try {
      final result = await this;
      if (onSuccess != null) onSuccess(result);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("✅ İşlem başarılı")),
      );
    } on BadRequestException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Geçersiz istek: ${e.message}")),
      );
    } on UnauthorisedException {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Yetkisiz işlem")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Bir hata oluştu lütfen daha sonra tekrar deneyin"),
        ),
      );
    }
  }
}
