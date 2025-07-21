import 'widget.dart';

// ignore: must_be_immutable
class MainBtnWiget extends StatelessWidget {
  MainBtnWiget({super.key, required this.title, required this.onTap});
  String title;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 322.w,
        height: 66.h,
        decoration: mainBtnDecoration,
        child: Center(
          child: Text(title.toUpperCase(), style: textStyleCreateBtn),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class NewInformationBtnWiget extends StatelessWidget {
  NewInformationBtnWiget({super.key, required this.title, required this.onTap});
  String title;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280.w,
        height: 42.h,
        decoration: newInformationColorDecoration,
        child: Center(
          child: Text(title.toUpperCase(), style: textStyleNewInformatioCard),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CreateBtnWidget extends StatelessWidget {
  CreateBtnWidget({super.key, required this.isValid, this.title = "SAVE"});
  String title;
  bool isValid;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 322.w,
      height: 66.h,
      decoration: createBtnDecoration(isValid),
      child: Center(child: Text(title, style: textStyleCreateBtn)),
    );
  }
}
