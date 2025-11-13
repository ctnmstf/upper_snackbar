import 'dart:async';

import 'package:flutter/material.dart';

/// Type of snackbar to display with predefined styles
enum SnackbarType {
  success,
  error,
  warning,
  info,
  custom,
}

/// Position of the snackbar on screen
enum SnackbarPosition {
  top,
  topLeft,
  topRight,
}

/// Style configuration for the snackbar
class SnackbarStyle {
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final IconData? icon;
  final double? borderRadius;
  final double? elevation;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final TextStyle? textStyle;
  final double? width;
  final Border? border;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;

  const SnackbarStyle({
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.icon,
    this.borderRadius,
    this.elevation,
    this.padding,
    this.margin,
    this.textStyle,
    this.width,
    this.border,
    this.boxShadow,
    this.gradient,
  });

  SnackbarStyle copyWith({
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor,
    IconData? icon,
    double? borderRadius,
    double? elevation,
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextStyle? textStyle,
    double? width,
    Border? border,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
  }) {
    return SnackbarStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      icon: icon ?? this.icon,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      textStyle: textStyle ?? this.textStyle,
      width: width ?? this.width,
      border: border ?? this.border,
      boxShadow: boxShadow ?? this.boxShadow,
      gradient: gradient ?? this.gradient,
    );
  }
}

/// Main class for displaying snackbars at the top of the screen
class UpperSnackbar {
  static final UpperSnackbar _instance = UpperSnackbar._internal();

  factory UpperSnackbar() {
    return _instance;
  }

  UpperSnackbar._internal();

  OverlayEntry? _overlayEntry;
  Timer? _timer;

  /// Shows a snackbar at the top of the screen
  ///
  /// [context] - BuildContext for overlay insertion
  /// [message] - The message to display
  /// [type] - Type of snackbar (success, error, warning, info, custom)
  /// [style] - Custom style configuration
  /// [duration] - Duration in seconds before auto-dismiss (default: 3)
  /// [position] - Position of the snackbar (default: top)
  /// [animationDuration] - Duration of slide-in animation in milliseconds (default: 400)
  /// [dismissible] - Whether the snackbar can be dismissed by tapping (default: true)
  /// [onTap] - Callback when snackbar is tapped
  /// [actionLabel] - Label for action button
  /// [onActionPressed] - Callback when action button is pressed
  /// [showCloseIcon] - Whether to show close icon (default: true)
  void show(
    BuildContext context, {
    required String message,
    SnackbarType type = SnackbarType.info,
    SnackbarStyle? style,
    int duration = 3,
    SnackbarPosition position = SnackbarPosition.top,
    int animationDuration = 400,
    bool dismissible = true,
    VoidCallback? onTap,
    String? actionLabel,
    VoidCallback? onActionPressed,
    bool showCloseIcon = true,
  }) {
    _overlayEntry?.remove();
    _timer?.cancel();

    if (!context.mounted) return;

    final resolvedStyle = _resolveStyle(context, type, style);

    _overlayEntry = _createOverlayEntry(
      context,
      message,
      resolvedStyle,
      position,
      animationDuration,
      dismissible,
      onTap,
      actionLabel,
      onActionPressed,
      showCloseIcon,
    );

    final overlay = Overlay.of(context);
    overlay.insert(_overlayEntry!);

    _timer = Timer(Duration(seconds: duration), () {
      hide();
    });
  }

  /// Shows a success snackbar
  void showSuccess(
    BuildContext context, {
    required String message,
    SnackbarStyle? style,
    int duration = 3,
    SnackbarPosition position = SnackbarPosition.top,
    bool dismissible = true,
    VoidCallback? onTap,
    String? actionLabel,
    VoidCallback? onActionPressed,
    bool showCloseIcon = true,
  }) {
    show(
      context,
      message: message,
      type: SnackbarType.success,
      style: style,
      duration: duration,
      position: position,
      dismissible: dismissible,
      onTap: onTap,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      showCloseIcon: showCloseIcon,
    );
  }

  /// Shows an error snackbar
  void showError(
    BuildContext context, {
    required String message,
    SnackbarStyle? style,
    int duration = 3,
    SnackbarPosition position = SnackbarPosition.top,
    bool dismissible = true,
    VoidCallback? onTap,
    String? actionLabel,
    VoidCallback? onActionPressed,
    bool showCloseIcon = true,
  }) {
    show(
      context,
      message: message,
      type: SnackbarType.error,
      style: style,
      duration: duration,
      position: position,
      dismissible: dismissible,
      onTap: onTap,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      showCloseIcon: showCloseIcon,
    );
  }

  /// Shows a warning snackbar
  void showWarning(
    BuildContext context, {
    required String message,
    SnackbarStyle? style,
    int duration = 3,
    SnackbarPosition position = SnackbarPosition.top,
    bool dismissible = true,
    VoidCallback? onTap,
    String? actionLabel,
    VoidCallback? onActionPressed,
    bool showCloseIcon = true,
  }) {
    show(
      context,
      message: message,
      type: SnackbarType.warning,
      style: style,
      duration: duration,
      position: position,
      dismissible: dismissible,
      onTap: onTap,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      showCloseIcon: showCloseIcon,
    );
  }

  /// Shows an info snackbar
  void showInfo(
    BuildContext context, {
    required String message,
    SnackbarStyle? style,
    int duration = 3,
    SnackbarPosition position = SnackbarPosition.top,
    bool dismissible = true,
    VoidCallback? onTap,
    String? actionLabel,
    VoidCallback? onActionPressed,
    bool showCloseIcon = true,
  }) {
    show(
      context,
      message: message,
      type: SnackbarType.info,
      style: style,
      duration: duration,
      position: position,
      dismissible: dismissible,
      onTap: onTap,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      showCloseIcon: showCloseIcon,
    );
  }

