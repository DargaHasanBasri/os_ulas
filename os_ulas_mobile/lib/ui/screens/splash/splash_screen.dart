import 'package:os_ulas_mobile/ui/widgets/custom_text_form_field.dart';
import 'package:os_ulas_mobile/utils/constants/app_decorations.dart';

import '../../../export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.largeAll,
          child: Column(
            children: [
              Assets.icons.icError.image(
                package: 'gen',
              ),
              Padding(
                padding: AppPaddings.mediumVertical,
                child: CustomTextFormField(
                  textInputAction: TextInputAction.done,
                  hintText: 'Ad Soyad',
                ),
              ),
              Padding(
                padding: AppPaddings.mediumVertical,
                child: CustomButton(
                  titleGradient: 'Geçmiş Geri Bildirimlerim',
                  onTap: () {},
                  buttonDefaultDecoration: AppDecorations.defaultDecoration(),
                  buttonBorderDecoration:
                      AppDecorations.borderGradientDecoration(),
                ),
              ),
              CustomButton(
                titleDefault: 'Gönder',
                onTap: () {},
                buttonDefaultDecoration:
                    AppDecorations.gradientShadowDecoration(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
