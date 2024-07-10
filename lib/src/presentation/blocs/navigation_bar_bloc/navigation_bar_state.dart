part of 'navigation_bar_bloc.dart';

@immutable
sealed class NavigationBarState {
  const NavigationBarState({required this.tabIndex});
  final int tabIndex;
}

final class NavigationBarInitial extends NavigationBarState {
  const NavigationBarInitial({required super.tabIndex});
}
