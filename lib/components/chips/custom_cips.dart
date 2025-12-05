import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

/// Отдельный чип с возможностью выбора
class CustomChip extends StatelessWidget {
  const CustomChip({
    required this.label,
    this.isSelected = false,
    this.onTap,
    this.height,
    super.key,
  });

  final String label;
  final bool isSelected;
  final void Function()? onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 40,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.grey100,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: isSelected ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}

/// Группа чипов с поддержкой одиночного или множественного выбора
class CustomChips extends StatefulWidget {
  const CustomChips({
    required this.items,
    this.onSelectionChanged,
    this.initialSelection,
    this.multipleSelection = false,
    this.spacing = 10,
    this.wrap = true,
    super.key,
  });

  /// Список элементов для отображения
  final List<String> items;

  /// Callback при изменении выбора
  /// Для одиночного выбора: возвращает выбранный индекс или null
  /// Для множественного выбора: возвращает список выбранных индексов
  final void Function(dynamic selection)? onSelectionChanged;

  /// Начальный выбор
  /// Для одиночного выбора: int (индекс)
  /// Для множественного выбора: List<int> (индексы)
  final dynamic initialSelection;

  /// Режим множественного выбора (true) или одиночного (false)
  final bool multipleSelection;

  /// Расстояние между чипами
  final double spacing;

  /// Обернуть чипы в Wrap (true) или отобразить в Row (false)
  final bool wrap;

  @override
  State<CustomChips> createState() => _CustomChipsState();
}

class _CustomChipsState extends State<CustomChips> {
  late dynamic _selection;

  @override
  void initState() {
    super.initState();
    if (widget.multipleSelection) {
      _selection = widget.initialSelection is List<int>
          ? List<int>.from(widget.initialSelection)
          : <int>[];
    } else {
      _selection = widget.initialSelection is int ? widget.initialSelection : null;
    }
  }

  void _handleChipTap(int index) {
    setState(() {
      if (widget.multipleSelection) {
        final selectedList = _selection as List<int>;
        if (selectedList.contains(index)) {
          selectedList.remove(index);
        } else {
          selectedList.add(index);
        }
        _selection = List<int>.from(selectedList);
      } else {
        _selection = _selection == index ? null : index;
      }
      widget.onSelectionChanged?.call(_selection);
    });
  }

  bool _isSelected(int index) {
    if (widget.multipleSelection) {
      return (_selection as List<int>).contains(index);
    } else {
      return _selection == index;
    }
  }

  @override
  Widget build(BuildContext context) {
    final chips = List.generate(
      widget.items.length,
      (index) => CustomChip(
        label: widget.items[index],
        isSelected: _isSelected(index),
        onTap: () => _handleChipTap(index),
      ),
    );

    if (widget.wrap) {
      return Wrap(
        spacing: widget.spacing,
        runSpacing: widget.spacing,
        children: chips,
      );
    } else {
      return Row(
        children: chips
            .expand((chip) => [
                  chip,
                  if (chip != chips.last) SizedBox(width: widget.spacing),
                ])
            .toList(),
      );
    }
  }
}

