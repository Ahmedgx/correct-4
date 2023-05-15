class Assets {
  const Assets._();
  static const String ASSETS_IMAGES_LOGO_PNG = 'assets/images/app_logo.png';
}

class Apis {
  const Apis._();
  //  Bases
  static const String baseUrl = 'https://dev-timetracker.air2o.com/';
  // static const String baseUrl = 'https://api-timetracker.air2o.com/';
  static const String userEndpointsBase = 'users/';
  static const String notificationsEndpointsBase = '/notifications/';
  // Auth DONE
  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String resetPasswordRequest = 'auth/password-reset-request';
  static const String emailConfirmationRequest =
      'auth/confirmation-email-request';
  static const String refreshToken = 'auth/refresh';
  static const String logout = 'auth/logout';
  //  Notification
  static const String setUserFCM = '/add-fcm-token';
  static const String markNotificationsAsSeen = '/notifications/mark-as-seen';
  static const String deleteNotification = '/delete-notification';
  static const String deleteAllNotifications = '/delete-all';
  static const String sendUserLocationAlert = '/send-location-alert';

  // User Info
  static const String getUserStatus = '/check-status';
  // User Profile
  static const String getUserProfileInfo = '/profile';
  static const String profilePicture = '/profile-picture';

  // User Actions
  static const String scanCheckIn = '/check-in';
  static const String scanCheckOut = '/check-out';

  // Projects
  static const String ScanProjectQR = '/scan-project';
  static const String startWorkSession = '/start-work-session';
  static const String endUserProject = '/end-work-session';

  //  NOT YET USED
  static const String getAllowedLocations = '/locations';
  static const String submitProjectRequest = 'api/check/SubmitProjectRequest';
  static const String sendNotification = 'api/app/SendNotification';
}

class Cache {
  const Cache._();
  static const String userId = 'id';
  static const String role = 'role';
  static const String token = 'token';
  static const String tokenStorageDate = 'tokenStorageDate';
  static const String fcmToken = 'fcmToken';
  static const String refreshToken = 'refreshToken';
  static const String inLog = 'inLog';
  static const String hours = 'hours';
  static const String isPaused = 'isPaused';
  static const String currentTimerValue = 'currentTimerValue';
  static const String projectName = 'projectName';
  static const String outOfLocation = 'outOfLocation';
  static const String email = 'email';
  static const String password = 'password';
  static const String rememberMe = 'rememberMe';
}
