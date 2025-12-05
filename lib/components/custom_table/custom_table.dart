import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

/// Модель пагинации
class TablePagination {
  final int total;
  final int limit;
  final int page;
  final int pages;

  const TablePagination({
    required this.total,
    required this.limit,
    required this.page,
    required this.pages,
  });
}

/// Колонка таблицы
class TableColumn<T> {
  final String title;
  final String Function(T item) dataExtractor;
  final double? width;
  final Widget Function(T item)? customBuilder;

  const TableColumn({
    required this.title,
    required this.dataExtractor,
    this.width,
    this.customBuilder,
  });
}

/// Кастомная таблица с адаптивным дизайном
class CustomTable<T> extends StatelessWidget {
  final List<TableColumn<T>> columns;
  final List<T> data;
  final bool showHeader;
  final double? height;
  final Color? headerBackgroundColor;
  final Color? rowBackgroundColor;
  final Color? alternateRowBackgroundColor;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final bool enableHorizontalScroll;
  final double? minWidth;
  final Function()? onExport;
  final Function(int index)? onTap;
  final TablePagination? pagination;
  final Function(int page)? onPageChanged;

  const CustomTable({
    super.key,
    required this.columns,
    required this.data,
    this.showHeader = true,
    this.height,
    this.headerBackgroundColor,
    this.rowBackgroundColor,
    this.alternateRowBackgroundColor,
    this.padding,
    this.borderRadius,
    this.border,
    this.enableHorizontalScroll = true,
    this.minWidth,
    this.onExport,
    this.onTap,
    this.pagination,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Рассчитываем минимальную ширину таблицы
    final calculatedMinWidth = minWidth ?? _calculateMinWidth();

    Widget tableWidget = _buildTable();

    // Если включен горизонтальный скролл и таблица шире экрана
    if (enableHorizontalScroll && calculatedMinWidth > screenWidth) {
      final scrollController = ScrollController();
      tableWidget = Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        trackVisibility: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            child: SizedBox(width: calculatedMinWidth, child: tableWidget),
          ),
        ),
      );
    }

    return Container(
      height: height, // Если height не задан, контейнер адаптируется к контенту
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        border: border ?? Border.all(color: AppColors.grey100),
      ),
      child: Column(
        spacing: AppSizing.spaceBtwSection,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          screenWidth > 550
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [..._buildActionWidgets()],
                )
              : Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [..._buildActionWidgets()],
                ),
          tableWidget,
          if (pagination != null) _buildPagination(),
        ],
      ),
    );
  }

  Widget _buildTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [if (showHeader) _buildHeader(), _buildBody()],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: headerBackgroundColor ?? AppColors.grey100,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        spacing: AppSizing.spaceBtwSection,
        children: columns.map((column) {
          return Expanded(
            flex: column.width != null ? 0 : 1,
            child: SizedBox(
              width: column.width,
              child: Text(
                column.title,
                style: AppTypography.grey16w400.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBody() {
    if (data.isEmpty) {
      return EmtyContainer();
    }

    return Column(
      children: List.generate(data.length, (index) {
        final item = data[index];
        final isEven = index % 2 == 0;

        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              color: isEven
                  ? (alternateRowBackgroundColor ?? AppColors.white)
                  : (rowBackgroundColor ?? AppColors.grey100),
              child: InkWell(
                onTap: onTap != null ? () => onTap!(index) : null,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppSizing.spaceBtwSection,
                  children: columns.map((column) {
                    return Expanded(
                      flex: column.width != null ? 0 : 1,
                      child: SizedBox(
                        width: column.width,
                        child: column.customBuilder != null
                            ? column.customBuilder!(item)
                            : Text(
                                column.dataExtractor(item),
                                style: AppTypography.grey14w500.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            if (index < data.length - 1)
              const Divider(height: 1, color: AppColors.grey100),
          ],
        );
      }),
    );
  }

  List<Widget> _buildActionWidgets() {
    return [
      Text(
        'Найденные записи: ${data.length}',
        style: AppTypography.black20w400,
      ),
      if (onExport != null)
        PrimaryButton(
          text: 'Экспортировать в Excel',
          onPressed: onExport ?? () {},
        ),
    ];
  }

  double _calculateMinWidth() {
    double totalWidth = 0;
    for (final column in columns) {
      if (column.width != null) {
        totalWidth += column.width!;
      } else {
        totalWidth += 120;
      }
    }
    return totalWidth;
  }

  Widget _buildPagination() {
    if (pagination == null || onPageChanged == null) {
      return const SizedBox.shrink();
    }

    final currentPage = pagination!.page;
    final totalPages = pagination!.pages;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Предыдущая страница
        IconButton(
          onPressed: currentPage > 1
              ? () => onPageChanged!(currentPage - 1)
              : null,
          icon: const Icon(Icons.chevron_left),
          color: currentPage > 1 ? AppColors.black : AppColors.grey100,
        ),
        const SizedBox(width: 8),
        // Информация о странице
        Text(
          'Страница $currentPage из $totalPages',
          style: AppTypography.grey14w500,
        ),
        const SizedBox(width: 8),
        // Следующая страница
        IconButton(
          onPressed: currentPage < totalPages
              ? () => onPageChanged!(currentPage + 1)
              : null,
          icon: const Icon(Icons.chevron_right),
          color: currentPage < totalPages ? AppColors.black : AppColors.grey100,
        ),
      ],
    );
  }
}
