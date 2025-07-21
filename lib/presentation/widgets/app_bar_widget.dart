import 'widget.dart';

// ignore: must_be_immutable
class AppBarWidget extends StatelessWidget {
  AppBarWidget({super.key, required this.title, this.onTap});
  String title;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 352.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new, color: iconColor, size: 30.w),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: onTap != null ? 0 : 30.w),
              child: Text(
                title.toUpperCase(),
                textAlign: TextAlign.center,
                style: textStyleAppBar,
              ),
            ),
          ),
          if (onTap != null)
            GestureDetector(
              onTap: onTap!,
              child: Icon(Icons.add, color: iconColor, size: 30.w),
            ),
        ],
      ),
    );
  }
}