  /// Hides the currently displayed snackbar
  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _timer?.cancel();
    _timer = null;
  }

  SnackbarStyle _resolveStyle(
    BuildContext context,
    SnackbarType type,
    SnackbarStyle? customStyle,
  ) {
    SnackbarStyle defaultStyle;

    switch (type) {
      case SnackbarType.success:
        defaultStyle = SnackbarStyle(
          backgroundColor: const Color(0xFF4CAF50),
          textColor: Colors.white,
          iconColor: Colors.white,
          icon: Icons.check_circle_outline,
        );
        break;
      case SnackbarType.error:
        defaultStyle = SnackbarStyle(
          backgroundColor: const Color(0xFFF44336),
          textColor: Colors.white,
          iconColor: Colors.white,
          icon: Icons.error_outline,
        );
        break;
      case SnackbarType.warning:
        defaultStyle = SnackbarStyle(
          backgroundColor: const Color(0xFFFF9800),
          textColor: Colors.white,
          iconColor: Colors.white,
          icon: Icons.warning_amber_outlined,
        );
        break;
      case SnackbarType.info:
        defaultStyle = SnackbarStyle(
          backgroundColor: const Color(0xFF2196F3),
          textColor: Colors.white,
          iconColor: Colors.white,
          icon: Icons.info_outline,
        );
        break;
      case SnackbarType.custom:
        defaultStyle = SnackbarStyle(
          backgroundColor: Theme.of(context).colorScheme.primary,
          textColor: Theme.of(context).colorScheme.onPrimary,
          iconColor: Theme.of(context).colorScheme.onPrimary,
          icon: Icons.info_outline,
        );
        break;
    }

    if (customStyle == null) return defaultStyle;

    return SnackbarStyle(
      backgroundColor:
          customStyle.backgroundColor ?? defaultStyle.backgroundColor,
      textColor: customStyle.textColor ?? defaultStyle.textColor,
      iconColor: customStyle.iconColor ?? defaultStyle.iconColor,
      icon: customStyle.icon ?? defaultStyle.icon,
      borderRadius: customStyle.borderRadius ?? 12.0,
      elevation: customStyle.elevation ?? 8.0,
      padding: customStyle.padding ??
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      margin:
          customStyle.margin ?? const EdgeInsets.symmetric(horizontal: 24.0),
      textStyle: customStyle.textStyle,
      width: customStyle.width,
      border: customStyle.border,
      boxShadow: customStyle.boxShadow,
      gradient: customStyle.gradient,
    );
  }

  OverlayEntry _createOverlayEntry(
    BuildContext context,
    String message,
    SnackbarStyle style,
    SnackbarPosition position,
    int animationDuration,
    bool dismissible,
    VoidCallback? onTap,
    String? actionLabel,
    VoidCallback? onActionPressed,
    bool showCloseIcon,
  ) {
    return OverlayEntry(
      builder: (context) {
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: -100, end: 0),
          duration: Duration(milliseconds: animationDuration),
          curve: Curves.easeOutCubic,
          builder: (context, value, child) {
            return Positioned(
              top: MediaQuery.of(context).viewInsets.top +
                  MediaQuery.of(context).padding.top +
                  16.0 +
                  value,
              left: position == SnackbarPosition.topRight
                  ? null
                  : (style.margin?.left ?? 24.0),
              right: position == SnackbarPosition.topLeft
                  ? null
                  : (style.margin?.right ?? 24.0),
              child: SizedBox(
                width: position == SnackbarPosition.top
                    ? (style.width ?? MediaQuery.of(context).size.width - 48.0)
                    : (style.width ?? MediaQuery.of(context).size.width * 0.8),
                child: Opacity(
                  opacity: (value + 100) / 100,
                  child: child,
                ),
              ),
            );
          },
          child: Material(
            color: Colors.transparent,
            elevation: style.elevation ?? 8.0,
            borderRadius: BorderRadius.circular(style.borderRadius ?? 12.0),
            child: GestureDetector(
              onTap: dismissible
                  ? () {
                      hide();
                      onTap?.call();
                    }
                  : onTap,
              child: Container(
                padding: style.padding ??
                    const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: style.gradient == null ? style.backgroundColor : null,
                  gradient: style.gradient,
                  borderRadius:
                      BorderRadius.circular(style.borderRadius ?? 12.0),
                  border: style.border,
                  boxShadow: style.boxShadow,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (style.icon != null)
                      Icon(
                        style.icon,
                        color: style.iconColor,
                        size: 24,
                      ),
                    if (style.icon != null) const SizedBox(width: 12.0),
                    Expanded(
                      child: Text(
                        message,
                        style: style.textStyle ??
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: style.textColor,
                                  fontWeight: FontWeight.w500,
                                ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    if (actionLabel != null && onActionPressed != null) ...[
                      const SizedBox(width: 8.0),
                      TextButton(
                        onPressed: () {
                          onActionPressed();
                          hide();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: style.textColor,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          minimumSize: const Size(0, 32),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          actionLabel,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: style.textColor,
                          ),
                        ),
                      ),
                    ],
                    if (showCloseIcon) ...[
                      const SizedBox(width: 8.0),
                      InkWell(
                        onTap: hide,
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.close,
                            color: style.textColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
