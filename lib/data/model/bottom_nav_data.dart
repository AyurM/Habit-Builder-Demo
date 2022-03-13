class BottomNavData {
  final String imagePath;
  final void Function()? onPressed;

  const BottomNavData({
    required this.imagePath,
    this.onPressed,
  });
}
