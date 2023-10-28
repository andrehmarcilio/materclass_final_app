import '../model/activity.dart';

class ActivitiesRouterConfiguration {
  Activity? selectedActivity;

  void selectActivity(Activity activity) {
    selectedActivity = activity;
  }

  void unselectActivity() {
    selectedActivity = null;
  }
}
