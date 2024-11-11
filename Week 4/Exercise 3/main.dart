import 'package:flutter/material.dart';
void main() {
  runApp(const MyCustomButtonApp());
}
class MyCustomButtonApp extends StatelessWidget {
  const MyCustomButtonApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Unique Buttons"),
          backgroundColor: Colors.deepPurple,
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomActionButton(
                label: "Confirm",
                icon: Icons.check,
                iconAlignment: IconPosition.right,
                buttonType: ButtonType.primary,
              ),
              SizedBox(height: 12),
              CustomActionButton(
                label: "Reminder",
                icon: Icons.alarm,
                iconAlignment: IconPosition.left,
                buttonType: ButtonType.secondary,
              ),
              SizedBox(height: 12),
              CustomActionButton(
                label: "Settings",
                icon: Icons.settings,
                iconAlignment: IconPosition.right,
                buttonType: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
enum ButtonType {
  primary(Colors.purple),
  secondary(Colors.amber),
  disabled(Colors.grey);
  final Color color;
  const ButtonType(this.color);
}
enum IconPosition { left, right }
class CustomActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconAlignment;
  final ButtonType buttonType;
  const CustomActionButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconAlignment = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: buttonType.color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        onPressed: null,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconAlignment == IconPosition.left) ...[
                Icon(icon, color: Colors.white),
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              if (iconAlignment == IconPosition.right) ...[
                const SizedBox(width: 8),
                Icon(icon, color: Colors.white),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
