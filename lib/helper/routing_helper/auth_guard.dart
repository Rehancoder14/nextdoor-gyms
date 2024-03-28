import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // bool hasSetupToken =
    //     LocalStorageService.getUserValue(UserField.setupAccountToken) != null;
    // bool hasToken = LocalStorageService.getUserValue(UserField.token) != null;

    // if (hasSetupToken) {
    //   router.replace(const SetupAccountRoute());
    // } else if (hasToken) {
    //   router.replace(const FeedRoute());
    // } else {
    //   resolver.next(true);
    // }
  }
}
