import 'package:get/get.dart';

import '../modules/about_restaurant/bindings/about_restaurant_binding.dart';
import '../modules/about_restaurant/views/about_restaurant_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/delivery/bindings/delivery_binding.dart';
import '../modules/delivery/views/delivery_view.dart';
import '../modules/dish_deatails/bindings/dish_deatails_binding.dart';
import '../modules/dish_deatails/views/dish_deatails_view.dart';
import '../modules/enable_location/bindings/enable_location_binding.dart';
import '../modules/enable_location/views/enable_location_view.dart';
import '../modules/events/bindings/events_binding.dart';
import '../modules/events/views/events_view.dart';
import '../modules/gathering/bindings/gathering_binding.dart';
import '../modules/gathering/views/gathering_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/navbar/bindings/navbar_binding.dart';
import '../modules/navbar/views/navbar_view.dart';
import '../modules/navigation/bindings/navigation_binding.dart';
import '../modules/navigation/views/navigation_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/profile_setup/bindings/profile_setup_binding.dart';
import '../modules/profile_setup/views/profile_setup_view.dart';
import '../modules/reels/bindings/reels_binding.dart';
import '../modules/reels/views/reels_view.dart';
import '../modules/report/bindings/report_binding.dart';
import '../modules/report/views/report_view.dart';
import '../modules/reservation/bindings/reservation_binding.dart';
import '../modules/reservation/views/reservation_view.dart';
import '../modules/reservation_confirmation/bindings/reservation_confirmation_binding.dart';
import '../modules/reservation_confirmation/views/reservation_confirmation_view.dart';
import '../modules/restaurant/bindings/restaurant_binding.dart';
import '../modules/restaurant/views/restaurant_view.dart';
import '../modules/restaurant_details/bindings/restaurant_details_binding.dart';
import '../modules/restaurant_details/views/restaurant_details_view.dart';
import '../modules/restaurant_menu/bindings/restaurant_menu_binding.dart';
import '../modules/restaurant_menu/views/restaurant_menu_view.dart';
import '../modules/restaurant_photos/bindings/restaurant_photos_binding.dart';
import '../modules/restaurant_photos/views/restaurant_photos_view.dart';
import '../modules/restaurant_review/bindings/restaurant_review_binding.dart';
import '../modules/restaurant_review/views/restaurant_review_view.dart';
import '../modules/ride_request/bindings/ride_request_binding.dart';
import '../modules/ride_request/views/ride_request_view.dart';
import '../modules/share_followers/bindings/share_followers_binding.dart';
import '../modules/share_followers/views/share_followers_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/signup_success/bindings/signup_success_binding.dart';
import '../modules/signup_success/views/signup_success_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NAVIGATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => const NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_SUCCESS,
      page: () => const SignupSuccessView(),
      binding: SignupSuccessBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SETUP,
      page: () => const ProfileSetupView(),
      binding: ProfileSetupBinding(),
    ),
    GetPage(
      name: _Paths.ENABLE_LOCATION,
      page: () => const EnableLocationView(),
      binding: EnableLocationBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURANT,
      page: () => const RestaurantView(),
      binding: RestaurantBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURANT_REVIEW,
      page: () => const RestaurantReviewView(),
      binding: RestaurantReviewBinding(),
    ),
    // GetPage(
    //   name: _Paths.REELS,
    //   page: () =>  ReelsView(),
    //   binding: ReelsBinding(),
    // ),
    GetPage(
      name: _Paths.RESTAURANT_DETAILS,
      page: () => const RestaurantDetailsView(),
      binding: RestaurantDetailsBinding(),
    ),
    GetPage(
      name: _Paths.RESERVATION,
      page: () => const ReservationView(),
      binding: ReservationBinding(),
    ),
    GetPage(
      name: _Paths.RESERVATION_CONFIRMATION,
      page: () => const ReservationConfirmationView(),
      binding: ReservationConfirmationBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURANT_MENU,
      page: () => const RestaurantMenuView(),
      binding: RestaurantMenuBinding(),
    ),
    GetPage(
      name: _Paths.DISH_DEATAILS,
      page: () => const DishDeatailsView(),
      binding: DishDeatailsBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURANT_PHOTOS,
      page: () => const RestaurantPhotosView(),
      binding: RestaurantPhotosBinding(),
    ),
    GetPage(
      name: _Paths.SHARE_FOLLOWERS,
      page: () => const ShareFollowersView(),
      binding: ShareFollowersBinding(),
    ),
    GetPage(
      name: _Paths.RIDE_REQUEST,
      page: () => const RideRequestView(),
      binding: RideRequestBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY,
      page: () => const DeliveryView(),
      binding: DeliveryBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_RESTAURANT,
      page: () => const AboutRestaurantView(),
      binding: AboutRestaurantBinding(),
    ),
    GetPage(
      name: _Paths.EVENTS,
      page: () => const EventsView(),
      binding: EventsBinding(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => const ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.GATHERING,
      page: () => const GatheringView(),
      binding: GatheringBinding(),
    ),
  ];
}
