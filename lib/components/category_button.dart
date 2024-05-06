import 'package:flutter/cupertino.dart';

class CategoryButton extends StatelessWidget {
  final Color color;
  final String label;
  final IconData icon;

  const CategoryButton({super.key,
    required this.color,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          width: 55,
          height: 55,
          child: Center(child: Icon(icon)),
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
