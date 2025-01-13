import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social/app/app_provider.dart';
import 'package:social/routes/app_routes.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends ConsumerState with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    ref.read(appProvider.notifier).didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
      title: "Social network",
      debugShowCheckedModeBanner: true,
      key: ref.read(appProvider.notifier).navigationKey,
      scaffoldMessengerKey:
          ref.read(appProvider.notifier).scaffoldMessengerState,
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF57D00),
        ),
      ),
      builder: (context, child) => Stack(
        children: [
          child!,
          Consumer(builder: (context, ref, child) {
            final isLoading =
                ref.watch(appProvider.select((state) => state.isLoading)) ??
                    false;
            return isLoading
                ? Positioned.fill(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: isLoading ? 1 : 0,
                      child: Container(
                        color: Colors.black.withOpacity(0.1),
                        child: Center(
                          child: LoadingAnimationWidget.inkDrop(
                            size: 20,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox();
          })
        ],
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
}
