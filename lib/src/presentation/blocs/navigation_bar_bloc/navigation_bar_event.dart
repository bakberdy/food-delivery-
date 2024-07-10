part of 'navigation_bar_bloc.dart';

@immutable
abstract class NavigationBarEvent {}

class TabChange extends NavigationBarEvent{
  final int tabIndex;

  TabChange({required this.tabIndex});
}
