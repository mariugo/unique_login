import 'package:flutter/material.dart';
import '/presentation/ui/theme/design_system.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool hasBorder;
  final Function onTap;

  const ButtonWidget({
    Key? key,
    required this.title,
    required this.hasBorder,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: hasBorder
              ? DesignSystem.secondaryColor
              : DesignSystem.primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: hasBorder
              ? Border.all(
                  color: DesignSystem.primaryColor,
                  width: 1.0,
                )
              : const Border.fromBorderSide(
                  BorderSide.none,
                ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => onTap(),
          child: SizedBox(
            height: 60.0,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: hasBorder ? DesignSystem.primaryColor : Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
