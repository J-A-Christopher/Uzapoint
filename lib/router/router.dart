import 'package:go_router/go_router.dart';
import 'package:uza_point/common/widgets/home_screen.dart';

final goRouter = GoRouter(initialLocation: '/',routes: [
  GoRoute(path: '/',builder: (context, state)=>const HomeScreen())
]);
