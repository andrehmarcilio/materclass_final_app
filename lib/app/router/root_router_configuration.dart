import '../../modules/exercices/model/exercice.dart';

class RootRouterConfiguration {
  FlutterExercice? _selectedExercice;

  void selectExercice(FlutterExercice exercice) {
    _selectedExercice = exercice;
  }

  void unselectExercice() {
    _selectedExercice = null;
  }

  FlutterExercice? get selectedExercice => _selectedExercice;
}
