import '../../../../utils/assets.dart' as assets;
import '../../exercices/model/exercice.dart';
import '../model/activity.dart';

final activies = <Activity>[
  Activity(
    id: 1,
    title: 'Animações',
    repoUrl: 'https://github.com/andrehmarcilio/movies-app',
    iconPath: assets.icRunning,
    description: 'Estudos sobre animações implícitas e controladas, contendo 4 exercícios e 2 estudos',
    exercices: [
      FlutterExercice(id: 1, title: 'Animações implícitas', routePath: '/implicity-animation'),
      FlutterExercice(id: 2, title: 'Animações explícitas', routePath: '/explicit-animation'),
    ],
  ),
  Activity(
    id: 2,
    title: 'Leitura de Mockup',
    repoUrl: 'https://github.com/andrehmarcilio/movies-app',
    iconPath: assets.icGlasses,
    description: 'Aplicação da técnica de leitura de mockup, contendo 2 exercícios',
    exercices: [
      FlutterExercice(id: 3, title: 'Simple login', routePath: '/simple-login'),
      FlutterExercice(id: 3, title: 'Facebook', routePath: '/facebook'),
      FlutterExercice(id: 4, title: 'Money Control', routePath: '/money-control'),
    ],
  ),
  Activity(
    id: 3,
    title: 'Playground',
    repoUrl: 'https://github.com/andrehmarcilio/movies-app',
    iconPath: assets.icToys,
    description: 'Ambiente destinado a testes e estudos em geral',
    exercices: [
      DartExercice(id: 6, title: 'Encriptor', githubUrl: '/encriptor'),
      DartExercice(id: 7, title: 'YML Reader', githubUrl: '/yml_reader'),
    ],
  ),
];
