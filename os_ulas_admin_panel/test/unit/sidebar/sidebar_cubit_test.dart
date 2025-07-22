import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:os_ulas_admin_panel/viewmodel/sidebar/sidebar_cubit.dart';
import 'package:os_ulas_admin_panel/viewmodel/sidebar/sidebar_state.dart';

void main() {
  group('SidebarCubit', () {
    late SidebarCubit cubit;

    setUp(() {
      cubit = SidebarCubit();
    });

    tearDown(() {
      cubit.close();
    });

    test('initial state is SidebarState(selectedIndex: 0)', () {
      expect(cubit.state, const SidebarState(selectedIndex: 0));
    });

    group('selectIndex', () {
      blocTest<SidebarCubit, SidebarState>(
        'emits updated selectedIndex when selectIndex is called',
        build: () => SidebarCubit(),
        act: (cubit) => cubit.selectIndex(2),
        expect: () => [const SidebarState(selectedIndex: 2)],
      );
    });

    group('setHover', () {
      blocTest<SidebarCubit, SidebarState>(
        'emits updated hoveredIndex when setHover is called with non-null value',
        build: () => SidebarCubit(),
        act: (cubit) => cubit.setHover(1),
        expect: () => [const SidebarState(selectedIndex: 0, hoveredIndex: 1)],
      );

      blocTest<SidebarCubit, SidebarState>(
        'clears hoveredIndex when setHover is called with null',
        build: () => SidebarCubit(),
        act: (cubit) => cubit.setHover(null),
        expect: () => [
          const SidebarState(selectedIndex: 0, hoveredIndex: null),
        ],
      );
    });
  });
}
