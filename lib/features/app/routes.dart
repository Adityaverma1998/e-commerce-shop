import 'package:ecoomerce_shop/features/home/presentation/screen/home.dart';
import 'package:go_router/go_router.dart';

class AppRouter{

  GoRouter generateRouter(){
    return GoRouter(
    routes: [
      GoRoute(path: '/',builder: (context, state){
        return const HomeScreen();
      })
    ]
    );
  }
}