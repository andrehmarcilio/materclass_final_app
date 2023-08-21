import '../../../../utils/assets.dart' as assets;
import '../model/activity.dart';

final activies = <Activity>[
  Activity(
    id: 1,
    title: 'Animações',
    repoUrl: 'https://github.com/andrehmarcilio/movies-app',
    iconPath: assets.icRunning,
    description: 'Estudos sobre animações implícitas e controladas, contendo 4 exercícios e 2 estudos',
    exercicesCount: 2,
  ),
  Activity(
    id: 2,
    title: 'Leitura de Mockup',
    repoUrl: 'https://github.com/andrehmarcilio/movies-app',
    iconPath: assets.icGlasses,
    description: 'Aplicação da técnica de leitura de mockup, contendo 2 exercícios',
    exercicesCount: 2,
  ),
  Activity(
    id: 3,
    title: 'Playground',
    repoUrl: 'https://github.com/andrehmarcilio/movies-app',
    iconPath: assets.icToys,
    description: 'Ambiente destinado a testes e estudos em geral',
    exercicesCount: 3,
  ),
];
