import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:os_ulas_admin_panel/viewmodel/sidebar/sidebar_cubit.dart';
import 'package:os_ulas_admin_panel/viewmodel/sidebar/sidebar_state.dart';
import '../../../../../export.dart';

class SideBarItem extends StatelessWidget {
  const SideBarItem({
    super.key,
    required this.itemName,
    required this.iconBuilder,
    required this.index,
    required this.onTap,
  });

  final String itemName;
  final Widget Function(bool showHighlight) iconBuilder;
  final int index;
  final void Function(BuildContext context) onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => context.read<SidebarCubit>().setHover(index),
      onExit: (_) => context.read<SidebarCubit>().setHover(null),
      child: Material(
        child: InkWell(
          onTap: () {
            context.read<SidebarCubit>().selectIndex(index);
            onTap.call(context);
          },
          child: Ink(
            child: BlocBuilder<SidebarCubit, SidebarState>(
              builder: (context, state) {
                final isHovered = state.hoveredIndex == index;
                final isSelected = state.selectedIndex == index;
                final showHighlight = isHovered || isSelected;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      if (isSelected)
                        Container(
                          height: 40,
                          width: 6,
                          decoration: BoxDecoration(
                            color: Color(0xff4880FF),
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(16),
                            ),
                          ),
                        )
                      else
                        SizedBox(width: 6),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Container(
                            key: const Key('highlighted_background'),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: showHighlight
                                  ? Color(0xff4880FF)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                iconBuilder(showHighlight),
                                SizedBox(width: 16),
                                Text(
                                  key: const Key('sidebar_item_text'),
                                  itemName,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: showHighlight
                                        ? Color(0xffFFFFFF)
                                        : Color(0xff202224),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
