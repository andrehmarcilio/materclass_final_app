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
      Exercice(id: 1, title: 'Fun Container', routePath: '/exercice_1'),
      Exercice(id: 2, title: 'Custom Expansion Tile', routePath: '/exercice_2'),
    ],
  ),
  Activity(
    id: 2,
    title: 'Leitura de Mockup',
    repoUrl: 'https://github.com/andrehmarcilio/movies-app',
    iconPath: assets.icGlasses,
    description: 'Aplicação da técnica de leitura de mockup, contendo 2 exercícios',
    exercices: [
      Exercice(id: 3, title: 'Tinder', routePath: '/tinder'),
      Exercice(id: 4, title: 'Money', routePath: '/money'),
    ],
  ),
  Activity(
    id: 3,
    title: 'Playground',
    repoUrl: 'https://github.com/andrehmarcilio/movies-app',
    iconPath: assets.icToys,
    description: 'Ambiente destinado a testes e estudos em geral',
    exercices: [
      Exercice(id: 5, title: 'ENV reader', routePath: '/env_reader'),
      Exercice(id: 6, title: 'Encriptor', routePath: '/encriptor'),
      Exercice(id: 7, title: 'YML Reader', routePath: '/yml_reader'),
    ],
  ),
];
