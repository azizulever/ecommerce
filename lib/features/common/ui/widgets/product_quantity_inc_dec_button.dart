import 'package:flutter/material.dart';
import 'package:projects/app/app_colors.dart';

class ProductQuantityIncDecButton extends StatefulWidget {
  const ProductQuantityIncDecButton({super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<ProductQuantityIncDecButton> createState() =>
      _ProductQuantityIncDecButtonState();
}

class _ProductQuantityIncDecButtonState
    extends State<ProductQuantityIncDecButton> {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(
          icon: Icons.remove,
          backgroundColor: Color(0xFF01D1D6),
          onTap: () {
            if (_count > 1) {
              _count--;
              widget.onChange(_count);
              setState(() {});
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            '$_count',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        _buildIconButton(
          icon: Icons.add,
          backgroundColor: AppColors.themeColor,
          onTap: () {
            if (_count < 20) {
              _count++;
              widget.onChange(_count);
              setState(() {});
            }
          },
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
