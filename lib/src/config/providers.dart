import 'package:blott/src/features/news/presentation/viewmodel/news_viewmodel.dart';
import 'package:get_it/get_it.dart';

import 'package:blott/src/features/auth/presentation/viewmodels/login_user_viewmodel.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider<LoginUserViewModel>(
    create: (_) => GetIt.I<LoginUserViewModel>(),
  ),
  ChangeNotifierProvider<NewsViewModel>(
    create: (_) => GetIt.I<NewsViewModel>(),
  ),
];
