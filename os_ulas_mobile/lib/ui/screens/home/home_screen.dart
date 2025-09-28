import 'export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with HomeScreenMixin {
  @override
  void initState() {
    super.initState();
    loadMapAndShowTooltip();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBody: true,
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: _appBarTitle(),
        leading: _appBarLeading(),
        actions: _appBarActions(),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      body: Stack(
        children: [
          currentPosition == null
              ? const Center(child: CircularProgressIndicator())
              : HomeGoogleMap(
                currentPosition: currentPosition,
                osmaniyeBounds: osmaniyeBounds,
                mapController: mapController,
                mapStyle: mapStyle,
                onMapCreated: (controller) => mapController,
              ),
          Padding(
            padding: AppPaddings.smallAll,
            child: CustomSearchBar(
              searchTextEditingController: searchTextEditingController,
              filterIconTap: () {},
            ),
          ),
          Positioned(
            top: 80,
            right: 16,
            child: CustomFeedbackButton(
              feedbackTooltipKey: feedbackTooltipKey,
              feedbackOnTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBarTitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: AppConstants.appTitleOS,
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(
          fontSize: 30,
        ),
        children: <TextSpan>[
          TextSpan(
            text: AppConstants.appTitleULAS,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(
              color: ColorName.purpleBlue,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBarLeading() {
    return GestureDetector(
      onTap: () {
        scaffoldKey.currentState?.openDrawer();
      },
      child: Assets.icons.icMenu.image(
        package: AppConstants.genPackageName,
      ),
    );
  }

  List<Widget> _appBarActions() {
    return <Widget>[
      Padding(
        padding: AppPaddings.smallRight,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).colorScheme.tertiary,
            border: Border.all(color: Colors.black),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Assets.images.imgMyProfile.image(
              package: AppConstants.genPackageName,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    ];
  }
}
