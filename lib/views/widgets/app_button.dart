import '../../ui.dart';

extension _MaterialStateUtils on Set<MaterialState> {
  Set<MaterialState> get activeStates => {
    MaterialState.pressed,
    MaterialState.selected,
  };

  bool get hasActiveStates {
    return intersection(activeStates).isNotEmpty;
  }

  bool get hasHovered => contains(MaterialState.hovered);
}

class AppButtonChild extends StatelessWidget {
  const AppButtonChild(
      this.text, {
        super.key,
        this.prefixIcon,
        this.mainAxisAlignment = MainAxisAlignment.center,
        this.suffixIcon,
      });

  final String text;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: <Widget>[
        if (prefixIcon != null) ...<Widget>[
          IconTheme(
            data: IconTheme.of(context).copyWith(size: 18),
            child: prefixIcon!,
          ),
          const SizedBox(width: 8),
        ],
        Text(text),
        if (suffixIcon != null) ...<Widget>[
          const SizedBox(width: 12),
          IconTheme(
            data: IconTheme.of(context).copyWith(size: 18),
            child: suffixIcon!,
          ),
        ],
      ],
    );
  }
}

/// Defines the base of the AppButton
abstract class _AppButton extends StatelessWidget {
  const _AppButton({
    super.key,
    this.onPressed,
    required this.child,
  });

  final AppButtonChild child;
  final VoidCallback? onPressed;

  OutlinedBorder? resolveButtonShape(
      BuildContext context, Set<MaterialState> states) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    );
  }

  Color resolveOverlayColor(BuildContext context, Set<MaterialState> states) {
    return Colors.black12;
  }

  Color resolveBackgroundColor(BuildContext context, Set<MaterialState> states);

  Color resolveForegroundColor(BuildContext context, Set<MaterialState> states);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: getButtonStyle(context),
      child: child,
    );
  }

  ButtonStyle getButtonStyle(BuildContext context) {
    return ButtonStyle(
      splashFactory: Theme.of(context).splashFactory,
      animationDuration: Duration.zero,
      shape: MaterialStateProperty.resolveWith(
            (s) => resolveButtonShape(context, s),
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 18,
        ),
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
              (Set<MaterialState> s) => resolveForegroundColor(context, s)),
      overlayColor: MaterialStateProperty.resolveWith(
              (Set<MaterialState> s) => resolveOverlayColor(context, s)),
      backgroundColor: MaterialStateProperty.resolveWith(
            (Set<MaterialState> s) => resolveBackgroundColor(context, s),
      ),
    );
  }
}

class AppButton extends _AppButton {
  const AppButton({
    super.key,
    super.onPressed,
    required super.child,
  });

  @override
  Color resolveBackgroundColor(
      BuildContext context,
      Set<MaterialState> states,
      ) {
    if (states.hasActiveStates) {
      return context.appTheme.appDefaultActiveColor;
    }
    if (states.hasHovered) {
      return context.appTheme.appDefaultHoverColor;
    }

    return context.appTheme.appDefaultColor;
  }

  @override
  Color resolveForegroundColor(
      BuildContext context,
      Set<MaterialState> states,
      ) {
    return context.appTheme.defaultButtonTextColor;
  }
}

class AppPrimaryButton extends _AppButton {
  const AppPrimaryButton({
    super.key,
    super.onPressed,
    required super.child,
  });

  @override
  Color resolveBackgroundColor(
      BuildContext context,
      Set<MaterialState> states,
      ) {
    if (states.hasActiveStates) {
      return context.appTheme.appPrimaryActiveColor;
    }
    if (states.hasHovered) {
      return context.appTheme.appPrimaryHoverColor;
    }

    return context.appTheme.appPrimaryColor;
  }

  @override
  Color resolveForegroundColor(
      BuildContext context,
      Set<MaterialState> states,
      ) {
    return context.appTheme.primaryButtonTextColor;
  }
}

class AppSecondaryButton extends _AppButton {
  const AppSecondaryButton({
    super.key,
    super.onPressed,
    required super.child,
  });

  @override
  Color resolveBackgroundColor(
      BuildContext context,
      Set<MaterialState> states,
      ) {
    if (states.hasActiveStates) {
      return context.appTheme.appSecondaryActiveColor;
    }
    if (states.hasHovered) {
      return context.appTheme.appSecondaryHoverColor;
    }
    return context.appTheme.appSecondaryColor;
  }

  @override
  Color resolveForegroundColor(
      BuildContext context,
      Set<MaterialState> states,
      ) {
    return context.appTheme.secondaryButtonTextColor;
  }
}

class AppPopupButton extends _AppButton {
  const AppPopupButton({
    super.key,
    super.onPressed,
    required super.child,
  });

  @override
  ButtonStyle getButtonStyle(BuildContext context) {
    return super.getButtonStyle(context).copyWith(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: 23,
        ),
      ),
      minimumSize: MaterialStateProperty.all(
        const Size(32, 50),
      ),
    );
  }

  @override
  Color resolveOverlayColor(BuildContext context, Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return context.appTheme.appPrimaryColor;
    }

    return context.theme.cardColor;
  }

  @override
  Color resolveBackgroundColor(
      BuildContext context,
      Set<MaterialState> states,
      ) {
    if (states.contains(MaterialState.pressed)) {
      return context.appTheme.appPrimaryColor;
    }

    return context.theme.cardColor;
  }

  @override
  Color resolveForegroundColor(
      BuildContext context,
      Set<MaterialState> states,
      ) {
    if (states.contains(MaterialState.pressed)) {
      return context.appTheme.textSecondaryColor;
    }
    return context.appTheme.popupDefaultColor;
  }

  @override
  OutlinedBorder? resolveButtonShape(
      BuildContext context, Set<MaterialState> states) {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    );
  }
}

class AppTagButton extends AppPrimaryButton {
  const AppTagButton({required super.child, super.onPressed, super.key});

  @override
  ButtonStyle getButtonStyle(BuildContext context) {
    return super.getButtonStyle(context).copyWith(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      minimumSize: MaterialStateProperty.all(
        const Size(32, 32),
      ),
      maximumSize: MaterialStateProperty.all(
        const Size(80, 32),
      ),
    );
  }
}